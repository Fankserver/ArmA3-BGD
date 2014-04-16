/*
	© 2014, Florian "Fank" Kinder, Niko "nano2k" Bochan. 
	Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International Public License
	http://creativecommons.org/licenses/by-nc-nd/4.0/
*/
// Setup eventhandlers
player addEventHandler ["HandleDamage", BGD_fnc_handleDamage];
player addEventHandler ["Respawn", BGD_fnc_localRespawn];
player addEventHandler ["Killed", BGD_fnc_handleKill];
[player] call BGD_fnc_localRespawn;

// Setup variables
BGD_money = 0;

enableRadio false;
0 fadeRadio 0;

[] execFSM "client.fsm";