/*
	Copyright © 2014 Niko "nano2k" Bochan, All rights reserved
	File: fn_handleRespawn.sqf
	Author: Niko "nano2k" Bochan

	Description:
	-
*/
private ["_player","_corpse","_side","_counter"];
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_corpse = [_this,1,objNull,[objNull]] call BIS_fnc_param;

diag_log ["BGDS_fnc_handleRespawn called", _player, _corpse];

_side = side (group _player);

switch (_side) do {
	case west: {
		_counter = (BGDS_tickets select 0) - 1;
		if (_counter < 0) then {
			_counter = 0;
		};
		BGDS_tickets set [0, _counter];
	};
	case east:  {
		_counter = (BGDS_tickets select 1) - 1;
		if (_counter < 0) then {
			_counter = 0;
		};
		BGDS_tickets set [1, _counter];
	};
	case resistance:  {
		_counter = (BGDS_tickets select 2) - 1;
		if (_counter < 0) then {
			_counter = 0;
		};
		BGDS_tickets set [2, _counter];
	};
};

[[(BGDS_tickets select 0), (BGDS_tickets select 1), (BGDS_tickets select 2)], "BGD_fnc_ticketUpdate", playableUnits] spawn BIS_fnc_MP;
