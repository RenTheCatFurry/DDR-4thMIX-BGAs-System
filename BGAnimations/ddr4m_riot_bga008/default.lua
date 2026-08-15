local layer1 = {
    textures = {
        {
            img = "riot/dba_riot f00 c08 4x4.png",
            properties = {
                "colorama"
            }
        }
    },
    effect = "bgmirror2"
}

local layer2 = {
    textures = {
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {10,11},
            delay = 1/20,
            properties = {
                "framesanim"
            }
        }
    },
    effect = "pulse",
    effectlength = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}