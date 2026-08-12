local layer1 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            rgb = {0.5,0.5,1},
            frames = {1}
        }
    },
    scroll = {4,2}
}

local layer2 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {10}
        }
    },
    scroll = {8,1},
    blendmode = "Add",
    fadelength = 8,
    properties = {
        "fadelinear",
        "fadeout"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
