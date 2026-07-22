local layer1 = {
    textures = {
        {
            img = "feve/dba_feve 2x2 (stretch).png",
            rgb = {1,0,0},
            size = {160,120},
            frames = {3}
        },
    },
    scroll = {2,8}
}

local layer2 = {
    textures = {
        {
            img = "feve/dba_feve 2x2 (stretch).png",
            rgb = {0,0,1},
            size = {160,120},
            frames = {3}
        },
    },
    scroll = {4,4},
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}