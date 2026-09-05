local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort1",
    effectlength = 2
}

local layer2 = {
    textures = {
        {
            img = "dsad/c9a_dsad 4x2 (stretch).png",
            size = {80,120},
            delay = 1/15
        }
    },
    blendmode = "Add",
    alpha = 7/8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}