local layer1 = {
    textures = {
        {
            img = "naok/jba_naok f00 c01 8x8.png"
        },
        {
            img = "naok/jba_naok f01 c01 8x8.png"
        },
        {
            img = "naok/jba_naok f02 c01 8x8.png"
        },
        {
            img = "naok/jba_naok f03 c01 8x8.png"
        }
    },
    effect = "kaleidoscope2",
    properties = {
        "coloramafix"
    }
}

local layer2 = {
    textures = {
        {
            img = "naok/h85_naok 5x6 (stretch).png",
            size = {64,40},
            frames = {12}
        }
    },
    effect = "wagx",
    effectlength = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}