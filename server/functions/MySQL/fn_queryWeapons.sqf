/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_queryVehicle.sqf
	Author: Florian "Fank" Kinder

	Description:
	Queries the MySQL data for the vehicle information, if entry is not found
	the result will return an empty array.
*/
private ["_playerFaction","_weaponType","_weapons","_sql"];
_playerFaction = [_this,0,"",[""]] call BIS_fnc_param;
_weaponType = [_this,1,0,[0]] call BIS_fnc_param;

// Verify player
if (_playerFaction == "") exitWith {"Invalid PlayerSide"};

_weapons = [];
_sql = "Altis-Life-Hive" callExtension format ["402:%1:%2", _playerFaction, _weaponType];
_weapons = call compile format["%1", _sql];
_weapons;