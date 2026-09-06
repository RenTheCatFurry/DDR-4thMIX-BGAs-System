local layer1 = {
    textures = {{}},
    alpha = 0.75,
    scroll = {6,8},
    coloranim = 1
}

local layer2 = {
    textures = {{}},
    blendmode = "Add",
    alpha = 0.75,
    scroll = {2,8/3}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}