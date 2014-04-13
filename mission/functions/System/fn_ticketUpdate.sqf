/*
	Copyright © 2014 Niko "nano2k" Bochan, All rights reserved
	File: fn_ticketUpdate.sqf
	Author: Niko "nano2k" Bochan

	Description:
	-
*/
private ["_tickets"];
_ticketsWest = [_this,0,0,[0]] call BIS_fnc_param;
_ticketsResistance = [_this,1,0,[0]] call BIS_fnc_param;
_ticketsCivilian = [_this,2,0,[0]] call BIS_fnc_param;

BGD_tickets set [0, _ticketsWest];
BGD_tickets set [1, _ticketsResistance];
BGD_tickets set [2, _ticketsCivilian];