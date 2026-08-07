local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort7",
    coloranim = 1
}

local layer2 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        }
    },
    effect = "particlesin",
    effectlength = 8,
    spinlength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}