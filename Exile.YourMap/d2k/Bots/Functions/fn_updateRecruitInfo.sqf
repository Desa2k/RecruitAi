/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 */

scriptName "d2k_fnc_updateRecruitInfo";

private _display = uiNamespace getVariable ["d2kRecruitAi", displayNull];
private _listbox = _display displayCtrl 1500;
private _infobox = _display displayCtrl 1520;
private _recruitHeader = _display displayCtrl 1540;
private _skillCombo = _display displayCtrl 1530;
private _teamHeader = _display displayCtrl 1550;

lbClear _infobox;
_curSelection = lbCurSel  _listbox;
_unitClass = _listbox lbData _curSelection;
_displayName = getText (configFile >> "CfgVehicles" >> _unitClass >> "displayName");
_weapons = getArray (configFile >> "CfgVehicles" >> _unitClass >> "Weapons");
_recruitHeader ctrlSetText _displayName;
_skillSelection = lbCurSel  _skillCombo;
_multiplier = 1;
if (_skillSelection == 0) then {_multiplier = d2kAiHiX;} else {if (_skillSelection == 1) then {_multiplier = d2kAiMeX;} else {_multiplier = d2kAiLoX;};};

_unitCost = ((d2kRecruitList select _curSelection) select 1) * _multiplier;
_infobox lbAdd format ["Price = %1",_unitCost];

{
	_weaponName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
	if (_weaponName != "Put" && _weaponName != "Throw") then
	{
		_infobox lbAdd _weaponName;
	};
} forEach _weapons;

if (d2kTeamPrice != 0) then
{
if (_skillSelection != d2kOldMultiplier) then
	{
		switch (_skillSelection) do 
		{
			case 0: {if (d2kOldMultiplier == 0) then {} else {if (d2kOldMultiplier == 1) then {d2kTeamPrice = d2kTeamPrice * d2kAiHiX;} else {d2kTeamPrice = (d2kTeamPrice / d2kAiLoX) * d2kAiHiX;}}};
			case 1: {if (d2kOldMultiplier == 0) then {d2kTeamPrice = d2kTeamPrice / d2kAiHiX;} else {if (d2kOldMultiplier == 1) then {} else {d2kTeamPrice = d2kTeamPrice / d2kAiLoX;}}};
			case 2: {if (d2kOldMultiplier == 0) then {d2kTeamPrice = (d2kTeamPrice / d2kAiHiX) * d2kAiLoX;} else {if (d2kOldMultiplier == 1) then {d2kTeamPrice = d2kTeamPrice * d2kAiLoX;} else {}}};
			default {diag_log "d2k_fnc_updateRecruitInfo - Default Array Selected - Something broke";};
		};
	};
};
_teamHeader ctrlSetText format ["Total Team Cost = %1",d2kTeamPrice];
d2kOldMultiplier = _skillSelection;