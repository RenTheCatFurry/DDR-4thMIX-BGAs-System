local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort1"
}

local layer2 = {
    textures = {
        {
        }
    },
    effect = "bgdistort7",
    effectlength = 0.5,
    effectoffset = 0.5,
    alpha = 0.5
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}