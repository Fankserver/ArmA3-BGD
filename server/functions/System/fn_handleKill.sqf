/*
	Copyright © 2014 Niko "nano2k" Bochan, All rights reserved
	File: fn_handleKill.sqf
	Author: Niko "nano2k" Bochan

	Description:
	-
*/
private ["_victim","_corpse","_message","_pool","_killerOrg","_killerCrew","_baseMarkerPos","_killerCrewUIDs"];
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
	"mit dem Käsehobel bearbeitet",
	"durch 0 geteilt",
	"gekürzt",
	"unangespitzt in den Boden gerammt",
	"massakriert",
	"ins Jenseits befördert",
	"mit Blei gefüttert",
	"ein drittes Nasenloch verpasst"
];

_message = _pool call BIS_fnc_selectRandom;

_killerOrg = _killer;
_killerCrew = [];
if (!isPlayer _killer) then {
	_killerCrew = crew _killer;
	_killer = driver _killer;
};

_baseMarkerPos = [0,0,0];
switch (faction _victim) do {
	case "BLU_F": {
		_baseMarkerPos = getMarkerPos "base_west";
	};
	case "OPF_F": {
		_baseMarkerPos = getMarkerPos "base_east";
	};
	case "IND_F": {
		_baseMarkerPos = getMarkerPos "base_resistance";
	};
};

if ( (faction _victim) != (faction _killer) && (_victim distance _baseMarkerPos) <= 300 ) then {
	diag_log "ABUSE:";
	diag_log _killer;
	diag_log _killerOrg;
	diag_log _killerCrew;

	_killerCrewUIDs = [];
	{
		if (alive _x) then {
			_killerCrewUIDs = _killerCrewUIDs + [getPlayerUID _x];
			_x setDamage 1;
		};
	} forEach _killerCrew;
	_killerOrg setDamage 1;

	diag_log _killerCrewUIDs;
};

if (isPlayer _victim && not alive _victim) then {
	if (_victim != _killer) then {
		[[1, format ["%1 wurde von %2 %3", name _victim, name _killer, _message]], "BGD_fnc_serverMessage"] spawn BIS_fnc_MP;
	} else {
		[[1, format ["%1 hat sich selbst %2", name _victim, _message]], "BGD_fnc_serverMessage"] spawn BIS_fnc_MP;
    };
};