/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_getWeapons.sqf
	Author: Florian "Fank" Kinder

	Description:
	Sends a request to query the database information and returns weapons
	for the players side.
*/
private ["_player","_weaponType","_playerSide","_weapons"];
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_weaponType = [_this,1,0,[0]] call BIS_fnc_param;

diag_log _player;
diag_log _weaponType;

if (_player == objNull) exitWith {};

_playerSide = str(side _player);
if (!(_playerSide in ["WEST","EAST","GUER"])) exitWith {};

_weapons = [_playerSide,_weaponType] call Database_fnc_queryWeapons;

diag_log _weapons;

[[_weapons], "BGD_fnc_showWeapons", (owner _player)] spawn BIS_fnc_MP;