translations.en = {
	name = "en",

	-- Error messages
	corrupt_map = "<r>Corrupt map. Loading another.",
	corrupt_map_vanilla = "<r>[ERROR] <n>Can not get information of this map.",
	corrupt_map_mouse_start = "<r>[ERROR] <n>This map needs to have a start position (mouse spawn point).",
	corrupt_map_needing_chair = "<r>[ERROR] <n>The map needs to have the end chair.",
	corrupt_map_missing_checkpoints = "<r>[ERROR] <n>The map needs to have at least one checkpoint (yellow nail).",
	corrupt_data = "<r>Unfortunately, your data was corrupt and has been reset.",
	min_players = "<r>To save your data, there must be at least 4 unique players in the room. <bl>[%s/%s]",
	tribe_house = "<r>Data will not be saved in tribehouses.",
	invalid_syntax = "<r>Invalid syntax.",
	user_not_in_room = "<r>The user <n2>%s</n2> is not in the room.",
	arg_must_be_id = "<r>The argument must be a valid id.",
	cant_update = "<r>Can't update player ranks right now. Try again later.",
	cant_edit = "<r>You can't edit <n2>%s's</n2> ranks.",
	invalid_rank = "<r>Invalid rank: <n2>%s",
	code_error = "<r>An error appeared: <bl>%s-%s-%s %s",
	panic_mode = "<r>Module is now entering panic mode.",
	public_panic = "<r>Please wait until a bot arrives and restarts the module.",
	tribe_panic = "<r>Please type <n2>/module parkour</n2> to restart the module.",
	emergency_mode = "<r>Initiating emergency shutdown, no new players allowed. Please go to another #parkour room.",
	bot_requested = "<r>The bot has been requested. It should be arriving in a moment.",
	stream_failure = "<r>Internal stream channel failure. Can not transmit data.",
	maps_not_available = "<r>#parkour's 'maps' submode is only available in <n2>*#parkour0maps</n2>.",
	version_mismatch = "<r>Bot (<d>%s</d>) and lua (<d>%s</d>) versions do not match. Can't start the system.",
	missing_bot = "<r>Bot missing. Wait until the bot arrives or ping @Tocu#0018 on discord: <d>%s</d>",
	invalid_length = "<r>Your message must have between 10 and 100 characters. It has <n2>%s</n2> characters.",
	invalid_map = "<r>Invalid map.",
	map_does_not_exist = "<r>The given map does not exist or can't be loaded. Try again later.",
	invalid_map_perm = "<r>The given map is not P22 or P41.",
	invalid_map_perm_specific = "<r>The given map is not in P%s.",
	cant_use_this_map = "<r>The given map has a small bug and can't be used.",
	invalid_map_p41 = "<r>The given map is in P41, but is not in the module map list.",
	invalid_map_p22 = "<r>The given map is in P22, but is in the module map list.",
	map_already_voting = "<r>The given map already has an open votation.",
	not_enough_permissions = "<r>You don't have enough permissions to do this.",
	already_depermed = "<r>The given map is already depermed.",
	already_permed = "<r>The given map is already permed.",
	cant_perm_right_now = "<r>Can't change the perm of this map right now. Try again later.",
	already_killed = "<r>The player %s has been already killed.",
	leaderboard_not_loaded = "<r>The leaderboard has not been loaded yet. Wait a minute.",

	-- Help window
	help = "Help",
	staff = "Staff",
	rules = "Rules",
	contribute = "Contribute",
	changelog = "News",
	help_help = "<p align = 'center'><font size = '14'>Welcome to <T>#parkour!</T></font></p>\n<font size = '12'><p align='center'><J>Your goal is to reach all the checkpoints until you complete the map.</J></p>\n\n<N>• Press <O>O</O>, type <O>!op</O> or click the <O>configuration button</O> to open the <T>options menu</T>.\n• Press <O>P</O> or click the <O>hand icon</O> at the top-right to open the <T>powers menu</T>.\n• Press <O>L</O> or type <O>!lb</O> to open the <T>leaderboard</T>.\n• Press the <O>M</O> or <O>Delete</O> key to <T>/mort</T>, you can toggle the keys in the <J>Options</J> menu.\n• To know more about our <O>staff</O> and the <O>rules of parkour</O>, click on the <T>Staff</T> and <T>Rules</T> tab respectively.\n• Click <a href='event:discord'><o>here</o></a> to get the discord invite link and <a href='event:map_submission'><o>here</o></a> to get the map submission topic link.\n• Use <o>up</o> and <o>down</o> arrow keys when you need to scroll.\n\n<p align = 'center'><font size = '13'><T>Contributions are now open! For further details, click on the <O>Contribute</O> tab!</T></font></p>",
	help_staff = "<p align = 'center'><font size = '13'><r>DISCLAIMER: Parkour staff ARE NOT Transformice staff and DO NOT have any power in the game itself, only within the module.</r>\nParkour staff ensure that the module runs smoothly with minimal issues, and are always available to assist players whenever necessary.</font></p>\nYou can type <D>!staff</D> in the chat to see the staff list.\n\n<font color = '#E7342A'>Administrators:</font> They are responsible for maintaining the module itself by adding new updates and fixing bugs.\n\n<font color = '#843DA4'>Team Managers:</font> They oversee the Moderator and Mapper teams, making sure they are performing their jobs well. They are also responsible for recruiting new members to the staff team.\n\n<font color = '#FFAAAA'>Moderators:</font> They are responsible for enforcing the rules of the module and punishing individuals who do not follow them.\n\n<font color = '#25C059'>Mappers:</font> They are responsible for reviewing, adding, and removing maps within the module to ensure that you have an enjoyable gameplay.",
	help_rules = "<font size = '13'><B><J>All rules in the Transformice Terms and Conditions also apply to #parkour</J></B></font>\n\nIf you find any player breaking these rules, whisper the parkour mods in-game. If no mods are online, then it is recommended to report it in the discord server.\nWhen reporting, please include the server, room name, and player name.\n• Ex: en-#parkour10 Blank#3495 trolling\nEvidence, such as screenshots, videos and gifs are helpful and appreciated, but not necessary.\n\n<font size = '11'>• No <font color = '#ef1111'>hacks, glitches or bugs</font> are to be used in #parkour rooms\n• <font color = '#ef1111'>VPN farming</font> will be considered an <B>exploit</B> and is not allowed. <p align = 'center'><font color = '#cc2222' size = '12'><B>\nAnyone caught breaking these rules will be immediately banned.</B></font></p>\n\n<font size = '12'>Transformice allows the concept of trolling. However, <font color='#cc2222'><B>we will not allow it in parkour.</B></font></font>\n\n<p align = 'center'><J>Trolling is when a player intentionally uses their powers to prevent other players from finishing the map.</j></p>\n• Revenge trolling is <B>not a valid reason</B> to troll someone and you will still be punished.\n• Forcing help onto players trying to solo the map and refusing to stop when asked is also considered trolling.\n• <J>If a player does not want help or prefers to solo a map, please try your best to help other players</J>. However if another player needs help in the same checkpoint as the solo player, you can help them [both].\n\nIf a player is caught trolling, they will be punished on either a time or parkour round basis. Note that repeated trolling will lead to longer and more severe punishments.",
	help_contribute = "<font size='14'>\n<p align='center'>The parkour management team loves open source code because it <t>helps the community</t>. You can <o>view</o> and <o>modify</o> the source code on <o><u><a href='event:github'>GitHub</a></u></o>.\n\nMaintaining the module is <t>strictly voluntary</t>, so any help regarding <t>code</t>, <t>bug reports</t>, <t>suggestions</t> and <t>creating maps</t> is always <u>welcome and appreciated</u>.\nYou can <vp>report bugs</vp> and <vp>give suggestions</vp> on <o><u><a href='event:discord'>Discord</a></u></o> and/or <o><u><a href='event:github'>GitHub</a></u></o>.\nYou can <vp>submit your maps</vp> in our <o><u><a href='event:map_submission'>Forum Thread</a></u></o>.\n\nMaintaining parkour is not expensive, but it is not free either. We'd love if you could help us by <t>donating any amount</t> <o><u><a href='event:donate'>here</a></u></o>.\n<u>All donations will go towards improving the module.</u></p>",
	help_changelog = "<font size='13'><p align='center'><o>Version 2.2.0 - 08/05/2020</o></p>\n\n• Improved the module infrastructure.\n\t\t• The module is <o>a bit more stable</o>.\n• Added a bot (<o>Parkour#8558</o>) which will soon be used for discord.\n• <vp>New powers!</vp>\n\t\t• If you're in the leaderboard (press <t>L</t> to open) you can spawn <t>toilets</t>! <o>There is a surprise when they despawn...</o>\n\t\t• If you have enough maps, you can also spawn a <t>big box</t> and a <t>trampoline</t>!",

	-- Congratulation messages
	reached_level = "<d>Congratulations! You've reached level <vp>%s</vp>.",
	finished = "<d><o>%s</o> finished the parkour in <vp>%s</vp> seconds, <fc>congratulations!",
	unlocked_power = "<ce><d>%s</d> unlocked the <vp>%s</vp> power.",
	enjoy = "<d>Enjoy your new skills!",

	-- Information messages
	paused_events = "<cep><b>[Warning!]</b> <n>The module has reached it's critical limit and is being paused.",
	resumed_events = "<n2>The module has been resumed.",
	welcome = "<n>Welcome to <t>#parkour</t>!",
	mod_apps = "<j>Parkour moderator applications are now open! Use this link: <rose>%s",
	type_help = "<pt>We recommend you to type <d>!help</d> to see useful information!",
	data_saved = "<vp>Data saved.",
	action_within_minute = "<vp>The action will be applied in a minute.",
	rank_save = "<n2>Type <d>!rank save</d> to apply the changes.",
	module_update = "<r><b>[Warning!]</b> <n>The module will update in <d>%02d:%02d</d>.",
	mapping_loaded = "<j>[INFO] <n>Mapping system <t>(v%s)</t> loaded.",
	mapper_joined = "<j>[INFO] <n><ce>%s</ce> <n2>(%s)</n2> has joined the room.",
	mapper_left = "<j>[INFO] <n><ce>%s</ce> <n2>(%s)</n2> has left the room.",
	mapper_loaded = "<j>[INFO] <n><ce>%s</ce> has loaded a map.",
	starting_perm_change = "<j>[INFO] <n>Starting perm change...",
	got_map_info = "<j>[INFO] <n>Retrieved map information. Trying to change the perm...",
	perm_changed = "<j>[INFO] <n>Successfully changed the perm of map <ch>@%s</ch> from <r>P%s</r> to <t>P%s</t>.",
	leaderboard_loaded = "<j>The leaderboard has been loaded. Press L to open it.",
	kill_minutes = "<R>Your powers have been disabled for %s minutes.",
	kill_map = "<R>Your powers have been disabled until next map.",

	-- Miscellaneous
	options = "<p align='center'><font size='20'>Parkour Options</font></p>\n\nUse particles for checkpoints\n\nUse <b>QWERTY</b> keyboard (disable if <b>AZERTY</b>)\n\nUse <b>M</b> hotkey for <b>/mort</b> (disable for <b>DEL</b>)\n\nShow your power cooldowns\n\nShow powers button\n\nShow help button\n\nShow map completion announcements",
	unknown = "Unknown",
	powers = "Powers",
	press = "<vp>Press %s",
	click = "<vp>Left click",
	ranking_pos = "Rank #%s",
	completed_maps = "<p align='center'><BV><B>Completed maps: %s</B></p></BV>",
	leaderboard = "Leaderboard",
	position = "Position",
	username = "Username",
	community = "Community",
	completed = "Completed maps",
	not_permed = "not permed",
	permed = "permed",
	points = "%d points",
	conversation_info = "<j>%s <bl>- @%s <vp>(%s, %s) %s\n<n><font size='10'>Started by <d>%s</d>. Last comment by <d>%s</d>. <d>%s</d> comments, <d>%s</d> unread.",
	map_info = "<p align='center'>Map code: <bl>@%s</bl> <g>|</g> Map author: <j>%s</j> <g>|</g> Status: <vp>%s, %s</vp> <g>|</g> Points: <vp>%s</vp>",
	permed_maps = "Permed maps",
	ongoing_votations = "Ongoing votes",
	archived_votations = "Archived votes",
	open = "Open",
	not_archived = "not archived",
	archived = "archived",
	delete = "<r><a href='event:%s'>[delete]</a> ",
	see_restore = "<vp><a href='event:%s'>[see]</a> <a href='event:%s'>[restore]</a> ",
	no_comments = "No comments.",
	deleted_by = "<r>[Message deleted by %s]",
	dearchive = "unarchive", -- to dearchive
	archive = "archive", -- to archive
	deperm = "deperm", -- to deperm
	perm = "perm", -- to perm
	map_actions_staff = "<p align='center'><a href='event:%s'>&lt;</a> %s <a href='event:%s'>&gt;</a> <g>|</g> <a href='event:%s'><j>Comment</j></a> <g>|</g> Your vote: %s <g>|</g> <vp><a href='event:%s'>[%s]</a> <a href='event:%s'>[%s]</a> <a href='event:%s'>[load]</a></p>",
	map_actions_user = "<p align='center'><a href='event:%s'>&lt;</a> %s <a href='event:%s'>&gt;</a> <g>|</g> <a href='event:%s'><j>Comment</j></a></p>",
	load_from_thread = "<p align='center'><a href='event:load_custom'>Load custom map</a></p>",
	write_comment = "Write your comment down here",
	write_map = "Write the mapcode down here",
	overall_lb = "Overall",
	weekly_lb = "Weekly",

	-- Power names
	balloon = "Balloon",
	masterBalloon = "Master Ballon",
	bubble = "Bubble",
	fly = "Fly",
	snowball = "Snowball",
	speed = "Speed",
	teleport = "Teleport",
	smallbox = "Small box",
	cloud = "Cloud",
	rip = "Tombstone",
	choco = "Chocoplank",
	bigBox = "Big box",
	trampoline = "Trampoline",
	toilet = "Toilet"
}
