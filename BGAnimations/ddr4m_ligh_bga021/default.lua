local layer1 = {
    textures = {
        {
            img = "ligh/i99_ligh cut00 c00 4x4.png"
        },
        {
            img = "ligh/i99_ligh cut01 c00 4x4.png"
        },
        {
            img = "ligh/i99_ligh cut02 c00 4x4.png"
        },
        {
            img = "ligh/i99_ligh cut03 c00 4x4.png"
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
        "stretchxres",
        "mirror"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}