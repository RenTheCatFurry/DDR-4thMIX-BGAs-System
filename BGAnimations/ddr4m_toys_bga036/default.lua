local layer1 = {
    textures = {
        {
            img = "toys/aba_toys f02 c00 4x4.png",
            size = {160,120},
            properties = {
                "colorama"
            }
        }
    },
    scroll = {1,4},
    fadelength = 4,
    fadealpha = 0.5,
    fadeoffset = 0.75,
    properties = {
        "stretchxres"
    }
}

local layer2 = {
    textures = {
        {
            img = "toys/fba_toys 2x2 (stretch).png",
            rgb = {1,1,0.5},
            properties = {
                "noframes"
            }
        }
    },
    effect = "bgdistort3",
    fadelength = 4,
    fadealpha = 0.5,
    fadeoffset = 0.25,
    properties = {
        "fadergb"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
