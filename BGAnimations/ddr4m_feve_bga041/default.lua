local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort4",
    effectlength = 2
}

local layer2 = {
    textures = {
        {
            img = "feve/c99_feve 4x3 (stretch).png",
            size = {80,80},
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        }
    },
    fadelength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}