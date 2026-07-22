local layer1 = {
    textures = {
        {
            img = "naok/h85_naok 5x6 (stretch).png",
            size = {64,40},
            frames = {0,1,2,3,4,5,6,7,8,9},
            properties = {
                "framesanim"
            }
        }
    },
    alpha = 0.75
}

local layer2 = {
    textures = {
        {
            img = "naok/i99_naok f02 c08 4x4.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    },
    alpha = 0.5
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}