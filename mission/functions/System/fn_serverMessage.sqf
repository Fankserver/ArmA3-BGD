/*
	© 2014, Florian "Fank" Kinder, Niko "nano2k" Bochan. 
	Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International Public License
	http://creativecommons.org/licenses/by-nc-nd/4.0/
	File: fn_serverMessage.sqf
	Author: Niko "nano2k" Bochan

	Description:
	-
*/
private ["_type","_message"];
_type = [_this,0,0,[0]] call BIS_fnc_param;
_message = [_this,1,"",[""]] call BIS_fnc_param;

// only for type 3 (cutText)
_ctType = [_this,2,"PLAIN",[""]] call BIS_fnc_param;
_ctSpeed = [_this,3,1,[0]] call BIS_fnc_param;
_ctShowOnMap = [_this,4,false,[false]] call BIS_fnc_param;

if (_message != "" && _type != 0) then {
	switch (_type) do {
		case 1: {systemChat _message};
		case 2: {hint _message};
		case 3: {cutText [_message, _ctType, _ctSpeed, _ctShowOnMap]};
	};
};