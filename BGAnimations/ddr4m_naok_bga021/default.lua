local layer1 = {
    textures = {
        {
            img = "naok/i99_naok 4x3 (stretch).png",
            size = {80,80},
            rgb = {1,0.4,0.4},
            frames = {3,4,5,6,7},
            delay = 1/5,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "naok/i99_naok 4x3 (stretch).png",
            size = {80,80},
            rgb = {0.4,0.4,1},
            frames = {5,6,7,3,4},
            delay = 1/5,
            properties = {
                "framesbeat"
            }
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "naok/i99_naok f03 c05 8x4.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    },
    blendmode = "Add",
    alpha = 1/3,
    blinkalpha = 0,
    fadelength = 1,
    properties = {
        "fadeout"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}