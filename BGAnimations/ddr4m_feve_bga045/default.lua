local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort4"
}

local layer2 = {
    textures = {
        {
            img = "feve/b99_feve f08 c07 4x2.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    },
    blendmode = "Add",
    coloranim = 1,
    alpha = 0.7
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
