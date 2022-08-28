/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 */

scriptName "d2k_fnc_addRecruit";

private _display = uiNamespace getVariable ["d2kRecruitAi", displayNull];
private _listboxR = _display displayCtrl 1500;
private _listboxA = _display displayCtrl 1510;
private _skillCombo = _display displayCtrl 1530;
private _teamHeader = _display displayCtrl 1550;
_teamSize = lbSize _listboxA;

if (d2kTeamMaxSize <= _teamSize) exitWith
{
	["ErrorTitleAndText",["Recruit Ai Error", format["You can only recruit %1 Ai at once!",d2kTeamMaxSize]]] call ExileClient_gui_toaster_addTemplateToast;
	playSound "FD_CP_Not_Clear_F";
	breakOut "d2k_fnc_addRecruit";
};
_curSelection = lbCurSel  _listboxR;
_type = _listboxR lbData _curSelection;
_displayName = getText (configFile >> "CfgVehicles" >> _type >> "displayName");
_index = _listboxA lbAdd _displayName;
_listboxA lbSetData [_index, _type];
_skillSelection = lbCurSel  _skillCombo;
_multiplier = 1;
if (_skillSelection == 0) then {_multiplier = d2kAiHiX;} else {if (_skillSelection == 1) then {_multiplier = d2kAiMeX;} else {_multiplier = d2kAiLoX;};};
_unitCost = ((d2kRecruitList select _curSelection) select 1) * _multiplier;
d2kTeamPrice = d2kTeamPrice + _unitCost;
_teamHeader ctrlSetText format ["Total Team Cost = %1",d2kTeamPrice];