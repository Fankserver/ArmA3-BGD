// Setup eventhandlers
player addEventHandler ["HandleDamage", BGD_fnc_handleDamage];
player addEventHandler ["Respawn", BGD_fnc_localRespawn];
player addEventHandler ["Killed", BGD_fnc_handleKill];
[player] call BGD_fnc_localRespawn;

// Setup variables
BGD_money = 0;
BGD_tickets = [1000,1000,1000];

enableRadio false;

[] execFSM "client.fsm";