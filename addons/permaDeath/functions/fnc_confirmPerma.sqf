#include "script_component.hpp"
private _confirmed = [
"Sterben und Zusehen?",
"Willst du wirklich sterben und in den Spectator bis zur Nachbesprechung?",
"Bestätigen",
"Abbrechen"
] call BIS_fnc_guiMessage;

if (_confirmed) then {
    closeDialog 0;
    player setDamage 1;
    switch ([(missionConfigFile >> "PermaDeath"), "deathMode", 0] call BIS_fnc_returnConfigEntry) do {
        case 0 : {
            [] call FUNC(setPlayerSpectator);
        };
        case 1 : {
            setPlayerRespawnTime 0;
        };
        case 2 : {
            private _respawnMax = [(missionConfigFile >> "PermaDeath"), "respawnMax", 5] call BIS_fnc_returnConfigEntry
            if ((player getVariable [QGVAR(respawnCount), 0] >= _respawnMax)) then {
                [] call FUNC(setPlayerSpectator);
            }else{
                setPlayerRespawnTime 0;
            };
        };
    };
};
