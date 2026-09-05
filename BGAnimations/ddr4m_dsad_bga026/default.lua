local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgwarp",
    coloranim = 1,
    properties = {"effecthalf"}
}

local layer2 = {
    textures = {
        {
            img = "dsad/a97_dsad 4x4 (stretch).png",
            size = {80,60},
            frames = {7,0},
            delay = 1,
            properties = {"framesbeat"}
        }
    },
    blendmode = "Add"
}

local layer3 = {
    textures = {
        {
            img = "dsad/a97_dsad nobg 4x4 (stretch).png",
            size = {80,60},
            frames = {7,0},
            delay = 1,
            properties = {"framesbeat"}
        }
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3)
}