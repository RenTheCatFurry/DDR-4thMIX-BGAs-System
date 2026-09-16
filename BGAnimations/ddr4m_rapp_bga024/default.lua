local layer1 = {
    textures = {{}},
    effect = "bgdistort4",
    alpha = 0.825
}

local layer2 = {
    textures = {
        {
            img = "rapp/eba_rapp f03 c10 8x8.png",
            size = {160,120},
            properties = {"colorama"}
        },
    },
    scroll = {2,4},
    coloranim = 1,
    alpha = 7/8,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}