local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort6",
    alpha = 0.8,
    coloranim = 1
}

local layer2 = {
    textures = {
        {
            img = "feve/b99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {0}
        }
    },
    effect = "particlesin",
    effectlength = 6,
    spinlength = 4,
    blendmode = "Add",
    coloranim = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}