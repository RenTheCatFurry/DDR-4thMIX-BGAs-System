local layer1 = {
    textures = {
        {
            img = "naok/jba_naok f00 c00 4x4.png",
            properties = {
                "colorama"
            }
        }
    },
    effect = "bgmirror2",
    coloranim = 1
}

local layer2 = {
    textures = {
        {
        }
    },
    effect = "bgdistort5",
    blendmode = "InvertDest"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}