/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_hudUpdate.sqf
	Author: Florian "Fank" Kinder

	Description:
	-
*/
private["_hud","_status","_tickets"];
disableSerialization;

1000 cutRsc ["playerHUD","PLAIN"];
_hud = uiNameSpace getVariable ["PlayerHUD", displayNull];
if(isNull _hud) exitWith {};

_status = _hud displayCtrl 3500;
_status ctrlSetStructuredText parseText format ["%1 <img size='0.8' image='icons\health.paa'/><br/>%2 <img size='0.8' image='icons\money.paa'/>", round((1 - (damage player)) * 100), [BGD_money] call BGD_fnc_numberText];
_status ctrlCommit 0;

_tickets = _hud displayCtrl 3501;
_tickets ctrlSetStructuredText parseText format ["%1 <img size='1' image='\a3\ui_f\data\map\Markers\Flags\nato_ca.paa'/>  %2 <img size='1' image='\a3\ui_f\data\map\Markers\Flags\csat_ca.paa'/>  %3 <img size='1' image='\a3\ui_f\data\map\Markers\Flags\altis_ca.paa'/>", (BGD_tickets select 0), (BGD_tickets select 1), (BGD_tickets select 2)];
_tickets ctrlCommit 0;
