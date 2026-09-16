local layer1 = {
    textures = {{}},
    effect = "bgdistort7",
    alpha = 0.825
}

local layer2 = {
    textures = {
        {
            img = "rapp/eba_rapp f01 c03 8x4.png",
            properties = {"colorama"}
        }
    },
    effect = "bgmirror2",
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}