local layer1 = {
    textures = {
        {
            img = "rapp/j99_rapp 4x3 (stretch).png",
            properties = {"noframes"}
        },
        {
            img = "rapp/i99_rapp 4x3 (stretch).png",
            properties = {"noframes"}
        }
    },
    scroll = {8,8},
    properties = {"effectpingpong"}
}

local layer2 = {
    textures = {
        {
            img = "rapp/g8a_rapp 5x2 (stretch).png",
            size = {64,120},
            frames = {0,1,2,3},
            delay = 0.25,
            properties = {"framesseq", "framesbeat"}
        }
    },
    effect = "particlesdown",
    effectlength = 6,
    spinlength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}