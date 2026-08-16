local layer1 = {
    textures = {
        {
            img = "toys/ed7_toys 1x4 (stretch).png",
            rgb = {0,0.75,0},
            glow = {0,1,0,57/255},
            properties = {
                "noframes"
            }
        }
    },
    effect = "kaleidoscope2"
}

local layer2 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        },
        {
            img = "toys/h88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {7}
        },
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        },
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        },
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        },
        {
            img = "toys/h88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {7}
        },
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        },
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        },
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        },
        {
            img = "toys/h88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {7}
        },
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        },
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        }
    },
    scroll = {5,2},
    coloranim = 5
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}