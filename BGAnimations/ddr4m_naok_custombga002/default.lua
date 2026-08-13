local layer1 = {
    textures = {
        {
            img = "naok/a99_naok 4x3 (stretch).png",
            size = {80,80},
            frames = {0,1,2,3,4,5},
            delay = 1/15
        }
    },
    properties = {
        "margin"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}