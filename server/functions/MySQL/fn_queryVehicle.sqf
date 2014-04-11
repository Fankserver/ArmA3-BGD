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
if (_vehicleId == 0) exitWith {"Invalid PlayerId"};

_vehicle = [];
_sql = "Alits-Life-Hive" callExtension format ["100:%1", _vehicleId];
_sql = call compile format["%1", _sql];
if (count _sql > 0) then {

	_player set [(count _player), (_sql select 0)]; // PlayerId
	_player set [(count _player), (_sql select 6)]; // Cash
	_player set [(count _player), (_sql select 7)]; // BankAcc
	_player set [(count _player), (_sql select 5)]; // Arrested
	_player set [(count _player), (_sql select 8)]; // CopLevel
	_player set [(count _player), (_sql select 13)]; // RebLevel

};

_player;