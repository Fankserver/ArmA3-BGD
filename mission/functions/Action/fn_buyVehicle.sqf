/*
	© 2014, Florian "Fank" Kinder, Niko "nano2k" Bochan. 
	Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International Public License
	http://creativecommons.org/licenses/by-nc-nd/4.0/
	File: fn_buyVehicle.sqf
	Author: Florian "Fank" Kinder

	Description:
	-
*/
private["_vehicle","_vehicleId","_spawnObject"];
disableSerialization;
if(lbCurSel 1002 == -1) exitWith {hint "Du hast kein Fahrzeug ausgewählt"};
_vehicle = lbData[1002,(lbCurSel 1002)];
_vehicleId = lbValue[1002,(lbCurSel 1002)];

if(isNil "_vehicle") exitWith {hint "Fehler bei der Auswahl"};

_spawnObject = nearestObject [(getPos player), "Helipad_base_F"];

[[player, _vehicleId, _spawnObject], "BGDS_fnc_buyVehicle"] spawn BIS_fnc_MP;
hint "Spawne Fahrzeug. Einen Moment bitte...";
