/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 */

scriptName "d2k_fnc_addParachute";

params ["_paraUnit","_chuteheight"];

waitUntil {(position _paraUnit select 2) <= _chuteheight};
_paraUnit addBackPack "B_parachute";
If (vehicle _paraUnit IsEqualto _paraUnit ) then {_paraUnit action ["openParachute", _paraUnit]};