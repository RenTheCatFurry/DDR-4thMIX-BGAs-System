local layer1 = {
    textures = {
        {
            img = "rapp/eba_rapp invert 2x2 (stretch).png",
            frames = {0}
        }
    },
    effect = "bgmirror2",
    alpha = 1/3,
    coloranim = 1
}

local layer2 = {
    textures = {
        {
            img = "rapp/eba_rapp f01 c04 8x8.png",
            properties = {"colorama"}
        }
    },
    effect = "bgmirror2",
    blendmode = "Add",
    alpha = 0.75
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}