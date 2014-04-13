/*
	Copyright © 2014 Niko "nano2k" Bochan, All rights reserved
	File: fn_handleKill.sqf
	Author: Niko "nano2k" Bochan

	Description:
	-
*/
private ["_victim","_corpse","_message","_pool"];
_victim = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_killer = [_this,1,objNull,[objNull]] call BIS_fnc_param;

_pool = ["eliminiert",
		 "durchsiebt",
		 "gegrillt",
		 "getötet",
		 "ausgelöscht",
		 "vernichtet",
		 "flambiert",
		 "zerstört",
		 "in eine andere Dimension verlegt",
		 "zu einem Pfannkuchen verarbeitet",
		 "zerrissen",
		 "zerpflückt",
		 "zu Sushi verarbeitet",
		 "zu Tode argumentiert",
		 "zu Staub gemahlen",
		 "mit Liebe überhäuft"
		];

_message = _pool call BIS_fnc_selectRandom;

if (isPlayer _victim && not alive _victim) then {
	[[1, format ["%1 wurde von %2 %3", name _victim, name _killer, _message]], "BGD_fnc_serverMessage"] spawn BIS_fnc_MP;
};