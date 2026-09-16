local layer1 = {
    textures = {{}},
    effect = "bgdistort4",
    coloranim = 1,
    alpha = 2/3
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