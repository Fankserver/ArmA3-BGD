/*
	© 2014, Florian "Fank" Kinder, Niko "nano2k" Bochan. 
	Licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International Public License
	http://creativecommons.org/licenses/by-nc-nd/4.0/
	File: fn_configDetails.sqf
	Author: Florian "Fank" Kinder

	Description:
	-
*/
private["_entity","_config","_configType","_ret","_type","_acc_p","_acc_o","_acc_m","_scope","_displayName","_picture","_config","_itemInfo","_muzzles","_magazines","_desc","_base"];
_entity = [_this,0,"",[""]] call BIS_fnc_param;
_type = -1;
_acc_p = [];
_acc_o = [];
_acc_m = [];
_scope = 0;
_itemInfo = -1;
_muzzles = [];
_magazines = [];

if(_entity == "") exitWith {[]};
_configType = if(isNil {_this select 1}) then {
	switch (true) do {
		case (isClass (configFile >> "CfgMagazines" >> _entity)) : {"CfgMagazines";};
		case (isClass (configFile >> "CfgWeapons" >> _entity)) : {"CfgWeapons";};
		case (isClass (configFile >> "CfgVehicles" >> _entity)) : {"CfgVehicles";};
		case (isClass (configFile >> "CfgGlasses" >> _entity)) : {"CfgGlasses";};
	};
}
else {
	[_this,1,"",[""]] call BIS_fnc_param;
};

//Final Check
_ret = [];
if(typeName _configType != "STRING") exitWith {[]}; //Not a config
if(!isClass (configFile >> _configType >> _entity)) exitWith {[]};
if(_configType == "") exitWith {[]}; //Not a config, who is passing bad data?

_config = configFile >> _configType >> _entity;
_displayName = getText(_config >> "displayName");
_picture = getText(_config >> "picture");
_desc = getText(_config >> "descriptionshort");
_base = inheritsFrom _config;

switch (_config) do
{
	case "CfgVehicles":
	{
		_type = getText(_config >> "vehicleClass");
		_scope = getNumber(_config >> "scope");
	};

	case "CfgWeapons":
	{
		_scope = getNumber(_config >> "scope");
		_type = getNumber(_config >> "type");
		_desc = getText(_config >> "descriptionshort");

		//Compatible attachments
		if(isClass (_config >> "WeaponSlotsInfo")) then
		{
			_acc_p = getArray(_config >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
			_acc_o = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
			_acc_m = getArray(_config >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
		};

		if(isClass (_config >> "ItemInfo")) then
		{
			_itemInfo = getNumber(_config >> "ItemInfo" >> "Type");
		};

		_muzzles = getArray(_config >> "muzzles");
		_magazines = getArray(_config >> "magazines");
		if(!isNil {_muzzles}) then
		{
			private["_tmp"];
		//	_base = inheritsFrom (configFile >> "CfgWeapons" >> _entity);
			{
				if(_x != "this") then
				{
					_tmp = getArray(_base >> _x >> "magazines");
					{
						_magazines set[count _magazines, _x];
					} foreach (_tmp);
				};
			} foreach _muzzles;
		};
	};

	case "CfgMagazines":
	{
		_scope = getNumber(_config >> "scope");
	};
};

_ret = [_entity,_displayName,_picture,_scope,_type,_itemInfo,_config,_magazines,_muzzles,_desc,_acc_p,_acc_o,_acc_m,_base,_configType];
_ret;