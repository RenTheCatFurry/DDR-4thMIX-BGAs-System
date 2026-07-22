local layer1 = {
    textures = {
        {
            img = "feve/i99_feve hsv000 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        },
        {
            img = "feve/j99_feve hsv000 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    scroll = {6, 4},
    alpha = 2/3
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
    effect = "particlesdownspin",
    effectlength = 4,
    blendmode = "Add",
    alpha = 0.75,
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}