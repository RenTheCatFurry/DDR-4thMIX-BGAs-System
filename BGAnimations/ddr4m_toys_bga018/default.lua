local layer1 = {
    textures = {
        {
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {9,6,7,8},
            delay = 0,
            properties = {
                "framesseq"
            }
        }
    },
    effect = "snailout",
    effectlength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}