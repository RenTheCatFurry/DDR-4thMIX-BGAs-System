local layer1 = {
    textures = {
        {
        }
    },
    effect = "kaleidoscope2",
    coloranim = 1
}

local blackbg = {
    textures = {
        {
        }
    },
    alpha = 0.5,
    properties = {
        "blackbg"
    }
}

local layer2 = {
    textures = {
        {
        }
    },
    effect = "bgdistort3",
    blendmode = "Add",
    alpha = 0.5
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", blackbg),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}