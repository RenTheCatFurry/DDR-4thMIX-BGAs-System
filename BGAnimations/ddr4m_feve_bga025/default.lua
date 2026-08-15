local layer1 = {
    textures = {
        {
            img = "feve/j99_feve hsv000 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        },
        {
            img = "feve/i99_feve hsv000 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    scroll = {2,4},
    alpha = 0.75
}

local layer2 = {
    textures = {
        {
            img = "feve/b99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {0}
        },
        {
            img = "feve/e99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {4}
        }
    },
    effect = "particlesdown",
    effectlength = 3,
    spinlength = 2,
    blendmode = "Add",
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}