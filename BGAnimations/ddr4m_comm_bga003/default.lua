local layer1 = {
    textures = {
        {
        }
    },
    alpha = 2/3,
    effect = "bgmirror2",
    properties = {
        "invert"
    }
}

local layer2 = {
    textures = {
        {
        }
    },
    scroll = {8,4},
    alpha = 2/3,
    coloranim = 1,
    blendmode = "Add",
    properties = {
        "invert"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}