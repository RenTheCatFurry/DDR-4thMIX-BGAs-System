local layer1 = {
    textures = {
        {
            img = "riot/bb9_riot 2x3 (stretch).png",
            rgb = {1,0,0},
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
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {3,2},
            delay = 0.5,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {2,3},
            delay = 0.5,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {3,2},
            delay = 0.5,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {2,3},
            delay = 0.5,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {2,3},
            delay = 0.5,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {3,2},
            delay = 0.5,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {2,3},
            delay = 0.5,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {3,2},
            delay = 0.5,
            properties = {
                "framesbeat"
            }
        }
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}