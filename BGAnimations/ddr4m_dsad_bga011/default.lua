local layer1 = {
    textures = {
        {
            img = "dsad/b99_dsad 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    fadelength = 4,
    fadeoffset = -0.25,
    alpha = 7/8
}

local layer2 = {
    textures = {
        {
            img = "dsad/d88_dsad 5x3 (stretch).png",
            size = {64,64},
            rgb = {1,1,0},
            frames = {11}
        },
        {
            img = "dsad/d88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {11}
        }
    },
    effect = "pulse",
    effectlength = 1,
    blendmode = "Add",
    coloranim = 1,
    alpha = 7/8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}