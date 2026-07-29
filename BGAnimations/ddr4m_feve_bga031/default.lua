local layer1 = {
    textures = {
        {
            img = "feve/c99_feve 4x3 (stretch).png",
            size = {80,80},
            delay = 1/15
        }
    },
    alpha = 0.25,
    coloranim = 1
}

local layer2 = {
    textures = {
        {
            img = "feve/e99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {0,1,2,3},
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        }
    },
    effect = "explodein",
    effectlength = 8,
    blendmode = "Add",
    coloranim = 0
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}