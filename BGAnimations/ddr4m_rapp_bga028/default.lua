local layer1 = {
    textures = {{}},
    effect = "tilespin",
    effectlength = 4,
}

local layer2 = {
    textures = {
        {
            img = "rapp/f99_rapp f10 c06 8x16.png",
            size = {80,80},
            properties = {"colorama"}
        },
    },
    coloranim = 1,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}