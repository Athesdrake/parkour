from aiotfm.connection import TFMProtocol

import aiohttp
import asyncio
import aiotfm
import random
import string
import time
import re
import os
import sys

SEND_OTHER = (1 << 8) + 255
SEND_ROOM = (2 << 8) + 255
SEND_WEBHOOK = (3 << 8) + 255
MODIFY_RANK = (4 << 8) + 255
SYNCHRONIZE = (5 << 8) + 255
HEARTBEAT = (6 << 8) + 255
CHANGE_MAP = (7 << 8) + 255
FILE_LOADED = (8 << 8) + 255
CURRENT_MODCHAT = (9 << 8) + 255
NEW_MODCHAT = (10 << 8) + 255
LOAD_MAP = (11 << 8) + 255

class CustomProtocol(TFMProtocol):
	def connection_lost(self, exc):
		super().connection_lost(exc)
		if self.client.auto_restart and exc is None:
			self.client.loop.create_task(self.client.restart_soon())

class Connection(aiotfm.Connection):
	PROTOCOL = CustomProtocol

	def _factory(self):
		return Connection.PROTOCOL(self)

class Client(aiotfm.Client):
	def __init__(self, *args, **kwargs):
		super().__init__(*args, **kwargs)

		self.time_diff = 0
		self.player_ranks = {}
		self.ranks = {}
		self.waiting_ids = []
		self.webhook_links = {
			"**`[UPDATE]:`**": os.getenv("GAME_LOGS_WEBHOOK"),
			"**`[CRASH]:`**": os.getenv("GAME_LOGS_WEBHOOK"),
			"**`[SUS]:`**": os.getenv("SUSPECT_WEBHOOK"),
			"**`[SUS2]:`**": os.getenv("SUSPECT2_WEBHOOK"),
			"**`[BANS]:`**": os.getenv("SANCTIONS_WEBHOOK"),
			"**`[KILL]:`**": os.getenv("SANCTIONS_WEBHOOK"),
			"**`[RANKS]:`**": os.getenv("RANKS_WEBHOOK"),
			"**`[JOIN]:`**": os.getenv("JOIN_WEBHOOK")
		}
		self.default_webhook = os.getenv("DEFAULT_WEBHOOK")
		self.mod_chat_webhook = os.getenv("MOD_CHAT_WEBHOOK")
		self.mod_chat_announcement_webhook = os.getenv("MOD_CHAT_ANNOUNCEMENT_WEBHOOK")
		self.heroku_token = os.getenv("HEROKU_TOKEN")
		self.mod_chat = None
		self.mod_chat_name = None
		self.next_available_restart = 0
		self.restarting = False

	def tfm_time(self):
		return (time.time() + self.time_diff) * 1000

	async def restart_dyno(self):
		async with aiohttp.ClientSession() as session:
			await session.delete(
				"https://api.heroku.com/apps/parkour-bot/dynos/parkour",
				headers={
					"Content-Type": "application/json",
					"Accept": "application/vnd.heroku+json; version=3",
					"Authorization": "Bearer " + self.heroku_token
				}
			)

	async def restart(self, *args):
		await self.restart_dyno()

	async def connect(self, *args, **kwargs):
		try:
			return await super().connect(*args, **kwargs)
		except:
			await self.restart_dyno()

	async def handle_packet(self, conn, packet):
		CCC = packet.readCode()
		if CCC == (29, 20):
			self.dispatch("lua_textarea", packet.read32(), packet.readUTF())

		packet.pos = 0
		await super().handle_packet(conn, packet)

	async def on_login_ready(self, *args):
		print("[PARKOUR] Connected. Logging in...", flush=True)
		await self.login("Parkour#8558", os.getenv("PARKOUR_PASSWORD"), encrypted=False, room="*#parkour4bots")

	async def on_logged(self, *args):
		print("[PARKOUR] Logged in!", flush=True)
		self.next_available_restart = time.time() + 600

	def sendLuaCallback(self, txt_id, text): # returns a coro
		return self.bulle.send(aiotfm.Packet.new(29, 21).write32(txt_id).writeString(text))

	def sendRoomPacket(self, packet_id, packet): # returns a coro
		if isinstance(packet, str):
			packet = packet.encode()
		return self.sendLuaCallback(SEND_ROOM, str(packet_id).encode() + b"\x00" + packet)

	async def on_lua_textarea(self, txt_id, text):
		if txt_id & 255 != 255:
			return

		if txt_id == SEND_WEBHOOK:
			self.dispatch("send_webhook", text)

		elif txt_id == SYNCHRONIZE:
			now = time.time()

			lua_time, ranks, staff = text.split("\x00", 2)
			self.time_diff = int(lua_time) // 1000 - now

			self.player_ranks = {}
			self.ranks = {}

			for rank in ranks.split("\x01"):
				self.ranks[rank] = False

			for data in staff.split("\x00"):
				player, *ranks = data.split("\x01")
				player = self.normalize_name(player)

				self.player_ranks[player] = self.ranks.copy()
				for rank in ranks:
					self.player_ranks[player][rank] = True

		elif txt_id == CURRENT_MODCHAT:
			if text == self.mod_chat_name:
				return

			self.mod_chat_name = text
			if self.mod_chat is not None:
				await self.mod_chat.leave()

			await asyncio.sleep(5.0)
			await self.joinChannel(self.mod_chat_name, permanent=False)

		elif txt_id == SEND_OTHER:
			head, data = text.split("\x00", 1)

			if head == "modchat":
				await self.mod_chat.send(data)

			elif head == "fetchid":
				if "\x00" not in data:
					return self.dispatch("player_id_response", data, None)

				name, id = data.split("\x00", 1)
				self.dispatch("player_id_response", name, int(id))

			elif head == "update":
				self.dispatch("send_webhook", "**`[UPDATE]:`** The game is gonna update soon.")

	async def on_channel_joined(self, channel):
		if channel.name != self.mod_chat_name:
			return
		self.mod_chat = channel

	async def get_player_id(self, player_name):
		player_name = player_name.replace("#", "%23").replace("+", "%2B")
		if player_name not in self.waiting_ids:
			self.waiting_ids.append(player_name)

			await self.sendCommand("profile Tocutoeltuco#5522")
			try:
				profile = await self.wait_for("on_profile", lambda p: p.username == "Tocutoeltuco#5522", timeout=3.0)
			except:
				return

			await self.sendLuaCallback(SEND_OTHER, "fetchid\x00" + player_name)

		try:
			n, i = await self.wait_for("on_player_id_response", lambda n, i: n == player_name, timeout=10.0)
			return i
		except:
			return

	async def get_player_name(self, player_id):
		async with aiohttp.ClientSession() as session:
			async with session.get("https://atelier801.com/profile?pr={}".format(player_id)) as resp:
				match = re.search(
					rb'> ([^<]+)<span class="nav-header-hashtag">(#\d{4})<\/span>',
					await resp.read()
				)
				if match is None:
					return
				return match.group(1).decode() + match.group(2).decode()

	async def on_send_webhook(self, text, link=None):
		if isinstance(text, bytes):
			text = text.decode()

		if link is None:
			head = text.split(" ")[0]
			if head in self.webhook_links:
				link = self.webhook_links[head]
			else:
				link = self.default_webhook

		async with aiohttp.ClientSession() as session:
			await session.post(link, json={
				"content": text
			}, headers={
				"Content-Type": "application/json"
			})

	def normalize_name(self, name):
		if name[0] == "+":
			name = "+" + (name[1:].capitalize())
		else:
			name = name.capitalize()
		if "#" not in name:
			name += "#0000"
		return name

	async def on_whisper(self, whisper):
		args = whisper.content.split(" ")
		cmd = args.pop(0).lower()
		if not cmd.startswith("."):
			return
		cmd = cmd[1:]

		author = self.normalize_name(whisper.author.username)
		ranks = self.player_ranks[author] if author in self.player_ranks else self.ranks

		if cmd == "announce":
			if not ranks["admin"]:
				return
			if not args:
				return await whisper.reply("Invalid syntax.")

			await self.sendRoomPacket(4, " ".join(args))
			await whisper.reply("Announced!")
			self.dispatch("send_webhook", "**`[ANNOUNCEMENT]:`** **{}** announced `{}`".format(author, " ".join(args)))

		elif cmd == "update":
			if not ranks["admin"]:
				return

			if len(args) < 1:
				return await whisper.reply("Invalid syntax.")

			if "yes" != args[1] != "no":
				return await whisper.reply("Invalid syntax.")

			await self.sendLuaCallback(SEND_OTHER, "update\x00{}".format(args[1]))
			await whisper.reply("Update alert sent.")

		elif cmd == "rank":
			if not ranks["admin"] and not ranks["manager"]:
				return
			if len(args) < 3:
				return await whisper.reply("Invalid syntax.")

			action = args[0].lower()
			if action not in ("add", "rem"):
				return await whisper.reply("Invalid action: '{}'.".format(action))

			rank = args[2].lower()
			if rank not in self.ranks:
				return await whisper.reply("Invalid rank: '{}'.".format(rank))

			player = self.normalize_name(args[1])
			packet = [player, None, rank]

			if action == "add":
				if player not in self.player_ranks:
					self.player_ranks[player] = self.ranks.copy()
				self.player_ranks[player][rank] = True

				webhook, action = "now", "Added"
				packet[1] = "1"

			else:
				if player in self.player_ranks:
					self.player_ranks[player][rank] = False

				webhook, action = "no longer", "Removed"
				packet[1] = "0"

			await self.sendLuaCallback(MODIFY_RANK, "\x00".join(packet))
			self.dispatch("send_webhook", "**`[RANKS]:`** `{}` is {} a `parkour-{}` (changed by `{}`)".format(player, webhook, rank, author))
			await whisper.reply("{} rank '{}' from '{}'.".format(action, rank, player))

		elif cmd == "ban" or cmd == "unban":
			if not ranks["admin"] and not ranks["mod"]:
				return

			if cmd == "unban":
				if not args:
					return await whisper.reply("Invalid syntax.")

				minutes = 0
			elif len(args) < 2 or not args[1].isdigit():
				return await whisper.reply("Invalid syntax.")
			else:
				minutes = int(args[1])

			if args[0].isdigit():
				id = int(args[0])
				name = await self.get_player_name(id)
				if name is None:
					return await whisper.reply("Could not find that player.")

				name = self.normalize_name(name)
			elif re.match(r"^\+?[a-z0-9_]+(?:#\d{4})?", args[0].lower()) is None:
				return await whisper.reply("Invalid name.")
			else:
				name = self.normalize_name(args[0])
				id = await self.get_player_id(name)
				if id is None:
					return await whisper.reply("Could not get the ID of the player.")

			if minutes == 0:
				self.dispatch("send_webhook", "**`[BANS]:`** `{}` has unbanned `{}` (ID: `{}`)".format(author, name, id))
			elif minutes == 1:
				self.dispatch("send_webhook", "**`[BANS]:`** `{}` has permbanned `{}` (ID: `{}`)".format(author, name, id))
			else:
				self.dispatch("send_webhook", "**`[BANS]:`** `{}` has banned `{}` (ID: `{}`) for `{}` minutes.".format(author, name, id, minutes))
				minutes *= 60 * 1000 # make it milliseconds
				minutes += self.tfm_time() # sync it with transformice

			await self.sendRoomPacket(3, "\x00".join((name, str(id), str(minutes))))
			await whisper.reply("Action applied.")

		elif cmd == "kill":
			if not ranks["admin"] and not ranks["mod"] and not ranks["trainee"]:
				return

			if len(args) < 2 or not args[1].isdigit():
				return await whisper.reply("Invalid syntax.")
			else:
				minutes = int(args[1])

			if args[0].isdigit():
				id = int(args[0])
				name = await self.get_player_name(id)
				if name is None:
					return await whisper.reply("Could not find that player.")

				name = self.normalize_name(name)
			elif re.match(r"^\+?[a-z0-9_]+(?:#\d{4})?", args[0].lower()) is None:
				return await whisper.reply("Invalid name.")
			else:
				name = self.normalize_name(args[0])
				id = await self.get_player_id(name)
				if id is None:
					id = "unknown"

			for attempt in range(2):
				try:
					await self.sendCommand("profile " + name)
					profile = await self.wait_for("on_profile", lambda p: self.normalize_name(p.username) == name, timeout=3.0)
					break
				except:
					continue
			else:
				return await whisper.reply("That player ({}) is not online.".format(name))

			self.dispatch("send_webhook", "**`[KILL]:`** `{}` has killed `{}` (ID: `{}`) for `{}` minutes.".format(author, name, id, minutes))
			await self.sendRoomPacket(2, "\x00".join((name, str(minutes))))
			await whisper.reply("Action applied.")

		elif cmd == "whois":
			if not ranks["admin"] and not ranks["mod"] and not ranks["trainee"]:
				return
			if not args:
				return await whisper.reply("Invalid syntax.")

			if args[0].isdigit():
				name = await self.get_player_name(args[0])
				if name is None:
					return await whisper.reply("Could not get the name of the player.")
				await whisper.reply(name)

			else:
				if re.match(r"^\+?[a-z0-9_]+(?:#\d{4})?", args[0].lower()) is None:
					return await whisper.reply("Invalid name.")

				id = await self.get_player_id(self.normalize_name(args[0]))
				if id is None:
					return await whisper.reply("Could not get the ID of the player.")
				await whisper.reply(str(id))

		elif cmd == "join":
			if not ranks["admin"] and not ranks["mod"] and not ranks["trainee"]:
				return
			if not args:
				return await whisper.reply("Invalid syntax.")

			room = " ".join(args)
			if re.match(r"^(?:(?:[a-z][a-z]|e2)-|\*)#parkour(?:$|\d.*)", room) is None:
				return await whisper.reply("The given room is invalid. You can only join #parkour rooms.")

			self.dispatch("send_webhook", "**`[JOIN]:`** `{}` requested to join `{}`.".format(author, room))
			await self.sendRoomPacket(0, room)
			await whisper.reply("Room join request has been sent.")

		elif cmd == "reboot":
			if ranks["admin"]:
				pass
			elif not ranks["mod"] and not ranks["trainee"]:
				return
			elif time.time() < self.next_available_restart:
				return await whisper.reply(
					"You need to wait {} seconds to restart the bot. Call an admin otherwise.".format(self.next_available_restart - time.time())
				)

			await self.restart_dyno()

		elif cmd == "whoami":
			total = 0
			ranks_list = []
			for rank, has in ranks.items():
				if has:
					total += 1
					ranks_list.append(rank)

			if total > 0:
				await whisper.reply("You are {}. You have {} rank(s) and they are: {}.".format(author, total, ", ".join(ranks_list)))

		elif cmd == "modchat":
			if not ranks["admin"] and not ranks["mod"] and not ranks["trainee"]:
				return

			if self.mod_chat is None:
				return await whisper.reply("Could not connect to the moderator chat.")
			return await whisper.reply("The current moderator chat is {}".format(self.mod_chat.name))

		elif cmd == "newmodchat":
			if not ranks["admin"]:
				return

			self.dispatch("generate_new_mod_chat")

	async def on_channel_message(self, msg):
		if msg.channel != self.mod_chat:
			return

		content = msg.content.replace("`", "'").replace("&lt;", "<").replace("&amp;", "&")
		message = "` `".join(content.split(" "))
		message = re.sub(r"`((https?://(?:-\.)?(?:[^\s/?\.#-]+\.?)+(?:/[^\s]*)?))`", r"\1", "`" + message + "`")

		self.dispatch(
			"send_webhook",
			"`[{}]` `[{}]` {}".format(
				msg.community.name, self.normalize_name(msg.author), message
			),
			self.mod_chat_webhook
		)

	async def on_heartbeat(self, took):
		if self.mod_chat is not None:
			try:
				players = await self.mod_chat.who()
			except:
				return print("timeout!")
			players = map(lambda p: self.normalize_name(p.username), players)

			for player in players:
				if player == "Parkour#8558":
					continue

				ranks = self.player_ranks[player] if player in self.player_ranks else None
				if ranks is None or (not ranks["admin"] and not ranks["mod"] and not ranks["trainee"]):
					# intruder!
					await self.mod_chat.send("Intruder alert: {}".format(player))
					await asyncio.sleep(3.0)
					return self.dispatch("generate_new_mod_chat")

	async def on_generate_new_mod_chat(self):
		chat = "".join(random.choice(string.ascii_letters) for x in range(10))

		self.dispatch("send_webhook", "There's a new moderator chat: `{}`".format(chat), self.mod_chat_announcement_webhook)
		self.dispatch("send_webhook", "Switching chats.", self.mod_chat_webhook)
		await self.mod_chat.send("There's a new moderator chat. It's been posted in discord. Please leave this one as soon as possible.")

		await self.sendLuaCallback(NEW_MODCHAT, chat)