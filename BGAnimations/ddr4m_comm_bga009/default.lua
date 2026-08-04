local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgwarp",
    effectlength = 8,
    properties = {
        "effectpingpong",
        "invert"
    }
}

local layer2 = {
    textures = {
        {
        }
    },
    effect = "bgdistort1",
    blendmode = "InvertDest"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}