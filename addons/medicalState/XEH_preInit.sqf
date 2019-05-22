#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[QGVAR(showMedicalStateWhileUnconscious), "CHECKBOX", [localize LSTRING(showMedicalStateWhileUnconscious_displayName), localize LSTRING(showMedicalStateWhileUnconscious_tooltip)], localize LSTRING(settingCategory), true] call CBA_Settings_fnc_init;

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

ADDON = true;
