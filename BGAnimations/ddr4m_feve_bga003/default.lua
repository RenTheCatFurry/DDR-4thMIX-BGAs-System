local layer1 = {
    textures = {
        {
            img = "feve/c99_feve hsv000 4x3 (stretch).png",
            size = {80,80},
            delay = 1/15
        }
    },
    alpha = 0.8,
    fadelength = 4,
    fadealpha = 0.6
}

local layer2 = {
    textures = {
        {
            img = "feve/g99_feve 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
