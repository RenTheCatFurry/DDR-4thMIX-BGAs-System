local layer1 = {
    textures = {
        {
            img = "mero/b97_mero 4x4 (stretch).png",
            size = {80,60},
            frames = {12,13,12,13,13,12,13,12},
            delay = 0,
            properties = {"framesseq"}
        }
    },
    alpha = 0.8
}

local layer2 = {
    textures = {
        {
            img = "mero/b97_mero 4x4 (stretch).png",
            size = {80,60},
            frames = {8}
        }
    },
    effect = "particlesdownspin",
    effectlength = 3,
    spinlength = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
