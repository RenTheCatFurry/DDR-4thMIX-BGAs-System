local layer1 = {
    textures = {
        {
            img = "ligh/cdc_ligh hsv000 (stretch).png"
        }
    },
    effect = "bgdistort4"
}

local layer2 = {
    textures = {
        {
            img = "ligh/f99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {2}
        }
    },
    effect = "particlesdown",
    effectlength = 2,
    spinlength = 2,
    blendmode = "Add",
    alpha = 7/8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}