local layer1 = {
    textures = {
        {
            img = "ligh/jba_ligh f00 c03 8x4.png",
            properties = {
                "colorama"
            }
        }
    },
    effect = "bgmirror2"
}

local layer2 = {
    textures = {
        {
            img = "ligh/f99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {10,11},
            delay = 0.5,
            properties = {
                "framesbeat"
            }
        }
    },
    effect = "pulse",
    effectlength = 16,
    fadelength = 4,
    fadeoffset = 0.5,
    properties = {
        "fadergb"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}