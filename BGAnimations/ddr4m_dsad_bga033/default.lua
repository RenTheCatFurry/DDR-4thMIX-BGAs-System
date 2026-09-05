local layer1 = {
    textures = {
        {
            img = "dsad/d88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {14}
        }
    },
    effect = "tilespin",
    effectlength = 4,
    coloranim = 2
}

local layer2 = {
    textures = {
        {
            img = "dsad/e88_dsad hsv001 5x3 (stretch).png",
            size = {64,64},
            frames = {0}
        }
    },
    effect = "wagy",
    effectlength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}