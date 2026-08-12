local layer1 = {
    textures = {
        {
            img = "toys/cdc_toys (stretch).png"
        },
        {
            img = "toys/bdc_toys (stretch).png"
        }
    },
    scroll = {8,3}
}

local layer2 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {10}
        }
    },
    effect = "particlesright",
    effectlength = 8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
