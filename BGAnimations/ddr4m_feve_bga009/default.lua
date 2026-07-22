local layer1 = {
    textures = {
        {
            img = "feve/g99_feve 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "feve/hd7_feve 1x4 (stretch).png",
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        }
    },
    effect = "bgmirror1",
    fadelength = 4,
    alpha = 0.75,
    blendmode = "Add",
    coloranim = 1,
    properties = {
        "fadelinear",
        "fadestop"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}