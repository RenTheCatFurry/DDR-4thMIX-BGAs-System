local layer1 = {
    textures = {
        {
            img = "boss/b88_boss 5x3 (stretch).png",
            size = {64,64},
            frames = {1}
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "boss/b88_boss 5x3 (stretch).png",
            size = {64,64},
            frames = {3}
        }
    },
    effect = "pulseout",
    effectlength = 2,
    coloranim = 5,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}