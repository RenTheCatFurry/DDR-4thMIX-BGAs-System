local layer1 = {
    textures = {
        {
            img = "feve/j99_feve 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        },
        {
            img = "feve/i99_feve 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    scroll = {2, 4},
    alpha = 0.75,
    properties = {
        "effectpingpong"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}