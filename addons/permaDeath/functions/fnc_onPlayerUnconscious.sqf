#include "script_component.hpp"
// ripped and modified commy2 code

params ["_unit", "_state"];

if _state then {
    "STHud_Draw" call STUI_Canvas_Remove; // remove sthud

    private _controlPosition =
    [
        safeZoneX + (safeZoneW/2) - 0.1,
        safeZoneY + safeZoneH - 0.21,
        0.2 * 3 / 4,
        0.2
    ];

    // workaround for mouseEnter events not firing on picture
    private _mouseOverArea = (uiNamespace getVariable ["ace_common_dlgDisableMouse", displayNull]) ctrlCreate ["RscStructuredText",-1];
    _mouseOverArea ctrlSetPosition _controlPosition;
    _mouseOverArea ctrlSetText "";
    _mouseOverArea ctrlSetBackgroundColor [0,0,0,0.01];
    _mouseOverArea ctrlCommit 0;

    _mouseOverArea ctrlAddEventHandler ["ButtonClick", QUOTE([] spawn FUNC(confirmPerma);)];

    _mouseOverArea ctrlAddEventHandler ["MouseEnter",{
        private _icon = uiNamespace getVariable [QGVAR(icon), controlNull];
        if (!isNull _icon) then { _icon ctrlSetText QPATHTOF(data\dieAndSpectate_act.paa); false };
    }];
    _mouseOverArea ctrlAddEventHandler ["MouseExit",{
        private _icon = uiNamespace getVariable [QGVAR(icon), controlNull];
        if (!isNull _icon) then { _icon ctrlSetText QPATHTOF(data\dieAndSpectate_def.paa); false };
    }];

    private _icon = (uiNamespace getVariable ["ace_common_dlgDisableMouse", displayNull]) ctrlCreate ["RscPicture",-1];
    uiNamespace setVariable [QGVAR(icon), _icon];
    _icon ctrlSetPosition _controlPosition;
    _icon ctrlSetText QPATHTOF(data\dieAndSpectate_def.paa);
    _icon ctrlSetBackgroundColor [0,0,0,0.01];
    _icon ctrlCommit 0;

} else {
    "STHud_Draw" call STUI_Canvas_Add;
};
