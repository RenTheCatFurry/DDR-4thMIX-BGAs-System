local layer1 = {
    textures = {
        {
            img = "toys/aba_toys f02 c02 8x10.png",
            properties = {
                "colorama"
            }
        }
    },
    effect = "bgmirror2",
    alpha = 0.9
}

local layer2 = {
    textures = {
        {
            img = "toys/g88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14},
            delay = 1/25,
            properties = {
                "framesanim"
            }
        }
    },
    scroll = {2,4},
    blendmode = "Add",
    alpha = 0.8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
