local layer1 = {
    textures = {
        {
        }
    },
    effect = "kaleidoscope2"
}

local blackbg = {
    textures = {
        {
        }
    },
    alpha = 1/3,
    properties = {
        "blackbg"
    }
}

local layer2 = {
    textures = {
        {
        }
    },
    scroll = {8,2},
    coloranim = 1,
    blendmode = "Add",
    alpha = 2/3
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", blackbg),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}