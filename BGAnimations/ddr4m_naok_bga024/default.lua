local layer1 = {
    textures = {
        {
            img = "naok/a99_naok 4x3 (stretch).png",
            size = {80,80},
            frames = {6,7,8,9,10,11},
            properties = {
                "framesanim"
            }
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "naok/jba_naok f00 c00 4x4.png",
            properties = {
                "colorama"
            }
        }
    },
    blendmode = "Add",
    effect = "bgmirror2",
    alpha = 0.75,
    coloranim = 1
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}