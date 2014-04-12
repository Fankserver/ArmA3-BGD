class DefaultEventhandlers;
class CfgPatches {
	class waf_server {
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		fileName = "bgd_server.pbo";
		author[] = {"Fank", "nano2k"};
	};
};

class CfgFunctions {
	class Database {
		class MySQL {
			class queryPlayer {};
			class queryVehicle {};
			class queryVehicles {};
			class updatePlayerMoney {};
		};
		class Converter {
			class numberSafe {};
		};
	};
	class RGM {
		class System {
			class getVehicles {};
			class buyVehicle {};
		};
	};
};
