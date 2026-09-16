local layer1 = {
    textures = {
        {
            img = "rapp/eba_rapp 2x2 (stretch).png",
            size = {160,120},
            frames = {3}
        }
    },
    scroll = {2,4}
}

local layer2 = {
    textures = {
        {
            img = "rapp/eba_rapp 2x2 (stretch).png",
            size = {160,120},
            frames = {3}
        }
    },
    scroll = {8,4},
    coloranim = 1,
    blendmode = "InvertDest"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}