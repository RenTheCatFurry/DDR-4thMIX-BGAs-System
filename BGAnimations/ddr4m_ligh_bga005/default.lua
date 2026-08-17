local layer1 = {
    textures = {
        {
            img = "ligh/jba_light f00 c10 8x8.png"
        },
        {
            img = "ligh/jba_light f01 c10 8x8.png"
        },
        {
            img = "ligh/jba_light f02 c10 8x8.png"
        },
        {
            img = "ligh/jba_light f03 c10 8x8.png"
        }
    },
    effect = "kaleidoscope2",
    properties = {
        "coloramafix"
    }
}

local layer2 = {
    textures = {
        {
            img = "ligh/hb9_ligh 2x3 (stretch).png",
            size = {160,80},
            frames = {1}
        }
    },
    scroll = {8,4},
    blendmode = "Add",
    fadelength = 4,
    fadealpha = 0.5,
    fadeoffset = -0.25
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}