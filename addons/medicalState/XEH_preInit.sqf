#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[
    QGVAR(showMedicalStateWhileUnconscious),
    "CHECKBOX",
    [
        localize LSTRING(settingAllowSWU_displayName),
        localize LSTRING(settingAllowSWU_tooltip)
    ],
    localize LSTRING(settingCategory),
    true
] call CBA_Settings_fnc_init;

ADDON = true;
