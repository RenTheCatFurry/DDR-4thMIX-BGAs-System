local layer1 = {
    textures = {
        {
            img = "dsad/a97_dsad hsv000 4x4 (stretch).png",
            size = {80,60},
            frames = {8,9,10,11,12,13,14,15},
            delay = 1/20
        }
    },
    coloranim = 8,
    scroll = {4,4}
}

local layer2 = {
    textures = {
        {
            img = "dsad/h88_dsad 5x3 (stretch).png",
            size = {64,64},
            rgb = {1,0,0},
            frames = {0}
        }
    },
    effect = "tilespin",
    effectlength = 4,
    blendmode = "Add",
    alpha = 0.75,
    coloranim = 2
}

local layer3 = {
    textures = {
        {
            img = "dsad/a97_dsad nobg hsv000 4x4 (stretch).png",
            size = {80,60},
            frames = {8,9,10,11,12,13,14,15},
            delay = 1/20
        }
    },
    coloranim = 8,
    scroll = {4,4}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3)
}