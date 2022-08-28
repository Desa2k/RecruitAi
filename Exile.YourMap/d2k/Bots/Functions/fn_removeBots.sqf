/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 */

scriptName "d2k_fnc_removeBots";

params ["_vehicle","_occupants","_unit"];

_vehicle = ExileClientInteractionObject;
_occupants = crew _vehicle;
{
	if (_x isKindOf "Exile_Unit_Player") then {} else
	{
		_x action ["getOut", _vehicle];
	};
} forEach _occupants;