local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort2",
    coloranim = 1
}

local layer2 = {
    textures = {
        {
            img = "dsad/d88_dsad f10 c09 8x4.png",
            size = {64,64},
            properties = {
                "colorama"
            }
        }
    },
    blendmode = "Add",
    coloranim = 3
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}