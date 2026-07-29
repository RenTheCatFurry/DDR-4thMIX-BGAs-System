local layer1 = {
    textures = {
        {
            img = "toys/h88_toys f06 c01 8x8.png",
            size = {64,64},
            properties = {
                "colorama"
            }
        }
    },
    scroll = {8,2},
    coloranim = 1,
    alpha = 2/3
}

local layer2 = {
    textures = {
        {
            img = "toys/aba_toys f01 c05 8x4.png",
            properties = {
                "colorama"
            }
        }
    },
    effect = "bgmirror2",
    blendmode = "Add",
    alpha = 0.75
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}