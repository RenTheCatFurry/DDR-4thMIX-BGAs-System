local layer1 = {
    textures = {
        {
            img = "boss/g55_boss 8x6 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    effect = "bgdistort8"
}

local layer2 = {
    textures = {
        {
            img = "boss/b88_boss 5x3 (stretch).png",
            size = {64,64},
            frames = {6,7,8,9},
            delay = 1/15
        }
    },
    scroll = {8,4},
    alpha = 0.5
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}