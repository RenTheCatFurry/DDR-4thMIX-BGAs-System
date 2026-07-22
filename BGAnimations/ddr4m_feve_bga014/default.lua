local layer1 = {
    textures = {
        {
            img = "feve/e99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {1,0,3,2},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
    },
    effect = "tilespin",
    effectlength = 4,
    coloranim = 2,
    alpha = 0.825
}

local layer2 = {
    textures = {
        {
            img = "feve/aba_feve f00 c05 8x4.png"
        },
        {
            img = "feve/aba_feve f00 c05 8x4.png"
        },
        {
            img = "feve/aba_feve f00 c05 8x4.png"
        },
        {
            img = "feve/aba_feve f00 c05 8x4.png"
        }
    },
    effect = "tilespin",
    effectlength = 4,
    blendmode = "Add",
    alpha = 0.67,
    coloranim = 1,
    properties = {
        "coloramafix"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}