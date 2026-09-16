local layer1 = {
    textures = {{img = "rapp/cd4_rapp (stretch).png"}},
    effect = "bgdistort2",
    coloranim = 1
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}