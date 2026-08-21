local layer1 = {
    textures = {
        {
            img = "ligh/jba_ligh f01 c00 4x4.png",
            properties = {
                "colorama"
            }
        }
    },
    effect = "bgmirror2",
    coloranim = 2,
    alpha = 2/3
}

local layer2 = {
    textures = {
        {
            img = "ligh/f99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {10,11,10,10,11,10,11,11},
            delay = 0.5,
            properties = {
                "framesbeat"
            }
        }
    },
    properties = {
        "margin"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}