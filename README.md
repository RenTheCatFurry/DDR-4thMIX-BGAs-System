THIS PAGE IS UNDER CONSTRUCTION

# Dance Dance Revolution 4thMIX BGAnimations System
This is a recreation of the songs BGAnimations engine from DDR 4thMIX for Stepmania 5 and related forks (like OutFox and ITGmania)

## Install:
Drag all the content of the Zip file to your BGAnimations folder.
Let's enjoy!

# BGAnimations structure
## default.lua file structure
``` lua
-- Layer variable (It can be any name you want.)
local layer_1 = {

  -- Textures
  textures = {

    -- Texture parameters
    {
      -- Image path
      -- It starts searching from "BGAnimations/_DDR_4thMIX_BGAs_System/"
      -- Delete this parameter to load the song background and activate background mode (See sections below).
      img = "naok/f88_naok 5x3 (stretch).png",

      -- Sprite size
      -- Delete this parameter to activate background mode.
      size = {64,64},

      -- RGB channel
      -- each value must be between 0 and 1.
      rgb = {1,0,0},

      -- Frames of the sprite sheet to use.
      frames = {5,6,7,8,9,10,11,12,13,14},

      -- Frames delay
      delay = 1/20,

      -- Frames properties (See sections below)
      properties = {
          "noframes"
          "framesseq",
          "framesanim",
          "framesbeat",
          "framesreverse",
          "colorama"
      }
    }
  },

  -- Type 1 effects (See sections below)
  setmesh = {4,3},
  scroll = {6,4},

  -- Type 2 effects (See sections below)
  effect = "bgmirror2",
  effectlength = 4,
  effectstep = 0.5,

  -- Blend mode to apply.
  blendmode = "Add",

  -- Alpha channel
  alpha = 0.5,

  -- RGB channel animation (See sections below).
  -- Must be an integer.
  coloranim = 2

  -- Blink effect
  -- This parameter regulates the blink opacity.
  -- It always blinks at a rate of 1/30 seconds.
  blinkalpha = 0,

  -- Fade effect
  -- "fadelength" regulates the fade duration.
  -- "fadealpha" regulates the fade opacity (Must be between 0 and 1).
  fadelength = 1,
  fadealpha = 0.5,

  -- Layer properties (See sections below)
  properties = {
    "scrollintercalate",
    "margin",
    "mirror",
    "effecthalf",
    "effectpingpong",
    "depthopacity",
    "fadelinear",
    "fadergb"
    "fadeout",
    "fadestop",
    "coloramafix"
  }
}

-- Load the layer variables
return Def.ActorFrame{
  LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer_1),
  LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer_2),
  LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer_3),
  LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer_N)
}
```

## default.lua file example
The "ddr4m_feve_bga004" BGAnimation
``` lua
local layer1 = {
  textures = {
    {
      img = "feve/e99_feve 4x3 (stretch).png",
      size = {80,80},
      frames = {11}
    }
  },
  alpha = 1/3,
  scroll = {2,8},
  coloranim = 1
}

local layer2 = {
  textures = {
    {
      img = "feve/e99_feve 4x3 (stretch).png",
      size = {80,80},
      frames = {4,5,6,7,8,9},
      properties = {
        "framesanim"
      }
    },
    {
      img = "feve/f99_feve 4x3 (stretch).png",
      size = {80,80},
      frames = {4,5,6,7,8,9,10,11},
      delay = 1/15
    }
  },
  effect = "particlesdownspin",
  effectlength = 16,
  alpha = 0.75,
  blendmode = "Add",
  coloranim = 2
}

return Def.ActorFrame{
  LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
  LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
```
