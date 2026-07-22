local layer1 = {
    textures = {
        {
            img = "naok/h85_naok 5x6 (stretch).png",
            size = {64,40},
            frames = {16,17,18,19},
            properties = {
                "framesanim"
            }
        }
    },
    scroll = {2,4},
    alpha = 0.75
}

local layer2 = {
    textures = {
        {
            img = "naok/cd1_naok 1x12 (stretch).png",
            size = {320,20},
            delay = 1/25,
            properties = {
                "framesanim"
            }
        }
    },
    blendmode = "add",
    effect = "dvdbounce",
    effectlength = 6
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}