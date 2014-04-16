/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_queryVehicle.sqf
	Author: Florian "Fank" Kinder

	Description:
	Queries the MySQL data for the vehicle information, if entry is not found
	the result will return an empty array.
*/
private ["_playerSide","_vehicleType","_vehicles","_sql"];
_playerSide = [_this,0,"",[""]] call BIS_fnc_param;
_vehicleType = [_this,1,0,[0]] call BIS_fnc_param;

// Verify player
if (_playerSide == "") exitWith {"Invalid PlayerSide"};

_vehicles = [];
_sql = "Altis-Life-Hive" callExtension format ["400:%1:%2", _playerSide, _vehicleType];
_vehicles = call compile format["%1", _sql];
_vehicles;