local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort1"
}

local blackbg = {
    textures = {
        {
        }
    },
    fadelength = 0.5,
    properties = {
        "blackbg",
        "fadelinear",
        "fadelinearinvert",
        "fadeout"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", blackbg)
}