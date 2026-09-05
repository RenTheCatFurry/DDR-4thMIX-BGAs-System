local layer1 = {
    textures = {
        {
            img = "dsad/j99_dsad hsv000 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        },
        {
            img = "dsad/i99_dsad hsv000 4x3 (stretch).png",
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
            img = "dsad/g88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {0,1,2,3,4,5,6,7},
            delay = 1/15
        }
    },
    scroll = {1,4},
    blendmode = "Add",
    alpha = 0.75,
    coloranim = 1,
    fadelength = 4,
    fadeoffset = 0.5
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}