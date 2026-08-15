local layer1 = {
    textures = {
        {
            img = "riot/cda_riot hsv000 1x2 (stretch).png",
            size = {320,120},
            delay = 0.5,
            properties = {
                "framesbeat"
            }
        }
    },
    scroll = {1,2}
}

local layer2 = {
    textures = {
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {8}
        }
    },
    effect = "pulse",
    effectoffset = 0.5
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}