local layer1 = {
    textures = {
        {
            img = "ligh/cdc_ligh (stretch).png"
        }
    },
    effect = "bgdistort4"
}

local layer2 = {
    textures = {
        {
            img = "ligh/f99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {3}
        }
    },
    effect = "scrollxy",
    effectlength = 4,
    alpha = 0.5
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}