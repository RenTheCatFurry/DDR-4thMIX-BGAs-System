local layer1 = {
    textures = {
        {
        }
    },
    scroll = {1,0.75},
    alpha = 2/3
}

local layer2 = {
    textures = {
        {
        }
    },
    scroll = {5,0.75},
    alpha = 0.5,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}