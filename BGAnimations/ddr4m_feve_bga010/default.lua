local layer1 = {
    textures = {
        {
            img = "feve/c99_feve 4x3 (stretch).png",
            size = {80,80},
            delay = 1/15
        }
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}