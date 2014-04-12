/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Yeah... Gets the vehicle from the garage.
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
