/*
	© 2014, Florian "Fank" Kinder, Niko "nano2k" Bochan.
	Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International Public License
	http://creativecommons.org/licenses/by-nc-nd/4.0/
	File: fn_showWeapons.sqf
	Author: Florian "Fank" Kinder

	Description:
	-
*/
private["_weapons","_control"];
disableSerialization;
_weapons = [_this,0,[],[[]]] call BIS_fnc_param;

waitUntil {!isNull (findDisplay 1100)};

if(count _weapons == 0) exitWith {
	ctrlSetText[1101,"Keine Waffen vorhanden"];
};

ctrlSetText[1101,"Verbindung OK"];
_control = ((findDisplay 1100) displayCtrl 1102);
lbClear _control;

{
	_itemInfo = [_x select 1] call BGD_fnc_configDetails;
	_control lbAdd format ["%1 - Wert: $%2", (_itemInfo select 1), [parseNumber (_x select 2)] call BGD_fnc_numberText];
	_control lbSetData [(lbSize _control)-1, (_itemInfo select 0)];
	_control lbSetValue [(lbSize _control)-1, (call compile format["%1", _x select 0])];
	_control lbSetPicture [(lbSize _control)-1, (_itemInfo select 2)];
} forEach _weapons;