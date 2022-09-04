/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 */

scriptName "d2k_fnc_paraLandSafe";

params ["_unit","_chuteheight","_pGroup","_skillSelection"];

(vehicle _unit) allowDamage false;
[_unit,_chuteheight] spawn d2k_fnc_addParachute;
waitUntil { isTouchingGround _unit || (position _unit select 2) < 1 };
_unit action ["eject", vehicle _unit];
sleep 1;
_unit setUnitLoadout (_unit getVariable ["Saved_Loadout",[]]);
if (_skillSelection == 0) then
{
	_unit setskill ["aimingAccuracy",d2kAiHighSill select 0];
	_unit setskill ["aimingShake",d2kAiHighSill select 1];
	_unit setskill ["aimingSpeed",d2kAiHighSill select 2];
	_unit setskill ["spotDistance",d2kAiHighSill select 3];
	_unit setskill ["spotTime",d2kAiHighSill select 4];
	_unit setskill ["courage",d2kAiHighSill select 5];
	_unit setskill ["reloadSpeed",d2kAiHighSill select 6];
	_unit setskill ["commanding",d2kAiHighSill select 7];
	_unit setskill ["general",d2kAiHighSill select 8];
	_unit setskill ["general",d2kAiHighSill select 9];
} else {
	if (_skillSelection == 1) then
	{
		_unit setskill ["aimingAccuracy",d2kAiMediumSill select 0];
		_unit setskill ["aimingShake",d2kAiMediumSill select 1];
		_unit setskill ["aimingSpeed",d2kAiMediumSill select 2];
		_unit setskill ["spotDistance",d2kAiMediumSill select 3];
		_unit setskill ["spotTime",d2kAiMediumSill select 4];
		_unit setskill ["courage",d2kAiMediumSill select 5];
		_unit setskill ["reloadSpeed",d2kAiMediumSill select 6];
		_unit setskill ["commanding",d2kAiMediumSill select 7];
		_unit setskill ["general",d2kAiMediumSill select 8];
	} else {
		_unit setskill ["aimingAccuracy",d2kAiLowSill select 0];
		_unit setskill ["aimingShake",d2kAiLowSill select 1];
		_unit setskill ["aimingSpeed",d2kAiLowSill select 2];
		_unit setskill ["spotDistance",d2kAiLowSill select 3];
		_unit setskill ["spotTime",d2kAiLowSill select 4];
		_unit setskill ["courage",d2kAiLowSill select 5];
		_unit setskill ["reloadSpeed",d2kAiLowSill select 6];
		_unit setskill ["commanding",d2kAiLowSill select 7];
		_unit setskill ["general",d2kAiLowSill select 8];
	};
};
	
_unit setCombatMode "RED";
_unit allowFleeing 0;
_unit setVariable ["ExileMoney",d2kRecruitPopTabs,true];
while {(group _unit) != _pGroup} do 
{
	[_unit] joinSilent grpNull;
	[_unit] join _pGroup; // Change "join" to "joinSilent" for no radio messages
	uiSleep 0.5;
};
uiSleep 3;
[_unit] join _pGroup; // Change "join" to "joinSilent" for no radio messages
_unit setDamage 0;
_unit allowdamage true;






















