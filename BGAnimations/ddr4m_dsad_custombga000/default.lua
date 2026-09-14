local layer1 = {
    textures = {
        {
            img = "dsad/a97_dsad 4x4 (stretch).png",
            size = {80,60},
            frames = {0,1,2,3,4,5,6,7},
            delay = 1/4,
            properties = {"framesbeat"}
        }
    },
    scroll = {8,2}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}