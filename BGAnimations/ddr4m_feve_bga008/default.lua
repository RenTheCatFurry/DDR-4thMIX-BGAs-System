local layer1 = {
    textures = {
        {
            img = "feve/aba_feve f00 c06 8x16.png"
        },
        {
            img = "feve/aba_feve f01 c06 8x16.png"
        },
        {
            img = "feve/aba_feve f02 c06 8x16.png"
        },
        {
            img = "feve/aba_feve f03 c06 8x16.png"
        },
    },
    alpha = 0.5,
    properties = {
        "coloramafix"
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
    effect = "particlesin",
    effectlength = 4,
    blendmode = "Add",
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}