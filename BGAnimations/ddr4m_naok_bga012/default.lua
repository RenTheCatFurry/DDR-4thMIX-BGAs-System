local layer1 = {
    textures = {
        {
            img = "naok/i99_naok f10 c03 8x4.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        },
        {
            img = "naok/a99_naok 4x3 (stretch).png",
            size = {80,80},
            frames = {0,1,2,3,4,5},
            delay = 1/15
        }
    },
    scroll = {6,3.2}
}

local layer2 = {
    textures = {
        {
            img = "naok/a99_naok 4x3 (stretch).png",
            size = {80,80},
            frames = {0,1,2,3,4,5},
            delay = 1/15
        }
    },
    scroll = {6,3.2},
    alpha = 0.5,
    fadelength = 1,
    properties = {
        "fadelinear",
        "fadeout"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}