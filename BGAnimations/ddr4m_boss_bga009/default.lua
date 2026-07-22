local layer1 = {
    textures = {
        {
            img = "boss/hd3_boss 1x8 (stretch).png",
            size = {320,30},
            rgb = {0,1,1},
            delay = 1/15,
            properties = {
                "framesanim"
            }
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "boss/b88_boss 5x3 (stretch).png",
            size = {64,64},
            frames = {5}
        }
    },
    effect = "dvdbounce",
    effectlength = 8,
    effectstep = 0.5,
    coloranim = 3
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}