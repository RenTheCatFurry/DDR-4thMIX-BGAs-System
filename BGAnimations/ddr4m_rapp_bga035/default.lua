local layer1 = {
    textures = {
        {
            img = "rapp/b87_rapp 5x4 (stretch).png",
            size = {64,60},
            frames = {10,11,12,13,14,15,16,17,18,19},
            delay = 0,
            properties = {"framesseq"}
        }
    },
    properties = {"stretchxres"}
}

local layer2 = {
    textures = {
        {
            img = "rapp/f99_rapp 4x3 (stretch).png",
            size = {80,80},
            frames = {11}
        }
    },
    scroll = {8,2},
    blendmode = "InvertDest",
    alpha = 0.75
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}