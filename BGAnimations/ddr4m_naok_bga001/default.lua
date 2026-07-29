local layer1 = {
    textures = {
        {
            img = "naok/jba_naok f02 c03 8x4.png",
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