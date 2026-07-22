local layer1 = {
    textures = {
        {
            img = "naok/i99_naok f10 c08 4x4.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}