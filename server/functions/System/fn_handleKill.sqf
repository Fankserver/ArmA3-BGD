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

_pool = [
	"eliminiert",
	"durchsiebt",
	"gegrillt",
	"getötet",
	"ausgelöscht",
	"vernichtet",
	"flambiert",
	"zerstört",
	"in eine andere Dimension befördert",
	"zu einem Pfannkuchen verarbeitet",
	"zerrissen",
	"zerpflückt",
	"zu Sushi verarbeitet",
	"zu Tode argumentiert",
	"zu Staub gemahlen",
	"mit Liebe überhäuft",
	"platt gemacht",
	"durchlöchert",
	"halbiert",
	"komprimiert",
	"in einer Kiste nach Hause geschickt",
	"mit dem Käsehobel bearbeitet"
];

_message = _pool call BIS_fnc_selectRandom;

if (!isPlayer _killer) then {
	_killer = driver _killer;
};

if (isPlayer _victim && not alive _victim) then {
	if (_victim != _killer) then {
		[[1, format ["%1 wurde von %2 %3", name _victim, name _killer, _message]], "BGD_fnc_serverMessage"] spawn BIS_fnc_MP;
	} else {
		[[1, format ["%1 hat sich selbst %2", name _victim, _message]], "BGD_fnc_serverMessage"] spawn BIS_fnc_MP;
    };
};