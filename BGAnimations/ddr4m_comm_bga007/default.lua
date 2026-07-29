local layer1 = {
    textures = {
        {
        }
    },
    scroll = {4,2},
    coloranim = 2,
    alpha = 7/8
}

local layer2 = {
    textures = {
        {
        }
    },
    scroll = {1,2},
    coloranim = 1,
    alpha = 7/8,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}