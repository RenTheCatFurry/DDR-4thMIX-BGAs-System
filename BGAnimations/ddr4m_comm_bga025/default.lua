local layer1 = {
    textures = {{}},
    effect = "bgwarpreverse",
    effectlength = 8
}

local blackbg = {
    textures = {{}},
    fadelength = 4,
    fadeoffset = 0.5,
    properties = {"blackbg"}
}

local layer2 = {
    textures = {{}},
    scroll = {1,4},
    coloranim = 1,
    fadelength = 4,
    fadeoffset = 0.5,
    blendmode = "Add",
    properties = {"invert"}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", blackbg),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}