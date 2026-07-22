local layer1 = {
    textures = {
        {
            img = "naok/h85_naok 5x6 (stretch).png",
            size = {64,40},
            frames = {10,9},
            delay = 0.5,
            properties = {
                "framesbeat",
                "framesseq"
            }
        }
    },
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}