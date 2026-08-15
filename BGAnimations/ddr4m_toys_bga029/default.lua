local layer1 = {
    textures = {
        {
        }
    },
    scroll = {8,4}
}

local layer2 = {
    textures = {
        {
            img = "toys/fix000 3x1.png",
            size = {64,64},
            frames = {0,2},
            delay = 4,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "toys/fix000 3x1.png",
            size = {64,64},
            frames = {1,0},
            delay = 4,
            properties = {
                "framesbeat"
            }
        }
    },
    effect = "pulse",
    effectlength = 2,
    effectoffset = 0.5
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}