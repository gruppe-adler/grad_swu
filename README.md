# grad_swu
<a href="https://travis-ci.org/AdlerSalbei/grad_swu">
        <img src="https://travis-ci.org/AdlerSalbei/grad_swu.svg?branch=master" alt="Build status">
    </a>
## Setup
To use this mod in your mission, you have to add the following lines to your description.ext .

```
class PermaDeath {
    usePermaDeath = 1;
    deathMode = 0;
    respawnMax = 5;
    cameraModes[] = {0,1,2};
    visionModes[] = {-2,-1};
    spectatableSides[] = {west,east,independent,civilian};
};
```

*usePermaDeath* -> Enables the function. (0 - off, 1 - on)
*deathMode* -> Defines the respawn mode, options are:
    - 0: go to spectator
    - 1: respawn
    - 2: respawn until the amunt of the option (respawnMax) is reached then go to spectator
*respawnMax* -> is only used when *deathMode* is set to 2, defines the maximum amount of respawns befor the player is send to spectator
*cameraModes* -> Defines which camera modes the spectator will use, possible are
- 0: Free
- 1: First person
- 2: Follow
*visionModes* -> Sets the available vision modes for the spectator
- -2: Normal
- -1: Night vision
-  0: White hot
-  1: Black hot
-  2: Light Green Hot / Darker Green cold
-  3: Black Hot / Darker Green cold
-  4: Light Red Hot / Darker Red Cold
-  5: Black Hot / Darker Red Cold
-  6: White Hot / Darker Red Cold
-  7: Thermal (Shade of Red and Green, Bodies are white)
*spectatableSides* -> the sides that can be spectated (west,east,independent,civilian)
