/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 */

scriptName "d2k_fnc_recruitAIStart";

params ["_player","_pGroup","_units"];

private _display = uiNamespace getVariable ["d2kRecruitAi", displayNull];
private _listbox = _display displayCtrl 1510;
private _skillCombo = _display displayCtrl 1530;
_player = player;
_pGroup = group _player;
_playerMoney = 0;
_skillSelection = lbCurSel  _skillCombo;

_units = [];
_count = lbSize _listbox;
if (_count == 0) exitWith
{
	["ErrorTitleAndText",["Recruit Ai Error", format["Select Units to recruit before purchasing!"]]] call ExileClient_gui_toaster_addTemplateToast;
	playSound "FD_CP_Not_Clear_F";
	breakOut "d2k_fnc_recruitAIStart";
};
for "_i" from 0 to (_count - 1) do 
{
	_unit = _listbox lbData _i;
	_units pushBack _unit;
};

if (d2kRecruitLocker) then 
{
	_playerMoney = _player getVariable ["ExileLocker", 0];
	if (d2kTeamPrice > _playerMoney) exitWith
		{
			["ErrorTitleAndText",["Recruit Ai Error", format["You don't have enough money in your locker to request this team!"]]] call ExileClient_gui_toaster_addTemplateToast;
			playSound "FD_CP_Not_Clear_F";
			breakOut "d2k_fnc_recruitAIStart";
		};
} else {
	_playerMoney = _player getVariable ["ExileMoney", 0];
	if (d2kTeamPrice > _playerMoney) exitWith
		{
			["ErrorTitleAndText",["Recruit Ai Error", format["You don't have enough money in your wallet to request this team!"]]] call ExileClient_gui_toaster_addTemplateToast;
			playSound "FD_CP_Not_Clear_F";
			breakOut "d2k_fnc_recruitAIStart";
		};
};
_newBalance = _playerMoney - d2kTeamPrice;
_display closeDisplay 0;
_confirmMsg = format ["This will deduct $%1 from your account and deliver the team by para drop.<br/>",d2kTeamPrice];
_confirmMsg = _confirmMsg + format ["<br/><t font='EtelkaMonospaceProBold'>Recruit Ai</t>"];
if ([parseText _confirmMsg, "Confirm", "Order!", true] call BIS_fnc_guiMessage) then
{
	[_player,_pGroup,_units,_newBalance,_skillSelection] remoteExec ["d2k_fnc_recruitAi",2];
	["SuccessTitleAndText", ["Recruit Ai", "Team in route!"]] call ExileClient_gui_toaster_addTemplateToast;
};
















