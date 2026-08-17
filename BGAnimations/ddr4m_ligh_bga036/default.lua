local layer1 = {
    textures = {
        {
            img = "ligh/f99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {7}
        },
        {
            img = "ligh/f99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {5}
        }
    },
    scroll = {4,1}
}

local layer2 = {
    textures = {
        {
            img = "ligh/gb9_ligh 2x3 (stretch).png",
            size = {160,80},
            frames = {0,1},
            properties = {
                "framesanim"
            }
        }
    },
    effect = "particlesdown",
    effectlength = 6
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}