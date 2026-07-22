local layer1 = {
    textures = {
        {
            img = "riot/f9c_riot 4x1 (stretch).png",
            rgb = {1,0,0},
            properties = {
                "noframes"
            }
        },
                {
            img = "riot/e9c_riot 4x1 (stretch).png",
            rgb = {1,0,0},
            properties = {
                "noframes"
            }
        }
    },
    scroll = {8,4},
    fadelength = 0.5,
    properties = {
        "fadelinear",
        "fadeout"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}