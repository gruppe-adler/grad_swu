#include "script_component.hpp"

private _deathmode = [(missionConfigFile >> "PermaDeath"), "deathMode", 0] call BIS_fnc_returnConfigEntry;
private _respawnMax = [(missionConfigFile >> "PermaDeath"), "respawnMax", 5] call BIS_fnc_returnConfigEntry;

private _dieMessageContent = localize LSTRING(dieMessageContent) + " " + (switch (_deathmode) do {
    case 0 : {localize LSTRING(dieMessageContentSpectate)};
    case 1 : {localize LSTRING(dieMessageContentRespawn)};
    case 2 : {
        private _return = if ((player getVariable [QGVAR(respawnCount), 0]) >= _respawnMax) then {
            localize LSTRING(dieMessageContentSpectate)
        }else{
            localize LSTRING(dieMessageContentRespawn)
        };
        _return
    };
});

private _confirmed = [
    _dieMessageContent,
    localize LSTRING(dieMessageTitle),
    localize LSTRING(dieMessageConfirm),
    localize LSTRING(dieMessageCancel)
] call BIS_fnc_guiMessage;

if (_confirmed) then {
    closeDialog 0;
    player setDamage 1;
    switch (_deathmode) do {
        case 0 : {
            [] call FUNC(setPlayerSpectator);
        };
        case 1 : {
            setPlayerRespawnTime 0;
        };
        case 2 : {
            if ((player getVariable [QGVAR(respawnCount), 0]) >= _respawnMax) then {
                [] call FUNC(setPlayerSpectator);
            }else{
                setPlayerRespawnTime 0;
            };
        };
    };
};
