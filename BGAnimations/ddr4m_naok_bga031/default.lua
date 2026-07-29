local layer1 = {
    textures = {
        {
            img = "naok/jba_naok f02 c03 8x4.png",
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
            img = "naok/f88_naok 5x3 (stretch).png",
            size = {64,64},
            rgb = {1,0,0},
            frames = {5,6,7,8,9,10,11,12,13,14},
            delay = 1/15,
            properties = {
                "framesanim"
            }
        }
    },
    blendmode = "Add",
    effect = "explodein",
    effectlength = 2,
    properties = {
        "effecthalf"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}