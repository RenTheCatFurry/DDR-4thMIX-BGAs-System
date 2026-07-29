local layer1 = {
    textures = {
        {
            img = "toys/h88_toys 5x3 (stretch).png",
            size = {64,64},
            rgb = {0,0,1},
            frames = {5}
        }
    },
    alpha = 0.8,
    effect = "tilespin",
    effectlength = 4,
    coloranim = 10
}

local layer2 = {
    textures = {
        {
            img = "toys/h88_toys f04 c01 8x8.png",
            size = {64,64},
            properties = {
                "colorama"
            }
        }
    },
    blendmode = "Add",
    effect = "spiral2in",
    alpha = 0.6
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}