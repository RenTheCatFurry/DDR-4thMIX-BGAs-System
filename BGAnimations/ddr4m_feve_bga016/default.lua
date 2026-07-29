local layer1 = {
    textures = {
        {
        },
    },
    effect = "bgmirror2",
    alpha = 0.75,
    coloranim = 1,
    properties = {
        "invert"
    }
}

local layer2 = {
    textures = {
        {
            img = "feve/b99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {6}
        },
    },
    effect = "particlesbounceout",
    effectlength = 4,
    alpha = 0.75,
    blendmode = "Add",
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}