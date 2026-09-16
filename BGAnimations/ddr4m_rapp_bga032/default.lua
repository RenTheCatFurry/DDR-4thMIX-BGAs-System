local layer1 = {
    textures = {{}},
    effect = "bgdistort5",
    coloranim = 1
}

local layer2 = {
    textures = {{img = "rapp/d4c_rapp (stretch).png"}},
    bgcrop = {5,1},
    effect = "wagy",
    effectlength = 2,
    fadelength = 2,
    properties = {"fadergb"}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}