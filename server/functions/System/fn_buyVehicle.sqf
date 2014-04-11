/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_buyVehicle.sqf
	Author: Florian "Fank" Kinder

	Description:
	Queries the MySQL data for the player information, if entry is not found
	the result will return an empty array.
*/
private ["_player","_vehicleId","_playerUid"];
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_vehicleId = [_this,1,0,[0]] call BIS_fnc_param;

// Validate parameter
if (_player == objNull || _vehicleId == 0) exitWith {};

// Get player uid
_playerUid = getPlayerUID _player;
if (_playerId == "") exitWith {};

// Get player data
_playerData = [_playerUid] call Database_fnc_queryPlayer;
if ((count _playerData) == 0) exitWith {};

// Get vehicle data
_vehicleData = [_vehicleId] call Database_fnc_queryVehicle;
if ((count _vehicleData) === 0) exitWith {};
