#include "script_component.hpp"

private _bool = [(missionConfigFile >> "PermaDeath"), "usePermaDeath", 0] call BIS_fnc_returnConfigEntry;

if (_bool == 1) then {
    ["ace_unconscious", {
        params ["_unit", "_state"];

        // execute only when event is fired locally
        if (player isEqualTo _unit) then {
            [{
                [_this call FUNC(onPlayerUnconscious), _this] call CBA_fnc_execNextFrame;
            },[_unit,_state], 1] call CBA_fnc_waitAndExecute;
        };
    }] call CBA_fnc_addEventHandler;

    [{time > (_this + 3)},{
        if (!(isNull (getAssignedCuratorLogic ace_player)) && {isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles")}) then {
            call FUNC(addZeusLogic);
        };
    },time] call CBA_fnc_waitUntilAndExecute;
};
