/*
	Copyright © 2014 Niko "nano2k" Bochan, All rights reserved
	File: fn_handleDamage.sqf
	Author: Niko "nano2k" Bochan

	Description:
	-
*/
private ["_player","_damage"];
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_damage = [_this,2,0,[0]] call BIS_fnc_param;

_damage