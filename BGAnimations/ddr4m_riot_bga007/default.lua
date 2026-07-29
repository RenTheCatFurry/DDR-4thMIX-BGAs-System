local layer1 = {
    textures = {
        {
            img = "riot/dba_riot 2x2 (stretch).png",
            rgb = {1,0,0},
            frames = {0}
        }
    },
    effect = "bgmirror2",
    alpha = 0.5
}

local layer2 = {
    textures = {
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            rgb = {1,0.5,0.5},
            size = {80,60},
            frames = {13,14,15},
            delay = 0,
            properties = {
		        "framesseq"
            }
        }
    },
    blendmode = "Add",
    effect = "particlesin",
    effectlength = 4
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}