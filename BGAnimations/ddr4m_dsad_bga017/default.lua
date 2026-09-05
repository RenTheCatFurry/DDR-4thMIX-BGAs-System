local layer1 = {
    textures = {
        {
            img = "dsad/e88_dsad 5x3 (stretch).png",
            size = {64,64},
            frames = {4}
        }
    },
    effect = "tilespin",
    effectlength = 4,
    coloranim = 1
}

local blackbg = {
    textures = {{}},
    fadelength = 4,
    properties = {"blackbg"}
}

local layer2 = {
    textures = {
        {
        }
    },
    effect = "bgdistort1",
    effectlength = 4,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", blackbg),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}