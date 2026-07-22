local layer1 = {
    textures = {
        {
            img = "feve/hd7_feve 1x4 (stretch).png",
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        },
    },
    effect = "bgmirror1",
    alpha = 0.75,
    coloranim = 1
}

local layer2 = {
    textures = {
        {
            img = "feve/f99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {4,5,6,7,8,9,10,11},
            delay = 0.25,
            properties = {
                "framesbeat",
                "framesreverse"
            }
        },
    },
    setmesh = {1,1},
    alpha = 0.75,
    blendmode = "Add",
    coloranim = 1
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}