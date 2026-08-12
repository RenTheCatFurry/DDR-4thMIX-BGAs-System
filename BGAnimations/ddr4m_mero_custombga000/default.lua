local layer1 = {
    textures = {
        {
            img = "mero/hd7_mero 1x4 (stretch).png",
            size = {320,60},
            properties = {"framesseq"}
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "mero/b97_mero 4x4 (stretch).png",
            size = {80,60},
            frames = {8,8,9,9,6,7,6,7},
            delay = 0.5,
            properties = {"framesbeat"}
        }
    },
    setmesh = {1,1}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
