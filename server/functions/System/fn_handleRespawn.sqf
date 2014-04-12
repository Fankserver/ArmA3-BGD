/*
	Copyright © 2014 Niko "nano2k" Bochan, All rights reserved
	File: fn_handleRespawn.sqf
	Author: Niko "nano2k" Bochan

	Description:
	-
*/
private ["_player","_corpse"];
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_corpse = [_this,1,objNull,[objNull]] call BIS_fnc_param;

[[0, format ["%1 %2", _player, _corpse]], "BGD_fnc_serverMessage"] spawn BIS_fnc_MP;