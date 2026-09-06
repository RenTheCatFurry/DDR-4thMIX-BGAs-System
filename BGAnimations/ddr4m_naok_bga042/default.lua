local layer1 = {
    textures = {
        {
            img = "naok/jba_naok f03 c07 4x2.png",
            properties = {"colorama"}
        }
    },
    effect = "bgmirror2"
}

local layer2 = {
    textures = {{}},
    effect = "bgdistort7",
    blendmode = "InvertDest"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}