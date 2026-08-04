local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort1",
    effectlength = 1,
    alpha = 0.8
}

local layer2 = {
    textures = {
        {
            img = "feve/b99_feve f02 c01 8x8.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        },
        {
            img = "feve/b99_feve f03 c01 8x8.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        },
        {
            img = "feve/b99_feve f01 c01 8x8.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        },
        {
            img = "feve/b99_feve f02 c01 8x8.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    },
    blendmode = "Add",
    effect = "explodeinspin",
    effectlength = 8,
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}