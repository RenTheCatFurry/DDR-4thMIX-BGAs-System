local layer1 = {
    textures = {
        {
            img = "rapp/f99_rapp f10 c11 8x8.png",
            size = {80,80},
            properties = {"colorama"}
        }
    },
    coloranim = 6,
    alpha = 0.75
}

local layer2 = {
    textures = {
        {
            img = "rapp/f99_rapp f09 c01 8x8.png",
            size = {80,80},
            properties = {"colorama"}
        }
    },
    coloranim = 3,
    alpha = 0.5,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}