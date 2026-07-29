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
    blendmode = "Add",
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}