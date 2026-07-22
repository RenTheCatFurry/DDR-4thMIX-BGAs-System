local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgwarp",
    effectlength = 4,
    alpha = 2/3,
    properties = {
        "effectpingpong"
    }
}

local layer2 = {
    textures = {
        {
        }
    },
    scroll = {2,4},
    alpha = 2/3,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}