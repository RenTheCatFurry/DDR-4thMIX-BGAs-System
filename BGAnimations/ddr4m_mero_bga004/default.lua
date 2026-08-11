local layer1 = {
    textures = {
        {
            img = "mero/cba_mero f00 c07 4x2.png",
            size = {160,120},
            properties = {"colorama"}
        }
    },
    alpha = 0.8
}

local layer2 = {
    textures = {
        {
            img = "mero/b97_mero hsv000 4x4 (stretch).png",
            size = {80,60},
            frames = {5}
        }
    },
    effect = "particlesupspin",
    effectlength = 8,
    spinlength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}