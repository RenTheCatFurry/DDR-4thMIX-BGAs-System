local layer1 = {
    textures = {
        {
        }
    },
    alpha = 0.75,
    coloranim = 1
}

local layer2 = {
    textures = {
        {
            img = "feve/b99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {6}
        }
    },
    effect = "particlesright",
    effectlength = 2.5,
    blendmode = "Add",
    alpha = 0.75,
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}