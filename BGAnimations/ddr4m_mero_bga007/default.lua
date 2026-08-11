local layer1 = {
    textures = {
        {
            img = "mero/b97_mero 4x4 (stretch).png",
            size = {80,60},
            frames = {15}
        }
    },
    alpha = 0.8,
    fadelength = 4,
    fadeoffset = -0.25,
    fadealpha = 0.5
}

local layer2 = {
    textures = {
        {
            img = "mero/b97_mero 4x4 (stretch).png",
            size = {80,60},
            frames = {0,1},
            delay = 0.5,
            properties = {"framesbeat"}
        }
    },
    scroll = {5,4}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}