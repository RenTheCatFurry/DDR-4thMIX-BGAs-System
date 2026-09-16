local layer1 = {
    textures = {
        {
            img = "rapp/g8a_rapp hsv000 5x2 (stretch).png",
            size = {64,120},
            frames = {0,1,2,3},
            delay = 1/15,
            properties = {"framesreverse", "framesseq"}
        },
        {
            img = "rapp/g8a_rapp hsv001 5x2 (stretch).png",
            size = {64,120},
            frames = {4,5,6,7,8,9},
            delay = 1/15,
            properties = {"framesreverse"}
        }
    },
    scroll = {4,1},
    alpha = 0.5,
    fadelength = 2,
    fadeoffset = 0.75,
    fadealpha = 0.5
}

local layer2 = {
    textures = {
        {
            img = "rapp/f99_rapp f10 c03 8x4.png",
            size = {80,80},
            properties = {"colorama"}
        }
    },
    blendmode = "Add",
    coloranim = 6
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}