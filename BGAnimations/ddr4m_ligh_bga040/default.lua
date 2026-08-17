local layer1 = {
    textures = {
        {
            img = "ligh/hb9_ligh 2x3 (stretch).png",
            size = {160,80},
            frames = {4}
        },
        {
            img = "ligh/hb9_ligh 2x3 (stretch).png",
            size = {160,80},
            frames = {2}
        }
    },
    scroll = {8,4},
    fadelength = 1,
    properties = {
        "fadelinear",
        "fadeout"
    }
}

local layer2 = {
    textures = {
        {
            img = "ligh/jba_ligh f02 c05 8x4.png",
            size = {160,120},
            properties = {
                "colorama"
            }
        }
    },
    coloranim = 5,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}