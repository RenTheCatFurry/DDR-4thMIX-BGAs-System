local layer1 = {
    textures = {
        {
            img = "riot/g9a_riot hsv000 4x2 (stretch).png",
            size = {80,120},
            delay = 1/15,
            properties = {
                "framesanim"
            }
        }
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}