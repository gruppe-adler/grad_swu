#define COMPONENT medicalState
#include "\x\grad_swu\addons\main\script_mod.hpp"
#include "\x\grad_swu\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineResincl.inc"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
#include "\a3\ui_f\hpp\defineCommonGrids.inc"
#include "\a3\ui_f\hpp\defineCommonColors.inc"

#define POS_X(N) ((N) * GUI_GRID_W + GUI_GRID_CENTER_X)
#define POS_Y(N) ((N) * GUI_GRID_H + GUI_GRID_CENTER_Y)
#define POS_W(N) ((N) * GUI_GRID_W)
#define POS_H(N) ((N) * GUI_GRID_H)

#define IDC_BODY_GROUP        6000
#define IDC_BODY_HEAD         6005
#define IDC_BODY_TORSO        6010
#define IDC_BODY_ARMLEFT      6015
#define IDC_BODY_ARMRIGHT     6020
#define IDC_BODY_LEGLEFT      6025
#define IDC_BODY_LEGRIGHT     6030
#define IDC_BODY_ARMLEFT_T    6035
#define IDC_BODY_ARMRIGHT_T   6040
#define IDC_BODY_LEGLEFT_T    6045
#define IDC_BODY_LEGRIGHT_T   6050
#define IDC_BODY_ARMLEFT_B    6055
#define IDC_BODY_ARMRIGHT_B   6060
#define IDC_BODY_LEGRIGHT_B   6065
#define IDC_BODY_LEGLEFT_B    6070

#define VAR_BLOOD_PRESS "ace_medical_bloodPressure"
#define VAR_BLOOD_VOL   "ace_medical_bloodVolume"
#define VAR_WOUND_BLEEDING "ace_medical_woundBleeding"
#define VAR_CRDC_ARRST  "ace_medical_inCardiacArrest"
#define VAR_HEART_RATE  "ace_medical_heartRate"
#define VAR_PAIN        "ace_medical_pain"
#define VAR_PAIN_SUPP   "ace_medical_painSuppress"
#define VAR_PERIPH_RES  "ace_medical_peripheralResistance"
#define VAR_UNCON       "ACE_isUnconscious"
// These variables track gradual adjustments (from medication, etc.)
#define VAR_MEDICATIONS     "ace_medical_medications"
// These variables track the current state of status values above
#define VAR_HEMORRHAGE      "ace_medical_hemorrhage"
#define VAR_IN_PAIN         "ace_medical_inPain"
#define VAR_TOURNIQUET "ace_medical_tourniquets"

#define GET_BLOOD_VOLUME(unit)      (unit getVariable [VAR_BLOOD_VOL,DEFAULT_BLOOD_VOLUME])
#define GET_WOUND_BLEEDING(unit)    (unit getVariable [VAR_WOUND_BLEEDING,0])
#define GET_HEART_RATE(unit)        (unit getVariable [VAR_HEART_RATE,DEFAULT_HEART_RATE])
#define GET_HEMORRHAGE(unit)        (unit getVariable [VAR_HEMORRHAGE,0])
#define GET_PAIN(unit)              (unit getVariable [VAR_PAIN,0])
#define GET_PAIN_SUPPRESS(unit)     (unit getVariable [VAR_PAIN_SUPP,0])
#define GET_TOURNIQUETS(unit)       (unit getVariable [VAR_TOURNIQUET, DEFAULT_TOURNIQUET_VALUES])
#define IN_CRDC_ARRST(unit)         (unit getVariable [VAR_CRDC_ARRST,false])
#define IS_BLEEDING(unit)           (GET_WOUND_BLEEDING(unit) > 0)
#define IS_IN_PAIN(unit)            (unit getVariable [VAR_IN_PAIN,false])
#define IS_UNCONSCIOUS(unit) (unit getVariable [VAR_UNCON,false])

#define GET_PAIN_PERCEIVED(unit) (0 max (GET_PAIN(unit) - GET_PAIN_SUPPRESS(unit)) min 1)
#define HAS_TOURNIQUET_APPLIED_ON(unit,index) ((GET_TOURNIQUETS(unit) select index) > 0)
