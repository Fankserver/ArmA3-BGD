/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_buyVehicle.sqf
	Author: Florian "Fank" Kinder

	Description:
	Queries the MySQL data for the player information, if entry is not found
	the result will return an empty array.
*/
private ["_player","_vehicleId","_spawnObject","_playerUid","_playerData","_vehicleData","_playerMoney","_vehiclePrice","_vehicle"];
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_vehicleId = [_this,1,0,[0]] call BIS_fnc_param;
_spawnObject = [_this,2,objNull,[objNull]] call BIS_fnc_param;

diag_log ["BGDS_fnc_buyVehicle called", _player, _vehicleId, _spawnObject];

// Validate parameter
if (_player == objNull || _vehicleId == 0 || _spawnObject == objNull) exitWith {};

// Get player uid
_playerUid = getPlayerUID _player;
if (_playerUid == "") exitWith {};

// Get player data
_playerData = [_playerUid] call Database_fnc_queryPlayer;
if ((count _playerData) == 0) exitWith {};

// Get vehicle data
_vehicleData = [_vehicleId] call Database_fnc_queryVehicle;
if ((count _vehicleData) == 0) exitWith {};

_playerMoney = (parseNumber (_playerData select 1)) + (parseNumber (_playerData select 2));
_vehiclePrice = (parseNumber (_vehicleData select 2));

// Enought money to buy the vehicle
if (_playerMoney >= _vehiclePrice) then {
	_playerMoney = (_playerMoney - _vehiclePrice);

	[_playerUid,1,0] spawn Database_fnc_updatePlayerMoney; // Update Cash
	[_playerUid,2,_playerMoney] spawn Database_fnc_updatePlayerMoney; // Update Bank

	_vehicle = (_vehicleData select 1) createVehicle (getPos _spawnObject);
	_vehicle setDir (getDir _spawnObject);
	[_vehicle] call BGDS_fnc_initVehicle;

	[[_playerMoney], "BGD_fnc_moneyUpdate", (owner _player)] spawn BIS_fnc_MP;
}
else {
	[[2, "OUT OF MONEY"], "BGD_fnc_serverMessage", (owner _player)] spawn BIS_fnc_MP;
};