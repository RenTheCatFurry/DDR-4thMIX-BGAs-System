local layer1 = {
    textures = {
        {
            img = "naok/f88_naok 5x3 (stretch).png",
            size = {64,64},
            frames = {5,6,7,8,9,10,11,12,13,14},
            delay = 1/20,
            properties = {
                "framesanim"
            }
        }
    },
    scroll = {5,0.5},
    alpha = 0.75,
    fadelength = 4,
    properties = {
        "fadeout"
    }
}

local layer2 = {
    textures = {
        {
            img = "naok/f88_naok 5x3 (stretch).png",
            size = {64,64},
            frames = {5,6,7,8,9,10,11,12,13,14},
            delay = 1/20,
            properties = {
                "framesanim"
            }
        }
    },
    scroll = {1,0.5},
    blendmode = "Add",
    alpha = 0.75,
    coloranim = 1
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}