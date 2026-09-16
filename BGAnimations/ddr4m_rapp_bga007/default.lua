local layer1 = {
    textures = {
        {
            img = "rapp/a99_rapp 4x3 (stretch).png",
            size = {80,80},
            frames = {8,9,10,11},
            delay = 1/15,
            properties = {"framesreverse"}
        }
    },
    coloranim = 1
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}