#include "script_component.hpp"

private _exec = missionNameSpace getVariable [QGVAR(onKilledExec), ""];

if !(_exec isEqualTo "") then {
     _this call compile _exec;
};
