local layer1 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {5}
        }
    },
    scroll = {1,3},
    alpha = 0.75,
    fadelength = 0.75,
    fadealpha = 1/3,
    fadeoffset = -0.25
}

local layer2 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {10}
        },
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {11,12,13,14}
        }
    },
    alpha = 0.75,
    coloranim = 2,
    blendmode = "Add",
    effect = "dvdbounce",
    effectlength = 10
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
