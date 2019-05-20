#include "script_component.hpp"
//prepare ace spec

private _cameraModes = [(missionConfigFile >> "PermaDeath"), "cameraModes", [0,1,2]] call BIS_fnc_returnConfigEntry;
private _visionModes = [(missionConfigFile >> "PermaDeath"), "visionModes", [-2,-1]] call BIS_fnc_returnConfigEntry;
private _spectatableSides = [(missionConfigFile >> "PermaDeath"), "spectatableSides", [west,east,independent,civilian]] call BIS_fnc_returnConfigEntry;

if (_cameraModes isEqualTo [0,1,2]) then {
    _cameraModes = [_cameraModes, []];
}else{
    private _checkModes = _cameraModes;
    private _array1 = [];
    private _array2 = [];
    {
        if (_x in _checkModes) then {
            _array1 pushBackUnique _x;
        }else{
            _array2 pushBackUnique _x;
        };
    }forEach [0,1,2];

    _cameraModes = [_array1, _array2;
};

if (_visionModes isEqualTo [-2,-1]) then {
    _visionModes = [_visionModes,[0,1,2,3,4,5,6,7]];
}else{
    private _checkModes = _visionModes;
    private _array1 = [];
    private _array2 = [];
    {
        if (_x in _checkModes) then {
            _array1 pushBackUnique _x;
        }else{
            _array2 pushBackUnique _x;
        };
    }forEach [-2,-1,0,1,2,3,4,5,6,7];

    _visionModes = [_array1, _array2;
};

if (_spectatableSides isEqualTo [west,east,independent,civilian]) then {
    _spectatableSides = [_spectatableSides,[]];
}else{
    private _spectatableSides = _spectatableSides;
    private _array1 = [];
    private _array2 = [];
    {
        if (_x in _checkModes) then {
            _array1 pushBackUnique _x;
        }else{
            _array2 pushBackUnique _x;
        };
    }forEach [west,east,independent,civilian];

    _spectatableSides = [_array1, _array2;
};

_cameraModes call ace_spectator_fnc_updateCameraModes; // no free cam
_visionModes call ace_spectator_fnc_updateVisionModes; // no thermal
[(_cameraModes select 0 select 0), player] call ace_spectator_fnc_setCameraAttributes; // center on player
_spectatableSides call ace_spectator_fnc_updateSides; // all sides

[true] call ace_spectator_fnc_setSpectator; // launch spec
[player, true] call TFAR_fnc_forceSpectator; // force tfar spec

private _allCuratorUnits = [];

{
    _allCuratorUnits pushback (getAssignedCuratorUnit _x);
} forEach allCurators;

[name player] remoteExec [QGVAR(showNotification), _allCuratorUnits, true];
