local layer1 = {
    textures = {
        {
        }
    },
    alpha = 0.75,
    effect = "bgdistort1",
    properties = {
        "invert"
    }
}

local layer2 = {
    textures = {
        {
            img = "feve/b99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {2}
        }
    },
    blendmode = "Add",
    effect = "particlesin",
    effectlength = 4,
    effectstep = 1,
    coloranim = 1
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}