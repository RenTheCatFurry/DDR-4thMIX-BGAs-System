local layer1 = {
    textures = {
        {
            img = "feve/e99_feve f11 c10 8x8.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    },
    scroll = {2,8},
    alpha = 0.75
}

local layer2 = {
    textures = {
        {
            img = "feve/b99_feve f10 c03 8x4.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        },
        {
            img = "feve/b99_feve f06 c03 8x4.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    },
    scroll = {6,8},
    blendmode = "Add",
    alpha = 0.75
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}