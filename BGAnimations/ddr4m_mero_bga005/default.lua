local layer1 = {
    textures = {
        {
            img = "mero/e9c_mero 4x1 (stretch).png",
            properties = {"noframes"}
        }
    },
    effect = "tilespin",
    effectlength = 4,
    alpha = 7/8
}

local layer2 = {
    textures = {
        {
            img = "mero/b97_mero 4x4 (stretch).png",
            size = {80,60},
            frames = {0}
        }
    },
    effect = "dvdbounce",
    effectlength = 4,
    alpha = 0.75,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
