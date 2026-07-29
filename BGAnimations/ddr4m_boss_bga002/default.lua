local layer1 = {
    textures = {
        {
            img = "boss/i97_boss 4x4 (stretch).png",
            size = {80,60},
            properties = {
                "framesanim"
            }
        }
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}