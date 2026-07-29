local layer1 = {
    textures = {
        {
            img = "toys/h88_toys f01 c04 8x8.png",
            size = {64,64},
            properties = {
                "colorama"
            }
        }
    },
    alpha = 2/3,
    coloranim = 2
}

local layer2 = {
    textures = {
        {
            img = "toys/j87_toys blackbg 5x4 (stretch).png",
            size = {64,60},
            delay = 1/25,
            frames = {4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19},
            properties = {
                "framesreverse"
            }
        }
    },
    blendmode = "InvertDest",
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}