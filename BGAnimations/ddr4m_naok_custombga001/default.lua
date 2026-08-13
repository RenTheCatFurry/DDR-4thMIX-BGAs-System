local layer1 = {
    textures = {
        {
            img = "naok/cd1_naok 1x12 (stretch).png",
            size = {320,20},
            frames = {0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11},
            delay = 0,
            properties = {
                "framesseq"
            }
        }
    },
    scroll = {6,1/12},
    effectstep = 1/12
}

local layer2 = {
    textures = {
        {
            img = "naok/i99_naok 4x3 (stretch).png",
            size = {80,80},
            frames = {4,5,6,7},
            properties = {
                "framesanim"
            }
        }
    },
    effect = "particlesleft",
    effectlength = 4,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
