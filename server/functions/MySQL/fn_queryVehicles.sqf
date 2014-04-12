/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_queryVehicle.sqf
	Author: Florian "Fank" Kinder

	Description:
	Queries the MySQL data for the vehicle information, if entry is not found
	the result will return an empty array.
*/
private ["_playerSide","_vehicles","_sql"];
_playerSide = [_this,0,"",[""]] call BIS_fnc_param;

diag_log _playerSide;

// Verify player
if (_playerSide == "") exitWith {"Invalid PlayerSide"};

_vehicles = [];
_sql = "Alits-Life-Hive" callExtension format ["400:%1", _playerSide];
_vehicles = call compile format["%1", _sql];
_vehicles;