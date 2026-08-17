local layer1 = {
    textures = {
        {
            img = "ligh/i99_ligh cut00 c01 8x8.png"
        },
        {
            img = "ligh/i99_ligh cut01 c01 8x8.png"
        },
        {
            img = "ligh/i99_ligh cut02 c01 8x8.png"
        },
        {
            img = "ligh/i99_ligh cut03 c01 8x8.png"
        }
    },
    properties = {
        "coloramafix"
    }
}

local layer2 = {
    textures = {
        {
            img = "ligh/gb9_ligh 2x3 (stretch).png",
            size = {160,80},
            frames = {2}
        }
    },
    properties = {
        "stretchxres"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}