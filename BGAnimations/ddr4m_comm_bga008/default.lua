local layer1 = {
    textures = {
        {
        }
    },
    scroll = {8,1},
    coloranim = 2,
    properties = {
        "invert",
    }
}

local fade = {
    textures = {
        {
            img = "blackbg (stretch).png"
        }
    },
    fadelength = 4,
    fadeoffset = -0.25
}

local layer2 = {
    textures = {
        {
        }
    },
    effect = "bgmirror2",
    coloranim = 2,
    fadelength = 4,
    fadeoffset = 0.25,
    alpha = 0.75,
    blendmode = "Add",
    properties = {
        "fadeout"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", fade),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
