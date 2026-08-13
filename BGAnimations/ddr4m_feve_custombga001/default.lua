local layer1 = {
    textures = {
        {
            img = "feve/b99_feve f08 c02 8x10.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "feve/f99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {4,5,6,7,8,9,10,11},
            delay = 1/15,
            properties = {
                "framesseq",
                "framesreverse"
            }
        },
    },
    effect = "scrollxy",
    effectlength = 10
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
