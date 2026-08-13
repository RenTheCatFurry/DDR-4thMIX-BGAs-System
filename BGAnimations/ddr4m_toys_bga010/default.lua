local layer1 = {
    textures = {
        {
            img = "toys/h88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {5}
        }
    },
    effect = "particlesrightspin",
    effectlength = 4,
    spinlength = 4,
    blendmode = "Add",
    coloranim = 2
}

local layer2 = {
    textures = {
        {
            img = "toys/cdc_toys (stretch).png"
        },
        {
            img = "toys/bdc_toys (stretch).png"
        }
    },
    scroll = {8,4},
    blendmode = "InvertDest",
    properties = {
        "effectpingpong"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
