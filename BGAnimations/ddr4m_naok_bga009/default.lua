local layer1 = {
    textures = {
        {
            img = "naok/b99_naok 4x3 (stretch).png",
            size = {80,80},
            frames = {6,7,8,9,10,11},
            delay = 1/15
        }
    },
    coloranim = 9
}

local layer2 = {
    textures = {
        {
            img = "naok/i99_naok f09 c01 8x4.png",
            size = {80,80},
            properties = {
                "colorama"
            }
        }
    },
    blendmode = "Add",
    coloranim = 9
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}