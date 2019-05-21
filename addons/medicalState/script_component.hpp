#define COMPONENT functions
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
