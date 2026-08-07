local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort7"
}

local layer2 = {
    textures = {
        {
            img = "toys/h88_toys f05 c01 8x8.png",
            size = {64,64},
            properties = {
                "colorama"
            }
        },
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {3}
        }
    },
    effect = "explodeinspin",
    effectlength = 8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}