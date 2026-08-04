local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort1",
    blinkalpha = 0
}

local blackbg = {
    textures = {
        {
        }
    },
    fadelength = 1/3,
    properties = {
        "blackbg",
        "fadelinear",
        "fadelinearinvert"
    }
}

local layer2 = {
    textures = {
        {
            img = "naok/h85_naok 5x6 (stretch).png",
            frames = {16,17,18,19},
            size = {64,40},
            delay = 1/12.5,
            properties = {
                "framesanim"
            }
        }
    },
    blendmode = "Add",
    effect = "scrollxy",
    effectlength = 20
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", blackbg),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}