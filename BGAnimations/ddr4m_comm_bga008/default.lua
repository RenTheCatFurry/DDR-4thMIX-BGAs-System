local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgmirror2",
    coloranim = 2,
    fadelength = 4,
    fadeoffset = -0.15,
    alpha = 0.75
}

local layer2 = {
    textures = {
        {
        }
    },
    scroll = {8,1},
    coloranim = 2,
    blendmode = "Add",
    fadelength = 4,
    fadeoffset = -0.2,
    properties = {
        "invert",
        "fadeout"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}