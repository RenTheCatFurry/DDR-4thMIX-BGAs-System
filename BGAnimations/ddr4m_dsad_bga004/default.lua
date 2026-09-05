local layer1 = {
    textures = {
        {
            img = "dsad/g88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {9}
        },
        {
            img = "dsad/e88_dsad hsv000 5x3 (stretch).png",
            size = {64,64},
            frames = {10}
        }
    },
    scroll = {2,4},
    coloranim = 2
}

local layer2 = {
    textures = {
        {
            img = "dsad/e88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {14},
            rgb = {1,1,0}
        }
    },
    effect = "explodein",
    effectlength = 6
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}