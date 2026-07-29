local layer1 = {
    textures = {
        {
            img = "toys/aba_toys f02 c07 4x2.png",
            properties = {
                "colorama"
            }
        }
    },
    effect = "bgmirror2",
    coloranim = 6
}

local layer2 = {
    textures = {
        {
            img = "toys/fba_toys 2x2 (stretch).png",
            size = {160,120},
            delay = 0,
            properties = {
                "framesseq"
            }
        }
    },
    effect = "particlesdownspin",
    effectlength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}