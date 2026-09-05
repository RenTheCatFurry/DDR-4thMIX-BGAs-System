local layer1 = {
    textures = {
        {
            img = "dsad/g88_dsad hsv000 5x3 (stretch).png",
            size = {64,64},
            frames = {8}
        },
        {
            img = "dsad/d88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {12}
        },
        {
            img = "dsad/g88_dsad hsv001 5x3 (stretch).png",
            size = {64,64},
            frames = {9}
        },
        {
            img = "dsad/d88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {12}
        },
        {
            img = "dsad/g88_dsad hsv000 5x3 (stretch).png",
            size = {64,64},
            frames = {8}
        },
        {
            img = "dsad/d88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {12}
        },
        {
            img = "dsad/d88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {12}
        },
        {
            img = "dsad/g88_dsad hsv001 5x3 (stretch).png",
            size = {64,64},
            frames = {9}
        },
        {
            img = "dsad/d88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {12}
        },
        {
            img = "dsad/g88_dsad hsv000 5x3 (stretch).png",
            size = {64,64},
            frames = {8}
        },
        {
            img = "dsad/d88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {12}
        },
        {
            img = "dsad/g88_dsad hsv001 5x3 (stretch).png",
            size = {64,64},
            frames = {9}
        }
    },
    scroll = {8,4},
    fadelength = 4,
    fadeoffset = 2/3,
    alpha = 0.4
}

local layer2 = {
    textures = {
        {
            img = "dsad/g88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {9}
        }
    },
    effect = "particlesdown",
    effectlength = 4,
    spinlength = 3,
    blendmode = "Add",
    coloranim = 9
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}