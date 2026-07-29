local layer1 = {
    textures = {
        {
            img = "toys/cdc_toys (stretch).png",
            rgb = {1,0.5,0.5}
        },
        {
            img = "toys/bdc_toys (stretch).png",
            rgb = {1,0.5,0.5}
        }
    },
    scroll = {8,4},
    alpha = 0.8,
    properties = {
        "effectpingpong"
    }
}

local layer2 = {
    textures = {
        {
            img = "toys/ed7_toys 1x4 (stretch).png",
            size = {320,60},
            delay = 1/7.5,
            properties = {
                "framesanim"
            }
        }
    },
    setmesh = {1,3},
    blendmode = "Add",
    alpha = 2/3
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}