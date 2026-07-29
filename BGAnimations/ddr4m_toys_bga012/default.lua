local layer1 = {
    textures = {
        {
            img = "toys/h88_toys 5x3 (stretch).png",
            size = {64,64},
            rgb = {1,0,0},
            glow = {1,0,0,57/255},
            frames = {5}
        }
    },
    alpha = 0.8,
    effect = "tilespin",
    effectlength = 4,
    coloranim = 10
}

local layer2 = {
    textures = {
        {
            img = "toys/ed7_toys 1x4 (stretch).png",
            size = {320,60},
            delay = 1/7.5,
            properties = {
                "framesanim"
            }
        }
    },
    blendmode = "Add",
    alpha = 2/3,
    coloranim = 2,
    properties = {
        "margin"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}