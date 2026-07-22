local layer1 = {
    textures = {
        {
            img = "feve/dba_feve 2x2 (stretch).png",
            frames = {2,1,0},
            delay = 1/15
        }
    },
    effect = "bgmirror2",
    alpha = 0.5,
    coloranim = 1
}

local layer2 = {
    textures = {
        {
            img = "feve/b99_feve 4x3 (stretch).png",
            size = {80,80},
            frames = {2}
        }
    },
    effect = "spiral1out",
    effectlength = 2,
    alpha = 0.75,
    blendmode = "Add",
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}