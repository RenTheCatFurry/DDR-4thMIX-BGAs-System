local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort8"
}

local layer2 = {
    textures = {
        {
            img = "naok/dba_naok 2x2 (stretch).png",
            size = {160,120}
        }
    },
    blendmode = "Add",
    effect = "particlesupspin",
    effectlength = 2,
    spinlength = 2,
    alpha = 0.75
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}
