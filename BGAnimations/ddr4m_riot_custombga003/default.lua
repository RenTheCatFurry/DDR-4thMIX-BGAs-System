local layer1 = {
    textures = {
        {
            img = "riot/f9c_riot 4x1 (stretch).png",
            rgb = {1,0,0},
            properties = {
                "noframes"
            }
        },
                {
            img = "riot/e9c_riot 4x1 (stretch).png",
            rgb = {1,0,0},
            properties = {
                "noframes"
            }
        }
    },
    scroll = {8,2}
}

local layer2 = {
    textures = {
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {4,5},
            delay = 1/6,
            properties = {
                "framesbeat",
                "framesseq"
            }
        }
    },
    effect = "particlesright",
    effectlength = 8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}