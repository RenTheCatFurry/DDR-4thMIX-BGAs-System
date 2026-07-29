local layer1 = {
    textures = {
        {
            img = "naok/i99_naok f01 c04 8x8.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    },
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}