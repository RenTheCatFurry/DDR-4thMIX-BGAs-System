local layer1 = {
    textures = {
        {
        }
    },
    alpha = 0.5
}

local layer2 = {
    textures = {
        {
            img = "toys/h88_toys f08 c01 8x8.png",
            size = {64,64},
            properties = {
                "colorama"
            }
        },
        {
            img = "toys/h88_toys f05 c10 8x8.png",
            size = {64,64},
            properties = {
                "colorama"
            }
        }
    },
    blendmode = "Add",
    effect = "particlesin",
    effectlength = 5,
    spinlength = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}