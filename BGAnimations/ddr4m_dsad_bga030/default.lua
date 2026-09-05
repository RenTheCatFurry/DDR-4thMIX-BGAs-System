local layer1 = {
    textures = {{}},
    effect = "bgdistort2"
}

local layer2 = {
    textures = {
        {
            img = "dsad/e88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {9}
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