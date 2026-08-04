local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort1",
    alpha = 0.5
}

local blackbg = {
    textures = {
        {
        }
    },
    fadelength = 4,
    properties = {
        "blackbg"
    }
}

local layer2 = {
    textures = {
        {
            img = "naok/e9a_naok 4x2 (stretch).png",
            size = {80,120},
            delay = 1/12.5
        }
    },
    scroll = {1,4},
    blendmode = "Add",
    fadelength = 4,
    fadealpha = 0.75
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", blackbg),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}