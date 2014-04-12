class BGD_ShopLandVehicle1 {
	idd = 1000;
	name = "BGD_ShopLandVehicle2";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class RscTitleBackground: BGD_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class MainBackground: BGD_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};

	class controls {
		class Title: BGD_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Land vehicle shop";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		class ConnectionStatus: Title {
			idc = 1001;
			style = 1;
			text = "";
		};

		class VehicleList: BGD_RscListBox {
			idc = 1002;
			text = "";
			sizeEx = 0.035;
			x = 0.12; y = 0.26;
			w = 0.56; h = 0.370;
		};

		class CloseButtonKey : BGD_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class GetCar : BGD_RscButtonMenu {
			idc = -1;
			text = "Buy";
			onButtonClick = "[] call BGD_fnc_buyVehicle";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};