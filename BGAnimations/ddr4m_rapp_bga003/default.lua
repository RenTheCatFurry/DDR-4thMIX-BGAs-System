local layer1 = {
    textures = {
        {
            img = "rapp/d4c_rapp (stretch).png"
        }
    },
    fadelength = 2,
    fadeoffset = 0,
    fadealpha = 0.5,
    properties = {"fadergb"}
}

local layer2 = {
    textures = {
        {
            img = "rapp/cd4_rapp (stretch).png"
        }
    },
    bgcrop = {1,6},
    effect = "wagx",
    effectoffset = 0.5,
    effectlength = 2,
    fadelength = 2,
    fadeoffset = 0.5,
    fadealpha = 0.5,
    properties = {"fadergb"}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}