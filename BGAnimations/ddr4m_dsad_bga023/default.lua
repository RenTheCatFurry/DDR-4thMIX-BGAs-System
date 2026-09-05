local layer1 = {
    textures = {
        {
            img = "dsad/a97_dsad hsv000 4x4 (stretch).png",
            size = {80,60},
            frames = {8,9,10,11,12,13,14,15},
            delay = 1/30,
            properties = {
                "framesseq"
            }
        }
    },
    scroll = {4,4}
}

local layer2 = {
    textures = {
        {
            img = "dsad/e88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {8,9},
            delay = 1/15
        }
    },
    alpha = 0.5,
}

local layer3 = {
    textures = {
        {
            img = "dsad/a97_dsad nobg hsv000 4x4 (stretch).png",
            size = {80,60},
            frames = {8,9,10,11,12,13,14,15},
            delay = 1/30,
            properties = {
                "framesseq"
            }
        }
    },
    scroll = {4,4}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3)
}