local layer1 = {
    textures = {
        {
            img = "naok/gdc_naok (stretch).png",
        }
    },
    scroll = {2,3}
}

local layer2 = {
    textures = {
        {
            img = "naok/dba_naok 2x2 (stretch).png",
        }
    },
    blendmode = "Add",
    effect = "bgmirror2",
    alpha = 7/8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}