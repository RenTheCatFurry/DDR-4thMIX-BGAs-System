local layer1 = {
    textures = {
        {
            img = "toys/ddc_toys (stretch).png"
        }
    },
    effect = "bgdistort4",
    coloranim = 1
}

local layer2 = {
    textures = {
        {
            img = "toys/g88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        },
        {
            img = "toys/g88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14},
            delay = 1/30,
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