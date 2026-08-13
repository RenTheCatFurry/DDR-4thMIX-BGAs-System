local layer1 = {
    textures = {
        {
            img = "mero/a87_mero 5x4 (stretch).png",
            properties = {"noframes"}
        }
    },
    scroll = {4,8},
    alpha = 0.8
}

local layer2 = {
    textures = {
        {
            img = "mero/b97_mero 4x4 (stretch).png",
            size = {80,60},
            frames = {6,7},
            delay = 0.5,
            properties = {"framesbeat", "framesseq"}
        }
    },
    effect = "particlesleft",
    effectlength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
