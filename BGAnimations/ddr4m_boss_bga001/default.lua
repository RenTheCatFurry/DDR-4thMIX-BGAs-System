local layer1 = {
    textures = {
        {
            img = "boss/i97_boss 4x4 (stretch).png",
            size = {80,60},
            delay = 1/20,
            properties = {
                "framesanim"
            }
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "boss/g55_boss 8x6 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    blendmode = "InvertDest"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}