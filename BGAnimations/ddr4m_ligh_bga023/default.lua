local layer1 = {
    textures = {
        {
            img = "ligh/i99_ligh cut00 c10 8x8.png"
        },
        {
            img = "ligh/i99_ligh cut01 c10 8x8.png"
        },
        {
            img = "ligh/i99_ligh cut02 c10 8x8.png"
        },
        {
            img = "ligh/i99_ligh cut03 c10 8x8.png"
        }
    },
    properties = {
        "coloramafix"
    }
}

local layer2 = {
    textures = {
        {
            img = "ligh/i99_ligh cut00 c09 8x4.png"
        },
        {
            img = "ligh/i99_ligh cut01 c09 8x4.png"
        },
        {
            img = "ligh/i99_ligh cut02 c09 8x4.png"
        },
        {
            img = "ligh/i99_ligh cut03 c09 8x4.png"
        }
    },
    alpha = 0.25,
    blendmode = "Add",
    properties = {
        "coloramafix"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}