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
    effect = "bgdistort1",
    properties = {
        "coloramafix"
    }
}

local layer2 = {
    textures = {
        {
            img = "ligh/hb9_ligh 2x3 (stretch).png",
            size = {160,80},
            frames = {2,3,4},
            delay = 0,
            properties = {
                "framesseq"
            }
        }
    },
    effect = "particlesleft",
    effectlength = 8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}