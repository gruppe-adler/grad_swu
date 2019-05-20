#include "script_component.hpp"
//notification for curator if player switches to DIE & SPECTATE

params ["_name"];

["ScoreAdded" ,["Spectating now: " + _name]] call bis_fnc_showNotification;

// add name to list to retreive later on
private _allSpectators = missionNameSpace getVariable [QGVAR(spectatorList), []];
_allSpectators pushback [_name];
missionNameSpace setVariable [QGVAR(spectatorList), _allSpectators];
