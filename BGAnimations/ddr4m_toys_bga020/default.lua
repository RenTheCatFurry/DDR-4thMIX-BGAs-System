local layer1 = {
    textures = {
        {
            img = "toys/h88_toys 5x3 (stretch).png",
            size = {64,64},
            rgb = {1,0,0},
            glow = {1,0,0,57/255},
            frames = {6}
        }
    },
    effect = "tilespin",
    effectlength = 4
}

local layer2 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        },
        {
            img = "toys/h88_toys f05 c10 8x8.png",
            size = {64,64},
            properties = {
                "colorama"
            }
        }
    },
    effect = "dvdbounce",
    effectlength = 5
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}