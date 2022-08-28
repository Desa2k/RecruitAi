/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 */

scriptName "d2k_fnc_recruitDialogLoad";

private _display = uiNamespace getVariable ["d2kRecruitAi", displayNull];
private _listbox = _display displayCtrl 1500;
private _skillCombo = _display displayCtrl 1530;
lbClear _listbox;
lbClear _skillCombo;
{
	_displayName = getText (configFile >> "CfgVehicles" >> _x select 0 >> "displayName");
	_preview = getText (configFile >> "CfgVehicles" >> _x select 0 >> "editorPreview");
	private _index = _listbox lbAdd _displayName;
	_listbox lbSetPicture [_index, _preview];
	_listbox lbSetPictureColor [_index, [1,1,1,1]];
	_listbox lbSetPictureColorSelected [_index, [1,1,1,1]];
	_listbox lbSetData [_index, _x select 0];
	diag_log format ["Test %1", _preview];

} forEach d2kRecruitList;

_skillCombo lbAdd "High";
_skillCombo lbAdd "Medium";
_skillCombo lbAdd "Low";
_listbox lbSetCurSel 0;
_skillCombo lbSetCurSel 1;