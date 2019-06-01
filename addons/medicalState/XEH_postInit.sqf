#include "script_component.hpp"

["ace_unconscious", {
    params ["_unit", "_state"];

    // execute only when event is fired locally
    if (GVAR(showMedicalStateWhileUnconscious) && {player isEqualTo _unit}) then {
        if (_state) then {
            [{
                [[_this] call FUNC(openMenu), _this] call CBA_fnc_execNextFrame;
            }, _unit, 1] call CBA_fnc_waitAndExecute;
        }else{
            [objNull] call FUNC(openMenu);
        };
    };
}] call CBA_fnc_addEventHandler;
