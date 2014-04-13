/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_buyVehicle.sqf
	Author: Florian "Fank" Kinder

	Description:
	Queries the MySQL data for the player information, if entry is not found
	the result will return an empty array.
*/
private ["_player","_weaponId","_playerUid","_playerData","_weaponData","_playerMoney","_vehiclePrice","_vehicle"];
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_weaponId = [_this,1,0,[0]] call BIS_fnc_param;

// Validate parameter
if (_player == objNull || _weaponId == 0) exitWith {};

// Get player uid
_playerUid = getPlayerUID _player;
if (_playerUid == "") exitWith {};

// Get player data
_playerData = [_playerUid] call Database_fnc_queryPlayer;
if ((count _playerData) == 0) exitWith {};

// Get vehicle data
_weaponData = [_weaponId] call Database_fnc_queryWeapon;
if ((count _weaponData) == 0) exitWith {};

_playerMoney = (parseNumber (_playerData select 1)) + (parseNumber (_playerData select 2));
_weaponPrice = (parseNumber (_weaponData select 2));

// Enought money to buy the vehicle
if (_playerMoney >= _weaponPrice) then {
	_playerMoney = (_playerMoney - _weaponPrice);

	[_playerUid,1,0] spawn Database_fnc_updatePlayerMoney; // Update Cash
	[_playerUid,2,_playerMoney] spawn Database_fnc_updatePlayerMoney; // Update Bank

	_player addWeapon (_weaponData select 1);

	[[_playerMoney], "BGD_fnc_moneyUpdate", (owner _player)] spawn BIS_fnc_MP;
}
else {
	[[2, "OUT OF MONEY"], "BGD_fnc_serverMessage", (owner _player)] spawn BIS_fnc_MP;
};