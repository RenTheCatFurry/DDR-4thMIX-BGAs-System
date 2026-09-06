local layer1 = {
    textures = {{}},
    effect = "bgmirror1",
    fadelength = 2
}

local layer2 = {
    textures = {{}},
    effect = "bgmirror2",
    coloranim = 1,
    fadelength = 2,
    fadeoffset = 0.5,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}