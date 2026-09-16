local layer1 = {
    textures = {
        {
            img = "rapp/eba_rapp f00 c02 8x10",
            properties = {"colorama"}
        }
    },
    effect = "bgmirror2",
    alpha = 0.4
}

local layer2 = {
    textures = {
        {
            img = "rapp/f99_rapp 4x3 (stretch).png",
            size = {80,80},
            frames = {0,1,2,3,4,5,6,7},
            properties = {"framesanim"}
        }
    },
    blendmode = "Add",
    coloranim = 2,
    effect = "particlesout",
    effectlength = 9
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}