local layer1 = {
    textures = {{rgb = {1,1,0.5}}},
    effect = "bgdistort6"
}

local layer2 = {
    textures = {
        {
            img = "dsad/g88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {0,1,2,3,4,5,6,7},
            delay = 1/15
        }
    },
    scroll = {8,4},
    blendmode = "Add",
    alpha = 7/8,
    coloranim = 6
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}