local layer1 = {
    textures = {
        {
        }
    },
    alpha = 0.75,
    properties = {
        "invert"
    }
}

local layer2 = {
    textures = {
        {
            img = "feve/e99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {4,5,6,7,8,9},
            delay = 1/10,
            properties = {
                "framesanim"
            }
        }
    },
    effect = "explodeinspin",
    effectlength = 8,
    blendmode = "Add",
    coloranim = 2,
    fadelength = 4,
    properties = {
        "fadeout"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
