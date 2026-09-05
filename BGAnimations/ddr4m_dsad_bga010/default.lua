local layer1 = {
    textures = {
        {
            img = "dsad/g88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {0,1,2,3,4,5,6,7},
            delay = 1/15
        }
    },
    effect = "tilespin",
    effectlength = 4,
    coloranim = 1,
    alpha = 0.75
}

local blackbg = {
    textures = {{}},
    fadelength = 4,
    properties = {"blackbg"}
}

local layer2 = {
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
    scroll = {8,8},
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", blackbg),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}