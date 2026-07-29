local layer1 = {
    textures = {
        {
            img = "toys/h88_toys 5x3 (stretch).png",
            size = {64,64},
            rgb = {0,0,1},
            frames = {10}
        }
    },
    effect = "tilespin",
    effectlength = 4,
    alpha = 0.75
}

local layer2 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        },
        {
            img = "toys/g88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14},
            delay = 1/25,
            properties = {
                "framesanim"
            }
        }
    },
    effect = "explodeinspin",
    effectlength = 6,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}