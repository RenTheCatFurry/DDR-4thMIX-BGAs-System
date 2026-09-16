local layer1 = {
    textures = {{}},
    effect = "bgdistort6",
    coloranim = 1,
    properties = {"invert"}
}

local layer2 = {
    textures = {{img = "rapp/cd4_rapp (stretch).png"}},
    bgcrop = {1,4},
    effect = "wagx",
    effectlength = 2,
    fadelength = 2,
    properties = {"fadergb"}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}