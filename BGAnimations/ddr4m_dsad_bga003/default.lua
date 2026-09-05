local layer1 = {
    textures = {
        {
            img = "dsad/g88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {9}
        },
        {
            img = "dsad/e88_dsad hsv000 5x3 (stretch).png",
            size = {64,64},
            frames = {10}
        }
    },
    scroll = {2,4},
    coloranim = 2,
    fadelength = 4,
    properties = {
        "fadelinear",
        "fadeout"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}