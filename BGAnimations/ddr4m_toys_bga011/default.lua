local layer1 = {
    textures = {
        {
            img = "toys/cdc_toys (stretch).png"
        },
        {
            img = "toys/bdc_toys (stretch).png"
        }
    },
    scroll = {8,4},
    properties = {
        "effectpingpong"
    }
}

local layer2 = {
    textures = {
        {
            img = "toys/j87_toys 5x4 (stretch).png",
            size = {64,60},
            frames = {4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19},
            delay = 1/30
        }
    },
    effect = "particlesright",
    effectlength = 4,
    properties = {
        "depthopacity"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}