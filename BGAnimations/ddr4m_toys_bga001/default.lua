local layer1 = {
    textures = {
        {
            img = "toys/aba_toys f00 c04 8x8.png",
            properties = {
                "colorama"
            }
        }
    },
    effect = "bgmirror2"
}

local layer2 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {11,12,13,14}
        }
    },
    effect = "particlesout",
    effectlength = 6,
    spinlength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}