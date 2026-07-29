local layer1 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            rgb = {0.5,0.5,1},
            frames = {2}
        }
    },
    scroll = {1,4},
    alpha = 0.75
}

local layer2 = {
    textures = {
        {
            img = "toys/j87_toys 5x4 (stretch).png",
            size = {64,60},
            frames = {0,1,2,3}
        },
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {11,12,13,14}
        }
    },
    effect = "explodeinspin",
    effectlength = 8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}