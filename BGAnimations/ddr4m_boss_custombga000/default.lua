local layer1 = {
    textures = {
        {
            img = "boss/fd9_boss 1x3 (stretch).png",
            properties = {
                "noframes"
            }
        },
        {
            img = "boss/ed9_boss 1x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    scroll = {2,4},
    alpha = 0.8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}