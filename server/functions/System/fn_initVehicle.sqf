/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_initVehicle.sqf
	Author: Florian "Fank" Kinder

	Description:
	-
*/
private ["_vehicle"];
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;

waitUntil {_vehicle != objNull};

_vehicle disableTIEquipment true;