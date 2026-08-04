local layer1 = {
    textures = {
        {
            img = "riot/dba_riot 2x2 (stretch).png",
            rgb = {1,0,0},
            glow = {1,0,0,32/255},
            frames = {0}
        }
    },
    effect = "bgmirror2",
    alpha = 2/3
}

local layer2 = {
    textures = {
        {
            img = "riot/h97_riot 4x4 (stretch).png",
            size = {80,60},
            frames = {13,14,15},
            delay = 0,
            properties = {
		        "framesseq"
            }
        }
    },
    alpha = 0.75,
    blendmode = "Add",
    effect = "particlesin",
    effectlength = 4,
    spinlength = 3
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", {textures={{}},properties={"blackbg"}}),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
