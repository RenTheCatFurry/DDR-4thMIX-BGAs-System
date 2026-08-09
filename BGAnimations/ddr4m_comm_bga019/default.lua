local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort8"
}

local layer2 = {
    textures = {
        {
        }
    },
    blendmode = "InvertDest"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}