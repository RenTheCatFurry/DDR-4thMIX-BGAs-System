local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgmirror2",
    properties = {
        "invert"
    }
}

local fade = {
    textures = {
        {
            img = "blackbg (stretch).png"
        }
    },
    fadelength = 1,
    properties = {
        "fadelinear"
    }
}

local layer2 = {
    textures = {
        {
            img = "feve/b99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {3}
        }
    },
    effect = "spiral2in",
    effectlength = 4,
    coloranim = 9
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", fade),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
