/*
	Copyright © 2014 Florian "Fank" Kinder, All rights reserved
	File: fn_buyVehicle.sqf
	Author: Florian "Fank" Kinder

	Description:
	Queries the MySQL data for the player information, if entry is not found
	the result will return an empty array.
*/
private ["_player","_itemId","_playerUid","_playerData","_itemData","_playerMoney","_itemPrice","_itemInfo"];
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_itemId = [_this,1,0,[0]] call BIS_fnc_param;

// Validate parameter
if (_player == objNull || _itemId == 0) exitWith {};

// Get player uid
_playerUid = getPlayerUID _player;
if (_playerUid == "") exitWith {};

// Get player data
_playerData = [_playerUid] call Database_fnc_queryPlayer;
if ((count _playerData) == 0) exitWith {};

// Get vehicle data
_itemData = [_itemId] call Database_fnc_queryWeapon;
if ((count _itemData) == 0) exitWith {};

_playerMoney = (parseNumber (_playerData select 1)) + (parseNumber (_playerData select 2));
_itemPrice = (parseNumber (_itemData select 2));

// Enought money to buy the vehicle
if (_playerMoney >= _itemPrice) then {
	_playerMoney = (_playerMoney - _itemPrice);
	_canAdd = false;

	_itemInfo = [(_itemData select 1)] call BGD_fnc_configDetails;
	switch (_itemInfo select 14) do {
		case "CfgMagazines": {
			if (_player canAdd configName (_itemInfo select 6)) then {
				_canAdd = true;
			};

			if (_canAdd) then {
				_player addMagazineGlobal (_itemData select 1);
			};
		};
		case "CfgWeapons": {
			_isItem = false;

			switch (getNumber((_itemInfo select 6) >> "type")) do {
				// Primary
				case 1: {
					if (_player canAdd configName (_itemInfo select 6) || (primaryWeapon _player) == "") then {
						_canAdd = true;
					};
				};
				// Secondary
				case 2: {
					if (_player canAdd configName (_itemInfo select 6) || (handgunWeapon _player) == "") then {
						_canAdd = true;
					};
				};
				// Launcher
				case 4: {
					if (_player canAdd configName (_itemInfo select 6) || (secondaryWeapon _player) == "") then {
						_canAdd = true;
					};
				};
				// Other
				//default {
				//	_isItem = true;
				//	if (_player canAdd configName (_itemInfo select 6)) then {
				//		_canAdd = true;
				//	};
				//};
			};

			if (_canAdd) then {
				//if (_isItem) then {
				//	_player addPrimaryWeaponItem (_itemData select 1);
				//}
				//else {
					_player addWeaponGlobal (_itemData select 1);
				//};
			};
		};
		// only client side spawn able
		//case "CfgVehicles": {
		//	_configParents = [(_itemInfo select 6), true] call BIS_fnc_returnParents;
        //
		//	// Backpack
		//	if ("Bag_Base" in _configParents) then {
		//		if (backpack _player == "") then {
		//			_canAdd = true;
		//			_player addBackpackGlobal (_itemData select 1);
		//		};
		//	};
        //
		//	// Vest
		//	if ("Vest_Base_F" in _configParents) then {
		//		if (vest _player == "") then {
		//			_canAdd = true;
		//			_player addVestGlobal (_itemData select 1);
		//		};
		//	};
		//};
	};

	if (_canAdd) then {
		[_playerUid,1,0] spawn Database_fnc_updatePlayerMoney; // Update Cash
		[_playerUid,2,_playerMoney] spawn Database_fnc_updatePlayerMoney; // Update Bank
		[[_playerMoney], "BGD_fnc_moneyUpdate", (owner _player)] spawn BIS_fnc_MP;
	}
	else {
		[[2, "OUT OF SPACE"], "BGD_fnc_serverMessage", (owner _player)] spawn BIS_fnc_MP;
	};
}
else {
	[[2, "OUT OF MONEY"], "BGD_fnc_serverMessage", (owner _player)] spawn BIS_fnc_MP;
};