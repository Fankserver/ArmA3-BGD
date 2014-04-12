/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_queryPlayer.sqf
	Author: Florian "Fank" Kinder

	Description:
	Queries the MySQL data for the player information, if entry is not found
	the result will return an empty array.
*/
private ["_vehicleId","_vehicle","_sql"];
_playerUid = [_this,0,"",[""]] call BIS_fnc_param;
_moneyType = [_this,1,0,[0]] call BIS_fnc_param;
_playerMoney = [_this,2,0,[0]] call BIS_fnc_param;

// Verify playerid
if (_playerUid == "") exitWith {"Invalid PlayerUid"};

_playerMoney = [_playerMoney] call Database_fnc_numberSafe;

// Cash update
if (_moneyType == 1) then {
	"Altis-Life-Hive" callExtension format ["114:%1:%2", _playerUid, _playerMoney];
};

// Bank update
if (_moneyType == 2) then {
	"Altis-Life-Hive" callExtension format ["115:%1:%2", _playerUid, _playerMoney];
};
