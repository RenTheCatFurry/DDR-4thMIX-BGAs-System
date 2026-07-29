local layer1 = {
    textures = {
        {
            img = "toys/ddc_toys (stretch).png"
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "toys/g88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        }
    },
    effect = "scrollxy",
    effectlength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}