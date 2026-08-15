local layer1 = {
    textures = {
        {
            img = "naok/i99_naok f03 c11 8x8.png",
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
            img = "naok/a99_naok 4x3 (stretch).png",
            size = {80,80},
            frames = {0,1,2,3,4,5},
            delay = 1/15
        }
    },
    effect = "wagy",
    effectlength = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}