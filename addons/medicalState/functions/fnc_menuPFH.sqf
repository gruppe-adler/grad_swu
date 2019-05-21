#include "script_component.hpp"
/*
 * Author: mharis001, Salbei
 * Handles updating the Medical Menu UI for the current target.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_gui_fnc_menuPFH
 *
 * Public: No
 */

 // Check if menu should stay open for player

 // Get the Medical Menu display
private _display = uiNamespace getVariable [QGVAR(menuDisplay), displayNull];
if (isNull _display) exitWith {};

 // Update injury list
 private _ctrlInjuries = _display displayCtrl IDC_INJURIES;
 [_ctrlInjuries, player, GVAR(selectedBodyPart)] call FUNC(updateInjuryList);

 // Update body image
 private _ctrlBodyImage = _display displayCtrl IDC_BODY_GROUP;
 [_ctrlBodyImage, player] call FUNC(updateBodyImage);

 // Update activity and quick view logs
 private _ctrlActivityLog = _display displayCtrl IDC_ACTIVITY;
 private _activityLog = player getVariable [QEGVAR(medical,logFile_activity_view), []];
 [_ctrlActivityLog, _activityLog] call FUNC(updateLogList);

 private _ctrlQuickView = _display displayCtrl IDC_QUICKVIEW;
 private _quickView = player getVariable [QEGVAR(medical,logFile_quick_view), []];
 [_ctrlQuickView, _quickView] call FUNC(updateLogList);

 // Update triage status
 [_display, player] call FUNC(updateTriageStatus);
