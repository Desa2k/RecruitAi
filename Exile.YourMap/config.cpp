
class CfgInteractionMenus
{
	class Car 
	{
		targetType = 2;
		target = "Car";

		class Actions 
		{

			class removeBots: ExileAbstractAction
			{
				title = "Romove Bots";
				condition = "[_this] call d2k_fnc_botCheck";
				action = "[_this] call d2k_fnc_removeBots";
			};
		};
	};
	class Tank 
	{
		targetType = 2;
		target = "Tank";

		class Actions 
		{

			class removeBots: ExileAbstractAction
			{
				title = "Romove Bots";
				condition = "[_this] call d2k_fnc_botCheck";
				action = "[_this] call d2k_fnc_removeBots";
			};
		};
	};
	class Air 
	{
		targetType = 2;
		target = "Air";

		class Actions 
		{

			class removeBots: ExileAbstractAction
			{
				title = "Romove Bots";
				condition = "[_this] call d2k_fnc_botCheck";
				action = "[_this] call d2k_fnc_removeBots";
			};
		};
	};
	class Boat 
	{
		targetType = 2;
		target = "Ship";

		class Actions 
		{

			class removeBots: ExileAbstractAction
			{
				title = "Romove Bots";
				condition = "[_this] call d2k_fnc_botCheck";
				action = "[_this] call d2k_fnc_removeBots";
			};
		};
	};
};

class XM8_App05_Button: RscExileXM8AppButton1x1
{
textureNoShortcut = "\a3\Ui_f\data\IGUI\Cfg\MPTable\infantry_ca.paa";
text = "Recruit Ai Soldier";
onButtonClick = "closeDialog 0;createDialog 'd2kRecruitAi'";
resource = "";
};
