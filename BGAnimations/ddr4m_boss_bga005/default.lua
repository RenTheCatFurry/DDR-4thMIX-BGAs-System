local layer1 = {
    textures = {
        {
            img = "boss/a86_boss 5x5 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    alpha = 0.75
}

local layer2 = {
    textures = {
        {
            img = "boss/b88_boss 5x3 (stretch).png",
            size = {64,64},
            frames = {3}
        }
    },
    effect = "particlesup",
    effectlength = 3,
    blendmode = "Add",
    coloranim = 8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
