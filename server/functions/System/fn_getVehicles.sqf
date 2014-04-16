/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_getVehicles.sqf
	Author: Florian "Fank" Kinder

	Description:
	Sends a request to query the database information and returns vehicles
	for the players side.
*/
private ["_player","_vehicleType","_playerSide","_vehicles"];
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_vehicleType = [_this,1,0,[0]] call BIS_fnc_param;

diag_log _player;
diag_log _vehicleType;

if (_player == objNull) exitWith {};

_playerSide = str(side _player);
if (!(_playerSide in ["WEST","EAST","GUER"])) exitWith {};

_vehicles = [_playerSide,_vehicleType] call Database_fnc_queryVehicles;

diag_log _vehicles;

[[_vehicles], "BGD_fnc_showVehicles", (owner _player)] spawn BIS_fnc_MP;