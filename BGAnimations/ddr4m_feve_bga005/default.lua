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
    properties = {
        "coloramafix"
    },
    coloranim = 1
}

local layer2 = {
    textures = {
        {
        }
    },
    alpha = 0.5,
    coloranim = 1
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}