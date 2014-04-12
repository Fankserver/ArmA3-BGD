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
			file = "\bgd_server\functions\MySQL";
			class queryPlayer {};
			class queryVehicle {};
			class queryVehicles {};
			class updatePlayerMoney {};
		};
		class Converter {
			file = "\bgd_server\functions\Converter";
			class numberSafe {};
		};
	};
	class BGDS {
		class System {
			file = "\bgd_server\functions\System";
			class getVehicles {};
			class buyVehicle {};
		};
	};
};
