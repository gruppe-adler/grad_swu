#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(ADDON);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "ace_common" };
        authors[] = {"Salbei"};
        VERSION_CONFIG;
    };
};

#include <CfgSettings.hpp>
