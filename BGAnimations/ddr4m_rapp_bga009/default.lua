local layer1 = {
    textures = {
        {
            img = "rapp/b87_rapp 5x4 (stretch).png",
            properties = {"noframes"}
        },
    },
    effect = "kaleidoscope2",
    alpha = 2/3
}

local layer2 = {
    textures = {
        {
            img = "rapp/eba_rapp 2x2 (stretch).png",
            frames = {1}
        }
    },
    effect = "bgmirror2",
    blendmode = "Add",
    coloranim = 1
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}