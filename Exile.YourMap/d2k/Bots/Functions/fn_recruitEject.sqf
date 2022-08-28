/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 */

scriptName "d2k_fnc_recruitEject";

params ["_vehicle","_pGroup","_skillSelection","_paras","_crew"];

_vehicle = _this select 0;
_paras = [];
_crew = crew _vehicle;

{
    _isCrew = assignedVehicleRole _x;
        if(count _isCrew > 0) then
    {
        if((_isCrew select 0) == "Cargo") then
        {
        _paras pushback _x
        };
    };
} foreach _crew;

_chuteheight = 100;
_dir = direction _vehicle;

{
    _x setVariable ["Saved_Loadout",getUnitLoadout _x];
    removeBackpack _x;
    _x disableCollisionWith _vehicle;
    _x allowdamage false;
    unassignvehicle _x;
    moveout _x;
    _x setDir (_dir + 90);
    _x setvelocity [0,0,-5];
    sleep 0.3;
} forEach _paras;

{
    [_x,_chuteheight,_pGroup,_skillSelection] spawn d2k_fnc_paraLandSafe;
} forEach _paras;

