/*
	© 2014, Florian "Fank" Kinder, Niko "nano2k" Bochan.
	Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International Public License
	http://creativecommons.org/licenses/by-nc-nd/4.0/
	File: fn_shopVehicles.sqf
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

[[player,_vehicleType], "BGDS_fnc_getVehicles", false, false] spawn BIS_fnc_MP;