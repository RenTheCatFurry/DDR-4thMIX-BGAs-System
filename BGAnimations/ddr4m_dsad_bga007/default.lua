local layer1 = {
    textures = {
        {
            img = "dsad/j99_dsad 4x3 (stretch).png",
            rgb = {0.5,1,1},
            properties = {
                "noframes"
            }
        },
        {
            img = "dsad/i99_dsad 4x3 (stretch).png",
            rgb = {0.5,1,1},
            properties = {
                "noframes"
            }
        }
    },
    scroll = {4,8}
}

local layer2 = {
    textures = {
        {
            img = "dsad/e88_dsad hsv001 5x3 (stretch).png",
            size = {64,64},
            frames = {14}
        }
    },
    effect = "spiral2in",
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}