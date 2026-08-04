local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort1",
    effectlength = 2
}

local blackbg = {
    textures = {
        {
        }
    },
    fadelength = 8,
    properties = {
        "blackbg"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", blackbg)
}