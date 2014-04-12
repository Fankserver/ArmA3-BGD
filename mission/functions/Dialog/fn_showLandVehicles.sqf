/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_showLandVehicles.sqf
	Author: Florian "Fank" Kinder

	Description:
	-
*/
private["_vehicles","_control"];
disableSerialization;
_vehicles = [_this,0,[],[[]]] call BIS_fnc_param;

waitUntil {!isNull (findDisplay 1000)};

if(count _vehicles == 0) exitWith {
	ctrlSetText[1001,"Keine Fahrzeuge vorhanden"];
};

ctrlSetText[1001,"Verbindung OK"];
_control = ((findDisplay 1000) displayCtrl 1002);
lbClear _control;

{
	_displayName = getText(configFile >> "CfgVehicles" >> (_x select 1) >> "displayName");
	_picture = getText(configFile >> "CfgVehicles" >> (_x select 1) >> "picture");

	_control lbAdd format["%1 - Wert: $%2", _displayName, [parseNumber (_x select 2)] call BGD_fnc_numberText];
	_control lbSetData [(lbSize _control)-1,(_x select 1)];
	_control lbSetValue [(lbSize _control)-1,(call compile format["%1", _x select 0])];
	_control lbSetPicture [(lbSize _control)-1,_picture];
} forEach _vehicles;