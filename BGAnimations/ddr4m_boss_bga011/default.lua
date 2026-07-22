local layer1 = {
    textures = {
        {
            img = "boss/fd9_boss 1x3 (stretch).png",
            properties = {
                "noframes"
            }
        },
        {
            img = "boss/ed9_boss 1x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    scroll = {2,4},
    alpha = 0.75
}

local layer2 = {
    textures = {
        {
            img = "boss/hd3_boss 1x8 (stretch).png",
            size = {320,30},
            delay = 1/15,
            properties = {
                "framesanim"
            }
        }
    },
    scroll = {8,4},
    coloranim = 2,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}