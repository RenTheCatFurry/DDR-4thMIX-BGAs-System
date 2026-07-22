local layer1 = {
    textures = {
        {
            img = "feve/f99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {4,5,6,7,8,9,10,11},
            delay = 1/20,
            properties = {
                "framesreverse"
            }
        },
    },
    alpha = 0.5,
    coloranim = 0
}

local layer2 = {
    textures = {
        {
            img = "feve/f99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {0,1,2,3},
            properties = {
                "framesanim",
                "framesreverse"
            }
        },
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