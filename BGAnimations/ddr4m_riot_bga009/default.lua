local layer1 = {
    textures = {
        {
            img = "riot/h97_riot hsv000 4x4 (stretch).png",
            size = {80,60},
            frames = {6,7},
            delay = 0.5,
            properties = {
                "framesbeat",
                "framesseq"
            }
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,12,13,13},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,12,13,14},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,13,14,15},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,12,13,14},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,13,14,15},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,12,13,14},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,13,14,15},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,12,13,14},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,12,13,14},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,12,13,14},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,12,13,14},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,12,13,13},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,12,13,14},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,13,14,15},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,12,13,14},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        },
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {12,13,14,15},
            delay = 0.25,
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