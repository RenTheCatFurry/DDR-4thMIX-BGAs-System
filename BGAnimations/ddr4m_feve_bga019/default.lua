local layer1 = {
    textures = {
        {
            img = "feve/aba_feve f00 c01 8x8.png"
        },
        {
            img = "feve/aba_feve f01 c01 8x8.png"
        },
        {
            img = "feve/aba_feve f02 c01 8x8.png"
        },
        {
            img = "feve/aba_feve f03 c01 8x8.png"
        }
    },
    coloranim = 1,
    alpha = 0.5,
    properties = {
        "coloramafix"
    }
}

local layer2 = {
    textures = {
        {
            img = "feve/hd7_feve 1x4 (stretch).png",
            delay = 1/12.5,
            properties = {
                "framesreverse"
            }
        },
    },
    effect = "bgmirror1",
    blendmode = "Add",
    alpha = 0.5,
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}