/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_queryVehicle.sqf
	Author: Florian "Fank" Kinder

	Description:
	Queries the MySQL data for the vehicle information, if entry is not found
	the result will return an empty array.
*/
private ["_vehicleId","_vehicle","_sql"];
_vehicleId = [_this,0,0,[0]] call BIS_fnc_param;

// Verify playerid
if (_vehicleId == 0) exitWith {"Invalid VehicleId"};

_vehicle = [];
_sql = "Alits-Life-Hive" callExtension format ["401:%1", _vehicleId];
_vehicle = call compile format["%1", _sql];
_vehicle;