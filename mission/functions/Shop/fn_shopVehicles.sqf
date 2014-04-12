/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_localRespawn.sqf
	Author: Florian "Fank" Kinder

	Description:
	-
*/
private ["_vehicleType"];
_vehicleType = [_this,3,0,[0]] call BIS_fnc_param;

if (_vehicleType == 0) exitWith {
	hint "UNKNOWN VEHICLE TYPE";
};

createDialog "BGD_ShopVehicle";

disableSerialization;
ctrlSetText [1001, "Fetching Vehicles...."];

[[player,_vehicleType],"BGDS_fnc_getVehicles"] spawn BIS_fnc_MP;