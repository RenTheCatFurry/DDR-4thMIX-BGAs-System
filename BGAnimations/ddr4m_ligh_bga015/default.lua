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

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}