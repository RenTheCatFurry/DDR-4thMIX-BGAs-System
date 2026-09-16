local layer1 = {
    textures = {
        {
            img = "rapp/d4c_rapp (stretch).png"
        }
    },
    scroll = {2,4},
    fadelength = 4,
    fadeoffset = 0.75,
    fadealpha = 0.5
}

local layer2 = {
    textures = {
        {
            img = "rapp/b87_rapp 5x4 (stretch).png",
            size = {64,60},
            frames = {0,1,2},
            delay = 1/5,
            properties = {"framesanim"}
        },
        {
            img = "rapp/b87_rapp 5x4 (stretch).png",
            size = {64,60},
            frames = {3,4,5},
            delay = 1/5,
            properties = {"framesanim"}
        }
    },
    effect = "dvdbounce",
    effectlength = 5,
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}