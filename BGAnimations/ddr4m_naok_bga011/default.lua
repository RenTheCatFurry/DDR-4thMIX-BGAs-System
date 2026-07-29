local layer1 = {
    textures = {
        {
            img = "naok/fix000 4x2.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "naok/i99_naok f02 c11 8x8.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    },
    blendmode = "InvertDest"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}