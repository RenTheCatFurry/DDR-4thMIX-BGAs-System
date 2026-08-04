local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort3"
}

local layer2 = {
    textures = {
        {
            img = "toys/g88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14},
            delay = 1/30,
            properties = {
                "framesanim",
                "framesreverse"
            }
        }
    },
    scroll = {8,4},
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}