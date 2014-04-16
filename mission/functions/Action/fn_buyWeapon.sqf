/*
	© 2014, Florian "Fank" Kinder, Niko "nano2k" Bochan. 
	Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International Public License
	http://creativecommons.org/licenses/by-nc-nd/4.0/
	File: fn_buyVehicle.sqf
	Author: Florian "Fank" Kinder

	Description:
	-
*/
private["_weapon","_weaponId"];
disableSerialization;
if(lbCurSel 1102 == -1) exitWith {hint "Du hast kein Fahrzeug ausgewählt"};
_weapon = lbData[1102,(lbCurSel 1102)];
_weaponId = lbValue[1102,(lbCurSel 1102)];

if(isNil "_weapon") exitWith {hint "Fehler bei der Auswahl"};

[[player, _weaponId], "BGDS_fnc_buyItem"] spawn BIS_fnc_MP;
