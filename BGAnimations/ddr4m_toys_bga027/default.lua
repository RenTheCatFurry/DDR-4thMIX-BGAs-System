local layer1 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            rgb = {0.5,0.5,1},
            frames = {2}
        }
    },
    scroll = {4,4}
}

local layer2 = {
    textures = {
        {
            img = "toys/h88_toys f05 c01 8x8.png",
            size = {64,64},
            properties = {
                "colorama"
            }
        }
    },
    effect = "particlesdownspin",
    effectlength = 6,
    spinlength = 4,
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
