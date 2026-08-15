local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgmirror2"
}

local layer2 = {
    textures = {
        {
        }
    },
    bgcrop = {5,1},
    effect = "wagy",
    effectlength = 1
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}