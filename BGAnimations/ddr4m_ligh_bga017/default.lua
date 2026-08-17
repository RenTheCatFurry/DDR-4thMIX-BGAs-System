local layer1 = {
    textures = {
        {
            img = "ligh/e99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {8,9,10,11},
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        }
    },
    coloranim = 0
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}