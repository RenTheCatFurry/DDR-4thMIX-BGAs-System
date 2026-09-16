local layer1 = {
    textures = {{img = "rapp/cd4_rapp (stretch).png"}}
}

local layer2 = {
    textures = {{img = "rapp/d4c_rapp (stretch).png"}},
    bgcrop = {5,1},
    effect = "wagy",
    effectlength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}