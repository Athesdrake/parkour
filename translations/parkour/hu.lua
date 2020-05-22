translations.hu = {
	name = "hu",

	-- Error messages
	corrupt_map = "<r>Sérült pálya. Egy másik betöltése.",
	corrupt_map_vanilla = "<r>[HIBA] <n>Nem található információ a pályáról.",
	corrupt_map_mouse_start = "<r>[HIBA] <n>Ennek a pályának rendelkeznie kell egy kezdőponttal (egér spawnpontja).",
	corrupt_map_needing_chair = "<r>[HIBA] <n>A pályának rendelkeznie kell egy székkel.",
	corrupt_map_missing_checkpoints = "<r>[HIBA] <n>A pályának rendelkeznie kell legalább egy checkpointtal (sárga szög).",
	corrupt_data = "<r>Sajnos az adataid megsérültek, így újra lettek állítva.",
	min_players = "<r>Az adatok mentéséhez legalább 4 egérnek tartózkodnia kell a szobában. <bl>[%s/%s]",
	tribe_house = "<r>Az adatok nem kerülnek megntésre a törzsházakban.",
	invalid_syntax = "<r>Érvénytelen szintakszis.",
	user_not_in_room = "<r><n2>%s</n2> felhasználó nincs a szobában.",
	arg_must_be_id = "<r>Az argumentumnak érvényes azonosítónak kell lennie.",
	cant_update = "<r>Jelenleg nem lehet frissítenia  játékosok rangsorát. Próbáld újra később.",
	cant_edit = "<r>Nem szerkesztheted <n2>%s</n2> rangsorát.",
	invalid_rank = "<r>Érvénytelen rang: <n2>%s",
	code_error = "<r>Hiba jelent meg: <bl>%s-%s-%s %s",
	panic_mode = "<r>A modul pánik üzemmódba kapcsol.",
	public_panic = "<r>Várj, amíg egy bot újraindítja a modult.",
	tribe_panic = "<r>A modul újraindításához írd be a <n2>/module parkour</n2> parancsot.",
	emergency_mode = "<r>Vészleállítás kezdeményezése, új játékosok nem engedélyezettek. Kérjük, menj egy másik #parkour szobába.",
	bot_requested = "<r>A botot meghívták. Egy pillanat alatt meg kell érkeznie.",
	stream_failure = "<r>Belső stream-csatorna hiba. Az adatokat nem lehet továbbítani.",
	maps_not_available = "<r>#parkour 'maps' almód csak angol nyelven érhető el <n2>*#parkour0maps</n2>.",
	version_mismatch = "<r>A bot (<d>%s</d>) és a lua (<d>%s</d>) verziók nem egyeznek. A rendszer nem indítható.",
	missing_bot = "<r>A bot hiányzik. Várd meg, amíg a bot megérkezik, vagy pingeld @Tocu#0018 -t; discordon: <d>%s</d>",
	invalid_length = "<r>Az üzenetben 10 és 100 között kell lennie. Ez <n2>%s</n2> karakterrel rendelkezik.",
	invalid_map = "<r>Érvénytelen pálya.",
	map_does_not_exist = "<r>A megadott pálya nem létezik vagy nem lehet betölteni. Próbáld újra később.",
	invalid_map_perm = "<r>A megadott pálya nem P22 vagy P41.",
	invalid_map_perm_specific = "<r>A megadott pálya nem P%s.",
	cant_use_this_map = "<r>A megadott pálya egy kis hibával rendelkezik, így nem használható.",
	invalid_map_p41 = "<r>A megadott pálya P41, de nem található a modul pályáinak listájában.",
	invalid_map_p22 = "<r>>A megadott pálya P22, de nem található a modul pályáinak listájában.",
	map_already_voting = "<r>A megadott pálya már rendelkezik nyílt szavazással..",
	not_enough_permissions = "<r>Nincs elég engedélyed ehhez.",
	already_depermed = "<r>A megadott pálya már elavult.",
	already_permed = "<r>A megadott pálya már át van alakítva.",
	cant_perm_right_now = "<r>Jelenleg nem lehet megváltoztatni a pálya engedélyét. Próbáld újra később.",
	already_killed = "<r>%s játékost már megölték.",
	leaderboard_not_loaded = "<r>A ranglista még nem töltött be. Várj egy percet.",

	-- Help window
	help = "Segítség",
	staff = "Személyzet",
	rules = "Szabályzat",
	contribute = "Hozzájárulás",
	changelog = "Hírek",
	help_help = "<p align = 'center'><font size = '14'>Üdvözlünk a <T>#parkour</T>-on!</font></p>\n<font size = '11'><p align='center'><J>A célod, hogy elérd az összes checkpointot, miközben teljesíted a pályát.</J></p>\n\n<N>• Nyomd meg az <O>O</O> gombot, írd be a <O>!op</O> parancsot vagy kattints a  <O>konfigurációs gombra</O> a <T>beállítások menüjéhez</T> való megnyitáshoz.\n• Nyomd meg a <O>P</O> gombot vagy kattints a <O>kéz ikonra</O> a jobb felső sarokban az <T>erők menüjéhez</T> való megnyitáshoz.\n• Nyomd meg az <O>L</O> gombot vagy írd be a <O>!lb</O> parancsot a <T>randlista</T> megnyitásához.\n• Nyomd meg az <O>M</O> gombot vagy a <O>Delete</O> gombot <T>/mort</T> parancshoz, megváltoztathatod a gombokat az <J>Beállítások</J> menüben.\n• Ha szeretnél többet tudni a <O>személyzetről</O> és a <O>parkour szabályairól</O>, akkor kattints a <T>Személyzet</T> és <T>Szabályzat</T> fülre.\n• Kattints <a href='event:discord'><o>ide</o></a> a Discord meghívó linkért és <a href='event:map_submission'><o>ide</o></a> kattintva megkaphatod a pályabenyújtási téma linkjét.\n• Használd a <o>fel</o> és <o>le</o> nyilakat, amikor görgetned kell a menüben.\n\n<p align = 'center'><font size = '13'><T>A hozzájárulások már nyitva vannak! További részletekért kattints a <O>Hozzájárulás</O> fülre!</T></font></p>",
	help_staff = "<p align = 'center'><font size = '13'><r>FELHÍVÁS: A Parkour személyzet NEM Transformice személyzet és NEM rendelkeznek hatalommal a játékban, csak a modulon belül.</r>\nA Parkour személyzete gondoskodik arról, hogy a modul zökkenőmentesen működjön minimális problémákkal. Ők mindig rendelkezésre állnak, hogy szükség esetén segítsék a játékosokat.</font></p>\nÍrd be a <D>!staff</D> parancsot a chatbe, hogy lásd a személyzet listáját.\n\n<font color = '#E7342A'>Rendszergazdák:</font> Ők felelnek a modul karbantartásáért az új frissítések és hibák kijavításával.\n\n<font color = '#843DA4'>Csapatvezetők:</font> Ők ügyelik a Moderátorok és Pálya legénység csapatát ügyelve arra, hogy megfelelően végezzék a munkájukat. Továbbá ők felelősek az új tagok toborzásáért a személyzet csapatába.\n\n<font color = '#FFAAAA'>Moderátorok:</font> Ők felelnek a modul szabályzatának betartásáért és a rájuk nem hallgató személyek büntetéséért.\n\n<font color = '#25C059'>Pálya legénység:</font> Ők felelnek a pályák felülvizsgálatáért, hozzáadásáért és eltávolításáért a modulon belül annak érdekében, hogy a játékmenet élvezetes legyen.",
	help_rules = "<font size = '13'><B><J>A Transformice Általános Szerződési feltételeinek minden szabálya vonatkozik a #parkour-ra</J></B></font>\n\nHa olyan játékost találsz, aki megsérti a szabályokat, akkor suttogásban szólj a moderátoroknak. Ha nem érhető el moderátor, akkor jelentsd a játékost a Discord felületen.\nJelentéskor kérjük, add meg a szerver-, a szoba- és a játékos nevét.\n• Például: hu-#parkour10 Blank#3495 trollkodás\nA bizonyítékok, mint például képernyőfotók, videók és gifek hasznosak és értékeljük, de nem szükségesek.\n\n<font size = '11'>• A #parkour szobákban nem lehet <font color = '#ef1111'>hacket, glitcheket vagy bugokat</font> használni\n• A <font color = '#ef1111'>VPN farmolást</font> <B>kizsákmányolásnak</B> tekintjük, és nem engedélyezettek. <p align = 'center'><font color = '#cc2222' size = '12'><B>\nBárkit, akit szabálysértésen kapunk, azonnal bannoljuk.</B></font></p>\n\n<font size = '12'>A Transformice engedélyezi a trollkodást. Ettől függetlenül <font color='#cc2222'><B>a parkour-ban nem engedélyezzük ezt.</B></font></font>\n\n<p align = 'center'><J>Trollkodásnak számít, ha egy játékos szándékosan arra használja az erőit, hogy megakadályozza máss játékosoknak a pálya végigjátszását.</j></p>\n• Bosszúból trollkodni nem megfelelő ok, és még mindig büntetjük.\n• Trollkodásnak tekintjük azt is, amikor egy játékos a kérés ellenére is megpróbálja segíteni azt a játékost, aki egyedül akarja végigjátszani a pályát.\n• <J>Ha egy játékos nem akar segítséget vagy egy pályát jobban szeretné egyedül végigjátszani, kérjük, segíts más játékosnak</J>. Ettől függetlenül, ha egy másik játékosnak segítségre van szüksége ugyan abban a checkpointban, akkor segíthetsz nekik [mindkettőnek].\n\nHa egy játékos trollkodásba kerül, akkor büntetjük bármikor, vagy az aktuális parkour körben. Vedd figyelembe, hogy az ismétlődő trollkodás hosszabb és súlyosabb büntetésekkel jár.",
	help_contribute = "<font size='14'>\n<p align='center'>A parkour menedzsment csapata szereti a nyílt forráskódot, mert ez <t>segít a közösségnek</t>. <o>Megtekintheted</o> és <o>módosíthatod</o> a nyílt forráskódot a <o><u><a href='event:github'>GitHub</a></u></o>-on.\n\nA modul karbantartása <t>szigorúan önkéntes</t>, ezért a <t>kód</t> olvasásával, <t>hibajelentésekkel</t>, <t>javaslatokkal</t> és <t>pályakészítéssel</t> kapcsolatos bármilyen segítséget <u>mindig örömmel fogadunk és értékeljük</u>.\nTehetsz <vp>hibajelentéseket</vp> és <vp>javaslatokat</vp> a <o><u><a href='event:discord'>Discord</a></u></o>-on és/vagy <o><u><a href='event:github'>GitHub</a></u></o>-on.\nA <vp>pályádat beküldheted</vp> a mi <o><u><a href='event:map_submission'>Fórum témánkba</a></u></o>.\n\nA parkour fenntartása nem drága, de nem is ingyenes. Szeretnénk, ha <t>bármekkora összeggel</t> támogatnál minket <o><u><a href='event:donate'>ide</a></u></o> kattintva.\n<u>Minden támogatás a modul fejlesztésére irányul.</u></p>",
	help_changelog = "<font size='13'><p align='center'><o>Verzió 2.2.0 - 08/05/2020</o></p>\n\n• Továbbfejlesztett modul infrastruktúra.\n\t\t• A modul <o>egy kicsit stabilabb</o>.\n• Hozzáadtunk egy botot (<o>Parkour#8558</o>), amit hamarosan a discord számára használunk.\n• <vp>Új erők!</vp>\n\t\t• Ha a ranglistán vagy (nyomd meg az <t>L</t> gombot) akkor idézhetsz <t>toaleteket</t>! <o>Van egy meglepetés, amikor eltűnik...</o>\n\t\t• Ha van elegendő pályád, akkor egy <t>nagy dobozt</t> és egy <t>trambulint</t> is idézhetsz!",

	-- Congratulation messages
	reached_level = "<d>Gratulálunk! Elérted a(z) <vp>%s</vp>. szintet.",
	finished = "<d><o>%s</o> a parkourt <vp>%s</vp> másodperc alatt fejezte be. <fc>Gratulálunk!",
	unlocked_power = "<ce><d>%s</d> feloldotta a(z) <vp>%s</vp> erőt.",
	enjoy = "<d>Élvezd az új képességeid!",

	-- Information messages
	paused_events = "<cep><b>[Figyelem!]</b> <n>A modul elérte a kritikus határát, így szüneteltetés alatt áll.",
	resumed_events = "<n2>A modul folytatódik.",
	welcome = "<n>Üdvözlünk a <t>#parkour</t>-on!",
	mod_apps = "<j>A Parkour Moderátor jelentkezések nyitva vannak! Használd ezt a linket: <rose>%s",
	type_help = "<pt>Ajánljuk, hogy írd be a <d>!help</d> parancsot hasznos információkért.",
	data_saved = "<vp>Adatok elmentve.",
	action_within_minute = "<vp>A művelet egy perc alatt megtörténik.",
	rank_save = "<n2>A változtatások alkalmazásához írd be a <d>!rank save</d> parancsot.",
	module_update = "<r><b>[Figyelem!]</b> <n>A modul frissül <d>%02d:%02d</d> percen belül.",
	mapping_loaded = "<j>[INFÓ] <n><t>(v%s)</t> pályarendszer betöltve.",
	mapper_joined = "<j>[INFÓ] <n><ce>%s</ce> <n2>(%s)</n2> csatlakozott a szobához.",
	mapper_left = "<j>[INFÓ] <n><ce>%s</ce> <n2>(%s)</n2> elhagyta a szobát.",
	mapper_loaded = "<j>[INFÓ] <n><ce>%s</ce> pálya be lett töltve.",
	starting_perm_change = "<j>[INFÓ] <n>Végleges változtatás elkezdése...",
	got_map_info = "<j>[INFÓ] <n>Pálya információ megszerezve. Kísérlet a végleges változtatására...",
	perm_changed = "<j>[INFÓ] <n>Sikeresen megváltozott a végleges pálya <ch>@%s</ch> <r>P%s</r>-ről <t>P%s</t>-re.",
	leaderboard_loaded = "<j>A ranglista be lett töltve. Nyomd meg az L gombot a megnyitásához.",
	kill_minutes = "<R>Az erőidet %s percre letiltottuk.",
	kill_map = "<R>Az erőidet letiltottuk a következő pályáig.",

	-- Miscellaneous
	options = "<p align='center'><font size='20'>Parkour Beállítások</font></p>\n\nHasználj partikülöket a checkpointokhoz\n\nHasználd a <b>QWERTY</b> billentyűzetet (tiltsd le, ha <b>AZERTY</b>-d van)\n\nHasználd az <b>M</b> gyorsbillentyűt a <b>/mort</b> parancshoz (tiltsd le a <b>DEL</b>-t)\n\nMutassa az erők újratöltési idejét\n\nMutassa az erők gombot\n\nMutassa a segítség gombot\n\nMutassa a teljesített pálya jelentéseket",
	unknown = "Ismeretlen",
	powers = "Erők",
	press = "<vp>Nyomd meg: %s",
	click = "<vp>Bal klikk",
	ranking_pos = "Rang #%s",
	completed_maps = "<p align='center'><BV><B>Teljesített pályák: %s</B></p></BV>",
	leaderboard = "Ranglista",
	position = "Pozíció",
	username = "Felhasználónév",
	community = "Közösség",
	completed = "Teljesített pályák",
	not_permed = "nem véglegesített",
	permed = "véglegesített",
	points = "%d pont",
	conversation_info = "<j>%s <bl>- @%s <vp>(%s, %s) %s\n<n><font size='10'>Elindította: <d>%s</d>. Utolsó hozzászólás: <d>%s</d>. <d>%s</d> hozzászólás, <d>%s</d> olvasatlan.",
	map_info = "<p align='center'>Pályakód: <bl>@%s</bl> <g>|</g> Pályakészítő: <j>%s</j> <g>|</g> Állapot: <vp>%s, %s</vp> <g>|</g> Pontok: <vp>%s</vp>",
	permed_maps = "Véglegesített pályák",
	ongoing_votations = "Folyamatban lévő szavazások",
	archived_votations = "Archivált szavazatok",
	open = "Nyit",
	not_archived = "nem archivált",
	archived = "archivált",
	delete = "<r><a href='event:%s'>[töröl]</a> ",
	see_restore = "<vp><a href='event:%s'>[lásd]</a> <a href='event:%s'>[visszaállítás]</a> ",
	no_comments = "Nincs hozzászólás.",
	deleted_by = "<r>[Az üzenetet %s törölte]",
	dearchive = "dearchiválás", -- to dearchive
	archive = "archiválás", -- to archive
	deperm = "deperm", -- to deperm
	perm = "végleges", -- to perm
	map_actions_staff = "<p align='center'><a href='event:%s'>&lt;</a> %s <a href='event:%s'>&gt;</a> <g>|</g> <a href='event:%s'><j>Hozzászólás</j></a> <g>|</g> A te szavazatod: %s <g>|</g> <vp><a href='event:%s'>[%s]</a> <a href='event:%s'>[%s]</a> <a href='event:%s'>[betöltés]</a></p>",
	map_actions_user = "<p align='center'><a href='event:%s'>&lt;</a> %s <a href='event:%s'>&gt;</a> <g>|</g> <a href='event:%s'><j>Hozzászólás</j></a></p>",
	load_from_thread = "<p align='center'><a href='event:load_custom'>Töltsd be az egyedi pályád</a></p>",
	write_comment = "Hozzászólásodat írd le ide",
	write_map = "Írd le a pályakódot ide",
	overall_lb = "Teljes",
	weekly_lb = "Heti",

	-- Power names
	balloon = "Léggömb",
	masterBalloon = "Mester Léggömb",
	bubble = "Buborék",
	fly = "Repülés",
	snowball = "Hógolyó",
	speed = "Gyorsítás",
	teleport = "Teleport",
	smallbox = "Kis doboz",
	cloud = "Felhő",
	rip = "Sírkő",
	choco = "Csokoládé deszka",
	bigBox = "Nagy doboz",
	trampoline = "Trambulin",
	toilet = "Toalet"
}