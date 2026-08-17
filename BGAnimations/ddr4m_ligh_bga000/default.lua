local layer1 = {
    textures = {
        {
            img = "ligh/bdc_ligh (stretch).png"
        },
        {
            img = "ligh/adc_ligh (stretch).png"
        }
    },
    scroll = {4,4}
}

local layer2 = {
    textures = {
        {
            img = "ligh/gb9_ligh 2x3 (stretch).png",
            size = {160,80},
            frames = {4,5},
            properties = {
                "framesanim"
            }
        }
    },
    effect = "particlesleft",
    effectlength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}