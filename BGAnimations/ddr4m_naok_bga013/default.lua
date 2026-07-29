local layer1 = {
    textures = {
        {
            img = "naok/i99_naok f08 c05 8x4.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    },
    scroll = {4,2},
    coloranim = 8
}

local layer2 = {
    textures = {
        {
            img = "naok/b99_naok 4x3 (stretch).png",
            size = {80,80},
            frames = {0,1,2,3,4,5},
            delay = 1/20,
            properties = {
                "framesreverse"
            }
        }
    },
    effect = "particlesleft",
    effectlength = 20
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}