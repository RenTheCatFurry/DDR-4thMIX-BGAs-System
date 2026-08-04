local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort4",
    effectlength = 2,
    effectstep = 1,
    coloranim = 1
}

local layer2 = {
    textures = {
        {
            img = "feve/g99_feve 4x3 (stretch).png",
            rgb = {0,1,0},
            properties = {
                "noframes"
            }
        }
    },
    blendmode = "Add",
    fadelength = 1,
    fadeoffset = -0.25,
    fadealpha = 0.5
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}