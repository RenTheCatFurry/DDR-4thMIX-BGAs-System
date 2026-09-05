local layer1 = {
    textures = {
        {
            img = "dsad/b99_dsad 4x3 (stretch).png",
            rgb = {1,1,0},
            properties = {"noframes"}
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "dsad/c9a_dsad 4x2 (stretch).png",
            size = {80,128},
            rgb = {1,1,0},
            frames = {5,6},
            delay = 1,
            properties = {"framesbeat"}
        }
    },
    blendmode = "Add",
    properties = {"margin"}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}