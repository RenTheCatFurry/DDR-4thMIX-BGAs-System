local layer1 = {
    textures = {
        {
            img = "ligh/jba_light f00 c01 8x8.png",
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
            img = "ligh/d9c_ligh 4x1 (stretch).png",
            size = {80,240},
            frames = {0,1,2,3},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        }
    },
    effect = "wagy",
    effectlength = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}