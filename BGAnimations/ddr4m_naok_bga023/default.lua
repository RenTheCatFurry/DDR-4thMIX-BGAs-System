local layer1 = {
    textures = {
        {
            img = "naok/i99_naok f00 c08 4x4.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    },
    alpha = 0.5
}

local layer2 = {
    textures = {
        {
            img = "naok/h85_naok 5x6 (stretch).png",
            size = {64,40},
            frames = {21,22,23,24,25,26,27,28,29},
            delay = 1/15,
            properties = {
                "framesanim"
            }
        }
    },
    effect = "scrollxy",
    effectlength = 5,
    alpha = 0.5
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}