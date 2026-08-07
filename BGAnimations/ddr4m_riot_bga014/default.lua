local layer1 = {
    textures = {
        {
            img = "riot/bb9_riot 2x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    effect = "bgdistort6"
}

local layer2 = {
    textures = {
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {9}
        }
    },
    effect = "dvdbounce",
    effectlength = 4,
    properties = {
        "effecthalf"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}