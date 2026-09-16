local layer1 = {
    textures = {
        {
            img = "rapp/f99_rapp f10 c08 4x4.png",
            size = {80,80},
            properties = {"colorama"}
        }
    },
    alpha = 2/3
}

local layer2 = {
    textures = {
        {
            img = "rapp/f99_rapp f08 c04 8x8.png",
            size = {80,80},
            properties = {"colorama"}
        }
    },
    coloranim = 3,
    alpha = 0.75,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}