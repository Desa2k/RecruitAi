/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 */

scriptName "d2k_fnc_recruitAI";

params ["_player","_pGroup","_units","_newBalance","_skillSelection"];

_heliType = d2kRecruitVic;
_flyHeight = d2kRecruitVicHeight;
_heliDirection = random 360;
_heliStartDistance = d2kRecruitVicDis;
_dropSpot = [(position _player select 0),(position _player select 1),_flyHeight];
_spos =[(_dropSpot select 0) - (sin _heliDirection) * _heliStartDistance, (_dropSpot select 1) - (cos _heliDirection) * _heliStartDistance, (_flyHeight+200)];
_dir = ((_dropSpot select 0) - (_spos select 0)) atan2 ((_dropSpot select 1) - (_spos select 1));
_flySpot = [(_dropSpot select 0) + (sin _dir) * _heliStartDistance, (_dropSpot select 1) + (cos _dir) * _heliStartDistance, _flyHeight];

if (d2kRecruitLocker) then {
	_player setVariable ["ExileLocker", _newBalance, true];
	format["updateLocker:%1:%2", _newBalance, (getPlayerUID _player)] call ExileServer_system_database_query_fireAndForget;
} else {
	_player setVariable ["ExileMoney", _newBalance, true];
	format["setPlayerMoney:%1:%2", _newBalance, _player getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
};

_group = createGroup civilian;
_heli = createVehicle [_heliType, _spos, [], 0, "FLY"];
_heli allowDamage false;
_heli setCaptive true;
_crew = _group createUnit ["O_recon_F", _spos, [], 0, "NONE"];
_crew moveInDriver _heli;
_crew allowDamage false;
_group setCombatMode "BLUE";
_group setBehaviour "CARELESS";

_team = createGroup independent;
{
_recruit = _team createUnit [_x, _spos, [], 0, "NONE"];
_recruit moveInCargo _heli;
_recruit allowDamage false;
} forEach _units;

_wayPoint0 = _group addWaypoint [_dropSpot, 0, 1];
[_group,1] setWaypointBehaviour "CARELESS";
[_group,1] setWaypointCombatMode "BLUE";
[_group,1] setWaypointCompletionRadius 20;
_wayPoint1 = _group addWaypoint [_flySpot, 0, 2];
[_group,2] setWaypointBehaviour "CARELESS";
[_group,2] setWaypointCombatMode "BLUE";
[_group,2] setWaypointCompletionRadius 20;
_heli flyInHeight _flyHeight;

While {true} do 
{
	sleep 0.1;
	if (currentWaypoint _group >= 2) exitWith {};
};

[_heli,_pGroup,_skillSelection] spawn d2k_fnc_recruitEject;

[_heli,_group] spawn 
{
	private ["_heli","_group"];
	_heli = _this select 0;
	_group = _this select 1;
	sleep 30;
	if (alive _heli) then
	{
		{ deleteVehicle _x; } forEach units _group;
		deleteVehicle _heli;
	};
};






















