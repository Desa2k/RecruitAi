/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 */

scriptName "d2k_fnc_removeRecruit";

private _display = uiNamespace getVariable ["d2kRecruitAi", displayNull];
private _listbox = _display displayCtrl 1510;
private _skillCombo = _display displayCtrl 1530;
private _teamHeader = _display displayCtrl 1550;

_curSelection = lbCurSel  _listbox;
_unitClass = _listbox lbData _curSelection;
_path = [d2kRecruitList, _unitClass] call BIS_fnc_findNestedElement;
_index = _path select 0;
_skillSelection = lbCurSel _skillCombo;
_multiplier = 1;
if (_skillSelection == 0) then {_multiplier = d2kAiHiX;} else {if (_skillSelection == 1) then {_multiplier = d2kAiMeX;} else {_multiplier = d2kAiLoX;};};
_unitPrice = ((d2kRecruitList select _index) select 1) * _multiplier;
d2kTeamPrice = d2kTeamPrice - _unitPrice;
_teamHeader ctrlSetText format ["Total Team Cost = %1",d2kTeamPrice];
_listbox lbDelete _curSelection;