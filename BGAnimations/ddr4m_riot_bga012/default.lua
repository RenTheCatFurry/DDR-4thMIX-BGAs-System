local layer1 = {
    textures = {
        {
            img = "riot/cda_riot hsv000 1x2 (stretch).png",
            size = {320,120},
            delay = 0.5,
            properties = {
                "framesbeat"
            }
        }
    },
    scroll = {1,2}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}