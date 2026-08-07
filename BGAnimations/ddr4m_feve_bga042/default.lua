local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort2",
    effectlength = 2,
    effectstep = 1,
    alpha = 0.8
}

local blackbg = {
    textures = {
        {
        }
    },
    alpha = 1/3,
    fadelength = 4,
    fadeoffset = 0.25,
    properties = {
        "blackbg"
    }
}

local layer2 = {
    textures = {
        {
            img = "feve/hd7_feve 1x4 (stretch).png",
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        },
    },
    alpha = 0.8,
    effect = "bgmirror1",
    blendmode = "Add",
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", blackbg),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
