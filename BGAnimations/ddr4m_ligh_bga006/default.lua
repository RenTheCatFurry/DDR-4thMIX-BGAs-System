local layer1 = {
    textures = {
        {
            img = "ligh/d9c_ligh 4x1 (stretch).png",
            size = {80,240},
            frames = {
                0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3,
                0,1,2,3,0,1,2,3,0,1,2,3,0,1,2,3
            },
            delay = 0.25,
            properties = {
                "framesbeat"
            }
        }
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}