local layer1 = {
    textures = {
        {
        }
    },
    effect = "tilespin",
    effectstep = 0.5,
    effectlength = 2,
    coloranim = 2,
    alpha = 2/3
}

local layer2 = {
    textures = {
        {
        }
    },
    scroll = {8,2},
    coloranim = 1,
    blendmode = "Add",
    alpha = 2/3
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}