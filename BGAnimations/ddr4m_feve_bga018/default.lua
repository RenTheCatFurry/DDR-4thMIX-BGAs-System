local layer1 = {
    textures = {
        {
            img = "feve/g99_feve 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    alpha = 2/3,
    fadelength = 4,
    fadeoffset = -0.25,
    properties = {
        "fadeout"
    }
}

local layer2 = {
    textures = {
        {
            img = "feve/aba_feve f00 c04 8x8.png"
        },
        {
            img = "feve/aba_feve f01 c04 8x8.png"
        },
        {
            img = "feve/aba_feve f02 c04 8x8.png"
        },
        {
            img = "feve/aba_feve f03 c04 8x8.png"
        }
    },
    blendmode = "Add",
    coloranim = 1,
    properties = {
        "coloramafix"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
