class DefaultEventhandlers;
class CfgPatches {
	class waf_server {
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		fileName = "rgm_server.pbo";
		author[] = { "Fank", "nano2k" };
	};
};

class CfgFunctions {
	class Database {
		class MySQL {
			class queryPlayer {};
		};
	};
	class RGM {
		class System {
			class buyVehicle {};
		};
	};
};
