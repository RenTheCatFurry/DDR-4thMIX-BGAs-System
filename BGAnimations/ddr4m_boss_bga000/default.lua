local layer1 = {
    textures = {
        {
            img = "boss/b88_boss 5x3 (stretch).png",
            rgb = {0,1,1},
            size = {64,64},
            frames = {4}
        }
    },
    effect = "tilespin",
    effectlength = 2
}

local layer2 = {
    textures = {
        {
            img = "boss/b88_boss hsv000 5x3 (stretch).png",
            frames = {0}
        }
    },
    effect = "bgmirror2",
    blendmode = "InvertDest"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}