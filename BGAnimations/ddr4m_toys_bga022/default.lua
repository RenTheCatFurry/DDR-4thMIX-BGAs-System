local layer1 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            rgb = {0.5,0.5,1},
            frames = {2}
        }
    },
    scroll = {8,2}
}

local layer2 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {11,12,13,14},
            properties = {
                "framesseq"
            }
        }
    },
    scroll = {4,1},
    blendmode = "Add",
    fadelength = 4,
    properties = {
        "fadelinear",
        "fadeout",
        "fadestop"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}