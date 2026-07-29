local layer1 = {
    textures = {
        {
        }
    },
    scroll = {5,8},
    alpha = 1/3
}

local layer2 = {
    textures = {
        {
            rgb = {1,1,0}
        }
    },
    scroll = {5,4},
    alpha = 1/3,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}