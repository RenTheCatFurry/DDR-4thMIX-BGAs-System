local layer1 = {
    textures = {{}},
    effect = "bgdistort1",
    alpha = 0.35
}

local layer2 = {
    textures = {
        {
            img = "rapp/h77_rapp 5x4 (stretch).png",
            size = {60,60},
            properties = {
                "framesseq"
            }
        },
    },
    effect = "particlesup",
    effectlength = 6,
    blendmode = "Add",
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}