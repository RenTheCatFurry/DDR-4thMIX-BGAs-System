local layer1 = {
    textures = {
        {
            img = "naok/h85_naok 5x6 (stretch).png",
            size = {64,40},
            rgb = {0,1,1},
            frames = {15}
        }
    },
    scroll = {1,1}
}

local layer2 = {
    textures = {
        {
            img = "naok/i99_naok f10 c04 8x8.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        },
        {
            img = "naok/i99_naok f11 c04 8x8.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    },
    scroll = {5,1},
    blendmode = "Add",
    properties = {
        "scrollintercalate"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}