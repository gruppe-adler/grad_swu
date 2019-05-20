#include "script_component.hpp"
params ["_position"];

cutText ["", "BLACK FADED", 999];
cutText ["", "BLACK IN", 2];

ace_player setPos _position;
[{
    ["Default" ,["", "Respawn für Nachbesprechung"]] call bis_fnc_showNotification;
},[],2] call CBA_fnc_waitAndExecute;
