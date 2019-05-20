#include "script_component.hpp"

["PermaChoice", "Show List of DIE & SPECTATE Players", {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    private _spectatorList = missionNameSpace getVariable [QGVAR(spectatorList), []];
    private _stringify = str _spectatorList;
    ["AllSpectators", [_stringify]] call bis_fnc_showNotification;
}] call Ares_fnc_RegisterCustomModule;

["PermaChoice", "Debrief", {
    // Get all the passed parameters
    params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [_position] remoteExec [FUNC(forceRespawn), [0,-2] select isDedicated, true];
}] call Ares_fnc_RegisterCustomModule;
