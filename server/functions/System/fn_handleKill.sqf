/*
	Copyright © 2014 Niko "nano2k" Bochan, All rights reserved
	File: fn_handleKill.sqf
	Author: Niko "nano2k" Bochan

	Description:
	-
*/
private ["_player","_corpse"];
_victim = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_killer = [_this,1,objNull,[objNull]] call BIS_fnc_param;

[[1, format ["%1 wurde von %2 eliminiert", _player, _killer]], "BGD_fnc_serverMessage"] spawn BIS_fnc_MP;