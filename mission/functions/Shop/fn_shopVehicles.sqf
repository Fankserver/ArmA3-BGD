createDialog "BGD_ShopLandVehicle";

disableSerialization;

ctrlSetText [1001, "Fetching Vehicles...."];

[[player],"BGDS_fnc_getVehicles"] spawn BIS_fnc_MP;