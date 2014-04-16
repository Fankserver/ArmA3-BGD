/*
	© 2014, Florian "Fank" Kinder, Niko "nano2k" Bochan. 
	Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International Public License
	http://creativecommons.org/licenses/by-nc-nd/4.0/
	File: fn_ticketUpdate.sqf
	Author: Niko "nano2k" Bochan

	Description:
	-
*/
private ["_tickets"];
_ticketsWest = [_this,0,0,[0]] call BIS_fnc_param;
_ticketsEast = [_this,1,0,[0]] call BIS_fnc_param;
_ticketsResistance = [_this,2,0,[0]] call BIS_fnc_param;

BGD_tickets set [0, _ticketsWest];
BGD_tickets set [1, _ticketsEast];
BGD_tickets set [2, _ticketsResistance];