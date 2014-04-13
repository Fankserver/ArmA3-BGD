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

//if (isPlayer _victim && not alive _victim) then {
[[1, format ["%1 wurde von %2 eliminiert", name _player, name _killer]], "BGD_fnc_serverMessage"] spawn BIS_fnc_MP;
//};