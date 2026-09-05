local layer1 = {
    textures = {{}},
    effect = "bgdistort2"
}

local layer2 = {
    textures = {
        {
            img = "dsad/c9a_dsad hsv000 4x2 (stretch).png",
            size = {80,120},
            delay = 1/30
        }
    },
    effect = "pulse",
    effectoffset = 0.5,
    effectlength = 1,
    blendmode = "Add",
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}