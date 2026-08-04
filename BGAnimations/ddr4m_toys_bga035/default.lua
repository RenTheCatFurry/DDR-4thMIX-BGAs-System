local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort4",
    alpha = 0.75
}

local layer2 = {
    textures = {
        {
            img = "toys/aba_toys f00 c00 4x4.png",
            properties = {
                "colorama"
            }
        }
    },
    effect = "bgmirror2",
    blendmode = "Add",
    alpha = 0.75
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}