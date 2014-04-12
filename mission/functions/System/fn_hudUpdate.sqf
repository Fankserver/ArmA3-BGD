/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_hudUpdate.sqf
	Author: Florian "Fank" Kinder

	Description:
	-
*/
private["_hud","_health","_money"];
disableSerialization;

_hud = uiNameSpace getVariable ["playerHUD", displayNull];
if(isNull _hud) exitWith {};
_health = _hud displayCtrl 23500;
_money = _hud displayCtrl 23501;

//Update health
_health ctrlSetPosition [(safeZoneX + safeZoneW - 0.090), (safeZoneY + safeZoneH - 0.502)];
_health ctrlSetText format["%1", round((1 - (damage player)) * 100)];
_health ctrlCommit 0;

//Update money
_money ctrlSetPosition [(safeZoneX + safeZoneW - 0.090), (safeZoneY + safeZoneH - 0.456)];
_money ctrlSetText format["%1", BGD_money];
_money ctrlCommit 0;