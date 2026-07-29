local layer1 = {
    textures = {
        {
            img = "riot/dba_riot 2x2 (stretch).png",
            size = {160,120},
            rgb = {1,0,0},
            frames = {1}
        }
    },
    scroll = {8,1},
    alpha = 0.75
}

local layer2 = {
    textures = {
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {4,5},
            delay = 0.5,
            properties = {
                "framesanim",
                "framesbeat"
            }
        }
    },
    effect = "dvdbounce",
    effectlength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}