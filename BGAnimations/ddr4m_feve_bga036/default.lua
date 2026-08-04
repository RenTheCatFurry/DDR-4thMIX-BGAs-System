local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort1",
    effectlength = 2,
    effectstep = 1,
    alpha = 0.85
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
            img = "feve/e99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {3}
        }
    },
    blendmode = "Add",
    coloranim = 2,
    effect = "spiral1out"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", blackbg),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}