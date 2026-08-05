local layer1 = {
    textures = {
        {
            img = "boss/dba_boss f01 c00 4x4.png",
            properties = {
                "colorama"
            }
        }
    },
    effect = "bgmirror2",
    alpha = 0.75
}

local layer2 = {
    textures = {
        {
            img = "boss/b88_boss 5x3 (stretch).png",
            size = {64,64},
            rgb = {0,1,0},
            frames = {3}
        }
    },
    effect = "tilespin",
    effectlength = 4,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
