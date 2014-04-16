/*
	© 2014, Florian "Fank" Kinder, Niko "nano2k" Bochan. 
	Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International Public License
	http://creativecommons.org/licenses/by-nc-nd/4.0/
	File: fn_shopWeapons.sqf
	Author: Florian "Fank" Kinder

	Description:
	-
*/
private ["_weaponType"];
_weaponType = [_this,3,0,[0]] call BIS_fnc_param;

if (_weaponType == 0) exitWith {
	hint "UNKNOWN WEAPON TYPE";
};

createDialog "BGD_ShopWeapon";

disableSerialization;
ctrlSetText [1001, "Fetching Weapons...."];

[[player,_weaponType], "BGDS_fnc_getWeapons", false, false] spawn BIS_fnc_MP;