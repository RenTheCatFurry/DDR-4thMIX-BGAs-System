local layer1 = {
    textures = {
        {
            img = "toys/fix001 4x1.png",
            size = {64,64},
            delay = 1,
            properties = {
                "framesbeat"
            }
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "toys/fix001 4x1.png",
            size = {64,64},
            frames = {1,2,3,0},
            delay = 1,
            properties = {
                "framesbeat"
            }
        }
    },
    effect = "snailin",
    effectlength = 1,
    properties = {
        "effecthalf"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
