/*
	Copyright © 2014 Niko "nano2k" Bochan, All rights reserved
	File: fn_onPlayerConnected.sqf
	Author: Niko "nano2k" Bochan

	Description:
	-
*/
private ["_player","_selection"];
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_jip = [_this,1,false,[false]] call BIS_fnc_param;

_player addEventHandler ["Respawn", BGDS_fnc_handleRespawn];