/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_queryVehicle.sqf
	Author: Florian "Fank" Kinder

	Description:
	Queries the MySQL data for the vehicle information, if entry is not found
	the result will return an empty array.
*/
private ["_weaponId","_weapon","_sql"];
_weaponId = [_this,0,0,[0]] call BIS_fnc_param;

_weapon = [];

// Verify weaponid
if (_weaponId == 0) exitWith {_weapon};

_sql = "Altis-Life-Hive" callExtension format ["403:%1", _weaponId];
_weapon = call compile format["%1", _sql];
_weapon;