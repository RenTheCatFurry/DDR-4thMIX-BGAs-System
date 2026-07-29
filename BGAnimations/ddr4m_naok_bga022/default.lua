local layer1 = {
    textures = {
        {
            img = "naok/jba_naok f00 c07 4x2.png",
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
            img = "naok/jba_naok f00 c10 8x8.png",
            properties = {
                "colorama"
            }
        }
    },
    blendmode = "InvertDest",
    effect = "bgmirror2"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}