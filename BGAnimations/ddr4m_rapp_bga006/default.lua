local layer1 = {
    textures = {
        {
            img = "rapp/a99_rapp 4x3 (stretch).png",
            size = {80,80},
            frames = {0,1,2,3,4,5,6,7},
            delay = 1/15,
            properties = {"framesreverse"}
        }
    },
    coloranim = 1
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}