local layer1 = {
    textures = {
        {
            img = "toys/aba_toys f02 c02 8x10.png",
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
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {3,4},
            delay = 2,
            properties = {
                "framesbeat"
            }
        }
    },
    effect = "wagy",
    effectlength = 2,
    effectoffset = 0.5
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}