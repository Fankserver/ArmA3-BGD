class DefaultEventhandlers;
class CfgPatches {
	class bgd_server {
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		fileName = "bgd_server.pbo";
		author[] = {"Fank", "nano2k"};
	};
};

class CfgFunctions {
	class Database {
		class Converter {
			file = "\bgd_server\functions\Converter";
			class numberSafe {};
		};
		class MySQL {
			file = "\bgd_server\functions\MySQL";
			class queryPlayer {};
			class queryVehicle {};
			class queryVehicles {};
			class queryWeapons {};
			class queryWeapon {};
			class updatePlayerMoney {};
		};
	};
	class BGDS {
		class System {
			file = "\bgd_server\functions\System";
			class getVehicles {};
			class getWeapons {};
			class buyVehicle {};
			class buyItem {};
			class initVehicle {};
			class handleRespawn {};
			class handleKill {};
			class onPlayerConnected {};
			class vehicleMaintenance {};
		};
	};
};
