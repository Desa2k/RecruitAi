execVM "R3F_LOG\init.sqf";
[] execVM "Custom\EnigmaRevive\init.sqf";
[] execVM "addons\DAPE\DAPE.sqf";   // Dynamic Air Patrol Mission
[] execVM "d2k\init.sqf";


//RRR
Bones_fnc_playSounds = compileFinal (preprocessFileLineNumbers "custom\vehicleManagementSystem\Functions\Bones_fnc_playSounds.sqf");
Bones_fnc_showServicePointDialogue = compileFinal (preprocessFileLineNumbers "custom\vehicleManagementSystem\GUI\Bones_fnc_showServicePointDialogue.sqf");
Bones_fnc_getVehicleLoadout = compileFinal (preprocessFileLineNumbers "custom\vehicleManagementSystem\Functions\Bones_fnc_getVehicleLoadout.sqf");
Bones_fnc_getReloadable = compileFinal (preprocessFileLineNumbers "custom\vehicleManagementSystem\Functions\Bones_fnc_getReloadable.sqf");
Bones_fnc_performAction = compileFinal (preprocessFileLineNumbers "custom\vehicleManagementSystem\Functions\Bones_fnc_performAction.sqf");
Bones_fnc_getReloadCost = compileFinal (preprocessFileLineNumbers "custom\vehicleManagementSystem\Functions\Bones_fnc_getReloadCost.sqf");
Bones_fnc_getRepairable = compileFinal (preprocessFileLineNumbers "custom\vehicleManagementSystem\Functions\Bones_fnc_getRepairable.sqf");
Bones_fnc_getRepairableCosts = compileFinal (preprocessFileLineNumbers "custom\vehicleManagementSystem\Functions\Bones_fnc_getRepairableCosts.sqf");
Bones_fnc_vmsChecks = compileFinal (preprocessFileLineNumbers "custom\vehicleManagementSystem\Functions\Bones_fnc_vmsChecks.sqf");
vmsConfig = compileFinal (preprocessFileLineNumbers "custom\vehicleManagementSystem\vmsConfig.sqf");
d2k_dayOfWeek = compileFinal (preprocessFileLineNumbers "d2k_dayOfWeek.sqf");
//ammo save
Bones_fnc_getVehicleLoadout = compileFinal (preprocessFileLineNumbers "custom\ammoSave\Bones_fnc_getVehicleLoadout.sqf");
[] call vmsConfig;
[] execVM "custom\vehicleManagementSystem\Functions\takegive_poptab_init.sqf";
[] execVM "custom\vehicleManagementSystem\Functions\Bones_fnc_markServicePoints.sqf";
if (!isServer)  then 
{
[] execVM "custom\vehicleManagementSystem\functions\Bones_fnc_vspInRange.sqf";
[] execVM "custom\vehicleManagementSystem\functions\Bones_fnc_disableDefaultRefuel.sqf";
};


CHVD_allowNoGrass = true; // Set 'false' if you want to disable "Low" option for terrain (default: true)
CHVD_maxView = 5000; // Set maximum view distance (default: 12000)
CHVD_maxObj = 5000; // Set maximimum object view distance (default: 12000)

//Rearm
call compileFinal preprocessFileLineNumbers "takegive_poptab_init.sqf";

if(hasInterface) then{
    call compileFinal preprocessFileLineNumbers "service_point.sqf";
};

//Deploy Ai Units
[] call compile preprocessFileLineNumbers "custom\Unit\guard.sqf";
//1 Man Tank
[] execVM "custom\1ManTank\1ManTank.sqf";
//No Fog
[] execVM "custom\NoFog\NoFog.sqf";
// scarCODE ServerInfoMenu
//[] ExecVM "scarCODE\ServerInfoMenu\sqf\initLocal.sqf";

/*
//remove trash
if (isDedicated) then {
 
private _repleacearray = [
 
    ["hiluxt.p3d", "Land_ClutterCutter_small_F", 0],
    ["wreck_uaz_f.p3d", "Land_ClutterCutter_small_F", 0],
    ["wreck_skodovka_f.p3d", "Land_ClutterCutter_small_F", 0],
    ["czechhedgehog_01_f.p3d", "Land_ClutterCutter_small_F", 0], 
 
    ["datsun02t.p3d", "Land_ClutterCutter_small_F", 0],
    ["datsun01t.p3d", "Land_ClutterCutter_small_F", 0],
    ["bmp2_wrecked.p3d", "Land_ClutterCutter_small_F", 0],
    ["brdm2_wrecked.p3d", "Land_ClutterCutter_small_F", 0], 
    ["garbagewashingmachine_f.p3d", "Land_ClutterCutter_small_F", 0],
    ["garbage_paleta.p3d", "Land_ClutterCutter_small_F", 0],
    ["garbage_misc.p3d", "Land_ClutterCutter_small_F", 0],  
    ["garbage_square5_f.p3d", "Land_ClutterCutter_small_F", 0],
    ["wreck_ural_f.p3d", "Land_ClutterCutter_small_F", 0],
    ["hiluxt.p3d", "Land_ClutterCutter_small_F", 0],
    ["wreck_brdm2_f.p3d", "Land_ClutterCutter_small_F", 0],
    ["wreck_skodovka_f.p3d", "Land_ClutterCutter_small_F", 0],               
    ["wreck_hmmwv_f.p3d", "Land_ClutterCutter_small_F", 0],    
    ["wreck_ural_f.p3d", "Land_ClutterCutter_small_F", 0],        
    ["wreck_bmp2_f.p3d", "Land_ClutterCutter_small_F", 0], 
    ["garbagepallet_f.p3d", "Land_ClutterCutter_small_F", 0], 
    ["mrtvola_army2.p3d", "Land_ClutterCutter_small_F", 0],
    ["mrtvola_army1.p3d", "Land_ClutterCutter_small_F", 0], 
    ["hanged.p3d", "Land_ClutterCutter_small_F", 0]
];
 
 
{
    private _a = ((getModelInfo _x) select 0);
    private _c = _repleacearray select {_a == _x select 0};
    
    if !( _c isEqualTo []) then {
    
        private _b = ((getModelInfo _x) select 1);
        private _replacetree = ([(_c select 0) select 1] call BIS_fnc_simpleObjectData) select 1;
        private _directionOffset = (_c select 0) select 2;
 
        private _position = getPosWorld _x;
        private _vectorDirUp = [vectorDir _x, vectorUp _x];
 
        hideObjectGlobal  _x;
        private _simpletree = createSimpleObject [_replacetree, _position];
        _simpletree setVectorDirAndUp _vectorDirUp;
        _simpletree setDir (getdir _simpletree) + _directionOffset;
        _simpletree enableSimulationGlobal false;
        
        
    
    };
 
        
} forEach nearestTerrainObjects 
    [
        [worldSize/2, worldSize/2], 
        [], 
        worldSize, 
        false
    ];
};
*/