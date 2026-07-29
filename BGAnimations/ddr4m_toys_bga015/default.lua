local layer1 = {
    textures = {
        {
            img = "toys/h88_toys f04 c00 4x4.png",
            size = {64,64},
            properties = {
                "colorama"
            }
        }
    },
    coloranim = 2,
    alpha = 0.8
}

local layer2 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {4,3},
            delay = 0,
            properties = {
                "framesseq"
            }
        }
    },
    effect = "pulsein",
    effectlength = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}