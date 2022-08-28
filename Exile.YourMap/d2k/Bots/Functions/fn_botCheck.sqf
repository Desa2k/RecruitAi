/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 */

scriptName "d2k_fnc_botCheck";

params ["_vehicle","_pGroup","_occupants","_occupantClass","_return"];
_return = false;
_occupants = crew _vehicle;
_pGroup = group player;
{
	if (_x isKindOf "Exile_Unit_Player" || _pGroup != group _x) then {} else
	{
		_return = true;
	};
} forEach _occupants;
_return