local layer1 = {
    textures = {
        {
            img = "rapp/j99_rapp 4x3 (stretch).png",
            properties = {"noframes"},
        }
    },
    effect = "bgdistort1",
    coloranim = 1,
    alpha = 2/3
}

local layer2 = {
    textures = {
        {
            img = "rapp/g8a_rapp 5x2 (stretch).png",
            size = {64,120},
            frames = {0,1,2,3},
            delay = 1/15,
            properties = {"framesseq"}
        }
    },
    effect = "scrollxy",
    effectlength = 12,
    blendmode = "Add",
    alpha = 0.75
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}