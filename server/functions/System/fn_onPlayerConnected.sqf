/*
	Copyright © 2014 Niko "nano2k" Bochan, All rights reserved
	File: fn_onPlayerConnected.sqf
	Author: Niko "nano2k" Bochan

	Description:
	-
*/
private ["_player","_jip","_playerUid","_playerData"];
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_jip = [_this,1,false,[false]] call BIS_fnc_param;


[[1, format ["%1 hat das Schlachtfeld betreten", name _player]], "BGD_fnc_serverMessage"] spawn BIS_fnc_MP;

_player addEventHandler ["Respawn", BGDS_fnc_handleRespawn];
_player addEventHandler ["Killed", BGDS_fnc_handleKill];
// Get player uid
_playerUid = getPlayerUID _player;
if (_playerUid == "") exitWith {};

// Get player data
_playerData = [_playerUid] call Database_fnc_queryPlayer;
if ((count _playerData) > 0) then {
	[[(parseNumber (_playerData select 1)) + (parseNumber (_playerData select 2))], "BGD_fnc_moneyUpdate", (owner _player)] spawn BIS_fnc_MP;
};