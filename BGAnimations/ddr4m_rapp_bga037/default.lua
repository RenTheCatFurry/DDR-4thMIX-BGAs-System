local layer1 = {
    textures = {
        {
            img = "rapp/eba_rapp 2x2 (stretch).png",
            frames = {0}
        }
    },
    effect = "bgmirror2",
    coloranim = 1
}

local layer2 = {
    textures = {{}},
    effect = "bgdistort7",
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}