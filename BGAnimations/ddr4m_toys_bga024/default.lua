local layer1 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,60},
            frames = {1}
        }
    },
    scroll = {5,4},
    alpha = 0.75
}

local layer2 = {
    textures = {
        {
            img = "toys/j87_toys 5x4 (stretch).png",
            size = {64,60},
            frames = {4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19},
            delay = 1/8,
            properties = {
                "framesbeat",
                "framesseq",
                "framesreverse"
            }
        }
    },
    effect = "snailin",
    effectlength = 4,
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}