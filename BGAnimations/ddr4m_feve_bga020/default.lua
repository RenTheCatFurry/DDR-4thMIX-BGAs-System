local layer1 = {
    textures = {
        {
            img = "feve/aba_feve f00 c11 8x8.png"
        },
        {
            img = "feve/aba_feve f01 c11 8x8.png"
        },
        {
            img = "feve/aba_feve f02 c11 8x8.png"
        },
        {
            img = "feve/aba_feve f03 c11 8x8.png"
        }
    },
    alpha = 0.75,
    properties = {
        "coloramafix"
    }
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
        }
    },
    effect = "particlesbouncein",
    effectlength = 4,
    blendmode = "Add",
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}