class RscText;
class RscButton;
class RscPicture;
class RscListBox;
class RscActivePicture;
class RscButtonMenu;
class RscControlsGroupNoScrollbars;

class GVAR(BodyImage): RscControlsGroupNoScrollbars {
    idc = IDC_BODY_GROUP;
    x = POS_X(13.33);
    y = POS_Y(2.73);
    w = POS_W(12.33);
    h = POS_H(12.33);
    class controls {
        class Background: RscPicture {
            idc = -1;
            text = QPATHTOF(data\background.paa);
            x = 0;
            y = 0;
            w = POS_W(12.33);
            h = POS_H(12.33);
        };
        class Head: Background {
            idc = IDC_BODY_HEAD;
            text = QPATHTOF(data\head.paa);
        };
        class Torso: Background {
            idc = IDC_BODY_TORSO;
            text = QPATHTOF(data\torso.paa);
        };
        class ArmLeft: Background {
            idc = IDC_BODY_ARMLEFT;
            text = QPATHTOF(data\arm_left.paa);
        };
        class ArmRight: Background {
            idc = IDC_BODY_ARMRIGHT;
            text = QPATHTOF(data\arm_right.paa);
        };
        class LegLeft: Background {
            idc = IDC_BODY_LEGLEFT;
            text = QPATHTOF(data\leg_left.paa);
        };
        class LegRight: Background {
            idc = IDC_BODY_LEGRIGHT;
            text = QPATHTOF(data\leg_right.paa);
        };
        class ArmLeftB: Background {
            idc = IDC_BODY_ARMLEFT_B;
            text = QPATHTOF(data\arm_left_b.paa);
            colorText[] = {0, 0, 0.8, 1};
            show = 0;
        };
        class ArmRightB: ArmLeftB {
            idc = IDC_BODY_ARMRIGHT_B;
            text = QPATHTOF(data\arm_right_b.paa);
        };
        class LegLeftB: ArmLeftB {
            idc = IDC_BODY_LEGLEFT_B;
            text = QPATHTOF(data\leg_left_b.paa);
        };
        class LegRightB: ArmLeftB {
            idc = IDC_BODY_LEGRIGHT_B;
            text = QPATHTOF(data\leg_right_b.paa);
        };
        class ArmLeftT: Background {
            idc = IDC_BODY_ARMLEFT_T;
            text = QPATHTOF(data\arm_left_t.paa);
            colorText[] = {0, 0, 0.8, 1};
            show = 0;
        };
        class ArmRightT: ArmLeftT {
            idc = IDC_BODY_ARMRIGHT_T;
            text = QPATHTOF(data\arm_right_t.paa);
        };
        class LegLeftT: ArmLeftT {
            idc = IDC_BODY_LEGLEFT_T;
            text = QPATHTOF(data\leg_left_t.paa);
        };
        class LegRightT: ArmLeftT {
            idc = IDC_BODY_LEGRIGHT_T;
            text = QPATHTOF(data\leg_right_t.paa);
        };
    };
};
