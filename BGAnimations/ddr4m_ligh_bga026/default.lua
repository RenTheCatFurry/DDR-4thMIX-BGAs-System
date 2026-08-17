local layer1 = {
    textures = {
        {
            img = "ligh/e99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {6,7},
            delay = 0.5,
            properties = {
                "framesbeat"
            }
        }
    },
    effect = "tilespin",
    effectlength = 4,
    coloranim = 8
}

local layer2 = {
    textures = {
        {
            img = "ligh/jba_ligh f01 c08 4x4.png",
            properties = {
                "colorama"
            }
        }
    },
    effect = "bgmirror2",
    blendmode = "InvertDest"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}