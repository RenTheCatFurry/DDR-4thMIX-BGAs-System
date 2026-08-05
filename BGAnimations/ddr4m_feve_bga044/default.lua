local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort3"
}

local layer2 = {
    textures = {
        {
            img = "feve/b99_feve f06 c05 8x4.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    },
    effect = "snailin",
    effectlength = 2,
    blendmode = "Add",
    fadelength = 1,
    properties = {
        "fadelinear",
        "fadeout"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}