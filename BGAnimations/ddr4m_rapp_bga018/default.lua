local layer1 = {
    textures = {{}},
    effect = "bgdistort4",
    alpha = 0.825,
    properties = {"invert"}
}

local layer2 = {
    textures = {
        {
            img = "rapp/eba_rapp f01 c04 8x8.png",
            properties = {"colorama"}
        },
    },
    effect = "bgmirror2",
    alpha = 7/8,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}