local layer1 = {
    textures = {
        {
            img = "rapp/b87_rapp hsv000 5x4 (stretch).png",
            size = {64,60},
            frames = {6}
        }
    },
    scroll = {2,2.5},
    alpha = 1/3,
    fadelength = 2,
    fadeoffset = 0.75,
    fadealpha = 0.5
}

local layer2 = {
    textures = {
        {
            img = "rapp/f99_rapp 4x3 (stretch).png",
            size = {80,80},
            frames = {0,1,2,3,4,5,6,7},
            delay = 1/15,
            properties = {"framesseq"}
        }
    },
    effect = "scrollxy",
    blendmode = "Add",
    coloranim = 9,
    effectlength = 10/3
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}