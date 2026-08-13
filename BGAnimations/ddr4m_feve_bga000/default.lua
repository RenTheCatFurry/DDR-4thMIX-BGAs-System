local layer1 = {
    textures = {
        {
            img = "feve/b99_fever f11 c09 8x4.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        },
    },
    effect = "tilespin",
    effectlength = 4,
    alpha = 0.8,
    coloranim = 1
}

local layer2 = {
    textures = {
        {
            img = "feve/b99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {0,1},
            delay = 0,
            properties = {
                "framesseq"
            }
        },
    },
    effect = "particlesdownspin",
    effectlength = 6,
    spinlength = 4,
    blendmode = "Add",
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
