local layer1 = {
    textures = {
        {
            img = "ligh/e99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {1,2},
            delay = 0.5,
            properties = {
                "framesbeat"
            }
        }
    },
    scroll = {4,4}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}