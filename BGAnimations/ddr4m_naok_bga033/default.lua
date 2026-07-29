local layer1 = {
    textures = {
        {
            img = "naok/i99_naok f01 c11 8x8.png",
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
        }
    },
    bgcrop = {1,4},
    effect = "wagxout",
    effectlength = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}