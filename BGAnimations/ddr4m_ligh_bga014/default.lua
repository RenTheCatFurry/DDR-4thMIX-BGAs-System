local layer1 = {
    textures = {
        {
            img = "ligh/jba_light f00 c01 8x8.png",
            properties = {
                "colorama"
            }
        }
    },
    effect = "bgmirror2"
}

local layer2 = {
    textures = {
        {
            img = "ligh/f99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {2}
        }
    },
    effect = "explodeinspin",
    effectlength = 8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}