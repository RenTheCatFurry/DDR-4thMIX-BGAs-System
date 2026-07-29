local layer1 = {
    textures = {
        {
            img = "boss/dba_boss 2x2 (stretch).png",
            rgb = {1,0,0},
            frames = {0}
        }
    },
    effect = "bgmirror2"
}

local layer2 = {
    textures = {
        {
            img = "boss/fix000.png",
            size = {64,64}
        }
    },
    effect = "tilespin",
    effectlength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}