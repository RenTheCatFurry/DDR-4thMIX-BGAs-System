local layer1 = {
    textures = {{}},
    effect = "bgdistort7",
    alpha = 0.75
}

local layer2 = {
    textures = {
        {img = "feve/aba_feve f00 c06 8x16"},
        {img = "feve/aba_feve f01 c06 8x16"},
        {img = "feve/aba_feve f02 c06 8x16"},
        {img = "feve/aba_feve f03 c06 8x16"}
    },
    effect = "bgmirror2",
    blendmode = "Add",
    alpha = 2/3,
    properties = {"coloramafix"}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}