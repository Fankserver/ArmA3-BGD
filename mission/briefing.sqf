/*
    © 2014, Florian "Fank" Kinder, Niko "nano2k" Bochan, Filip "FrozenMalibu" Depczyk.
    Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International Public License
    http://creativecommons.org/licenses/by-nc-nd/4.0/
*/
waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["sealteamsloth","We-Are-Friendly"];
player createDiarySubject ["changelog","Changelog"];
player createDiarySubject ["serverrules","Allgemeine Regeln"];
//player createDiarySubject ["policerules","Polizei-Regeln"];
//player createDiarySubject ["safezones","Safe Zones"];
//player createDiarySubject ["illegalitems","Illegales"];
//player createDiarySubject ["controls","Steuerung"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/

// Seal Team Sloth Section

	player createDiaryRecord ["sealteamsloth",
		[
			"Teamspeak",
				"
				Der we-are-friendly Teamspeak Server ist unter der folgenden URL erreichbar:<br/><br/>
				we-are-friendly.de:9988<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["sealteamsloth",
		[
			"Website/Forums",
				"
				we-are-friendly.de<br/>
				Hier könnt ihr Neuigkeiten, Änderungen und Reports lesen.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["sealteamsloth",
		[
			"Spenden",
				"
				Spenden in jeglicher Form und Höhe helfen den Server am Laufen zu halten. Wenn du hier Spaß hast bitten wir dich etwas zu spenden.<br/>
				Du findest die Anleitung zum Spenden in unserem Forum unter 'Werde Donator'<br/><br/>
				we-are-friendly.de<br/><br/>
				"
		]
	];

	player createDiaryRecord["changelog",
		[
			"Bug / Feature Tracker",
				"
					Changelogs und Updates werden im Forum unter http://www.we-are-friendly.de/ veröffentlicht
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Allgemeine Regeln", 
				"
				1. Sei kein Idiot!<br />
				2. Spam der Kommunikationsmöglichkeiten in jeglicher Form ist verboten.<br />
				3. Es ist verboten jegliche Form von Cheats, Hacks, Exploits oder Bugs zu benutzen, um sich gegenüber anderen Spielern einen Vorteil zu verschaffen.<br />
				4. Namen, die jemanden entwürdigen oder in irgendeiner Art beleidigen, sind verboten.<br />
				5. Das Campen des Spawns eines anderen Spielers ist verboten. 
				"
		]
	];
	
