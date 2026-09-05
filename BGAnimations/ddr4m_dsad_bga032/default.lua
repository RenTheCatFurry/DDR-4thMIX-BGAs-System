local layer1 = {
    textures = {
        {
            img = "dsad/d88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {10}
        }
    },
    effect = "tilespin",
    effectlength = 4,
    coloranim = 3
}

local blackbg = {
    textures = {{}},
    fadelength = 1,
    properties = {
        "blackbg",
        "fadelinearinvert",
        "fadestop",
        "fadeout"
    }
}

local layer2 = {
    textures = {
        {
            img = "dsad/g88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {9}
        }
    },
    effect = "tilespin",
    effectlength = 8,
    coloranim = 1,
    alpha = 0.55,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", blackbg),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}