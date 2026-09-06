local layer1 = {
    textures = {{}},
    coloranim = 1,
    alpha = 2/3
}

local layer2 = {
    textures = {
        {
            img = "dsad/h88_dsad 5x3 (stretch).png",
            size = {64,64},
            rgb = {1,0,0},
            frames = {0}
        }
    },
    effect = "tilespin",
    effectlength = 4,
    blendmode = "Add",
    alpha = 0.75,
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}