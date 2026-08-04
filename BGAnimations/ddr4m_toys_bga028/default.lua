local layer1 = {
    textures = {
        {
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "toys/j87_toys 5x4 (stretch).png",
            size = {64,60},
            frames = {0,1,2,3},
            delay = 1/15,
            properties = {
                "framesseq"
            }
        }
    },
    coloranim = 0,
    effect = "wagyout",
    effectlength = 8/3
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
