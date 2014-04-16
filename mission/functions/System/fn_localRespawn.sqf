/*
	© 2014, Florian "Fank" Kinder, Niko "nano2k" Bochan. 
	Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International Public License
	http://creativecommons.org/licenses/by-nc-nd/4.0/
	File: fn_localRespawn.sqf
	Author: Florian "Fank" Kinder

	Description:
	-
*/
private ["_unit"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;

[_this, "BGDS_fnc_handleRespawn", false] spawn BIS_fnc_MP;

//removeVest _unit;
//removeBackpack _unit;

removeAllWeapons _unit;

_unit unassignItem "NVGoggles";
_unit removeItem "NVGoggles";