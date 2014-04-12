// Setup eventhandlers
player addEventHandler ["HandleDamage", BGD_fnc_handleDamage];
player addEventHandler ["Respawn", BGD_fnc_localRespawn];
[player] call BGD_fnc_localRespawn;

BGD_money = 0;

[] execFSM "client.fsm";