class d2kRecruitAi
{
	idd = 9002;
	onLoad = "uiNamespace setVariable ['d2kRecruitAi', (_this select 0)]; [] spawn d2k_fnc_recruitDialogLoad;";
	onUnLoad = "uiNamespace setVariable ['d2kRecruitAi', displayNull];d2kTeamPrice = 0;";
	movingEnable = false;
	
	class ControlsBackground
	{
		class backgroundTablet
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.21875;
			y = safeZoneY + safeZoneH * 0.125;
			w = safeZoneW * 0.5625;
			h = safeZoneH * 0.8;
			style = 48;
			text = "d2k\Bots\icons\Tablet.paa";
			colorBackground[] = {0.5843,0.7451,0.5216,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	class Controls
	{
		class lbRecruit
		{
			type = 5;
			idc = 1500;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.35;
			w = safeZoneW * 0.2625;
			h = safeZoneH * 0.41481482;
			style = 16;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,0,0,1};
			colorText[] = {0.4,0.6,0.4,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0.2;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			onLBSelChanged = "[] spawn d2k_fnc_updateRecruitInfo;";
			onMouseButtonDblClick = "[] spawn d2k_fnc_addRecruit;";
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class lbRecruited
		{
			type = 5;
			idc = 1510;
			x = safeZoneX + safeZoneW * 0.56875;
			y = safeZoneY + safeZoneH * 0.57592593;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.12962963;
			style = 16;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,0,0,1};
			colorText[] = {0.4,0.6,0.4,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			onMouseButtonDblClick = "[] spawn d2k_fnc_removeRecruit;";
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class gowLogo
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.65416667;
			y = safeZoneY + safeZoneH * 0.21296297;
			w = safeZoneW * 0.05520834;
			h = safeZoneH * 0.1;
			style = 48;
			text = "d2k\Bots\icons\gowlogosm.paa";
			colorBackground[] = {0.1843,0.7843,0.4039,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class titleBar
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.225;
			w = safeZoneW * 0.35;
			h = safeZoneH * 0.09;
			style = 48;
			text = "d2k\Bots\icons\RecruitBanner2.paa";
			colorBackground[] = {0.2,0.2,0.2,1};
			colorText[] = {1,1,1,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class purchaseButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.58020834;
			y = safeZoneY + safeZoneH * 0.725;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.05;
			style = 0+2;
			text = "Purchase";
			borderSize = 0;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorBackgroundActive[] = {0.2,0.2,0.2,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {1,1,1,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {1,1,1,1};
			colorText[] = {1,0,0,1};
			font = "TahomaB";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onMouseButtonClick = "[] spawn d2k_fnc_recruitAIStart;";
			
		};
		class lbInfo
		{
			type = 5;
			idc = 1520;
			x = safeZoneX + safeZoneW * 0.56875;
			y = safeZoneY + safeZoneH * 0.425;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.10462963;
			style = 16;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {0.4,0.6,0.4,1};
			colorText[] = {0.4,0.6,0.4,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			colorSelectBackground[] = {0.2,0.2,0.2,1};
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class teamHeadder
		{
			type = 0;
			idc = 1550;
			x = safeZoneX + safeZoneW * 0.56875;
			y = safeZoneY + safeZoneH * 0.55;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.025;
			style = 0;
			text = "Team Total Cost = ";
			colorBackground[] = {1,1,1,1};
			colorText[] = {0,0,0,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class recruitHeader
		{
			type = 0;
			idc = 1540;
			x = safeZoneX + safeZoneW * 0.56875;
			y = safeZoneY + safeZoneH * 0.4;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.025;
			style = 2;
			text = "Solider Sniper";
			colorBackground[] = {1,1,1,1};
			colorText[] = {0,0,0,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class selectHeader
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.325;
			w = safeZoneW * 0.2625;
			h = safeZoneH * 0.025;
			style = 2;
			text = "Recruit Selection";
			colorBackground[] = {1,1,1,1};
			colorText[] = {0,0,0,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class skillCombo
		{
			type = 4;
			idc = 1530;
			x = safeZoneX + safeZoneW * 0.56875;
			y = safeZoneY + safeZoneH * 0.35;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02962963;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0.2,0.2,0.2,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,0,0,1};
			colorSelectBackground[] = {0.2,0.2,0.2,1};
			colorText[] = {0.302,0.502,0.302,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			onLBSelChanged = "[] spawn d2k_fnc_updateRecruitInfo;";
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class SkillHeader
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.56875;
			y = safeZoneY + safeZoneH * 0.325;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.025;
			style = 2;
			text = "Skill Level Select";
			colorBackground[] = {1,1,1,1};
			colorText[] = {0,0,0,1};
			font = "TahomaB";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	
};

