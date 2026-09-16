local layer1 = {
    textures = {{}},
    effect = "bgdistort4",
    alpha = 0.825
}

local layer2 = {
    textures = {
        {
            img = "rapp/g8a_rapp 5x2 (stretch).png",
            size = {64,120},
            frames = {6}
        },
    },
    effect = "tilespin",
    effectlength = 4,
    coloranim = 2,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}