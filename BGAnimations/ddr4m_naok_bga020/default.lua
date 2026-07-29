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
    alpha = 0.5
}

local layer2 = {
    textures = {
        {
            img = "naok/e9a_naok 4x2 (stretch).png",
            size = {80,120},
            properties = {
                "framesanim"
            }
        }
    },
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}