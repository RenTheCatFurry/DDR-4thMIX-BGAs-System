local layer1 = {
    textures = {
        {
            img = "rapp/b87_rapp 5x4 (stretch).png",
            size = {64,60},
            frames = {6}
        }
    },
    scroll = {8,1.25},
    coloranim = 1,
    alpha = 1/3
}

local layer2 = {
    textures = {
        {
            img = "rapp/g8a_rapp 5x2 (stretch).png",
            size = {64,120},
            frames = {4,5,6,7,8,9},
            delay = 1/15,
            properties = {"framesseq"}
        }
    },
    effect = "scrollxy",
    effectlength = 8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}