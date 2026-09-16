local layer1 = {
    textures = {{}}
}

local layer2 = {
    textures = {
        {
            img = "rapp/b87_rapp blackbg 5x4 (stretch).png",
            size = {64,60},
            frames = {0,1,2,3,4,5},
            properties = {"framesanim"}
        },
    },
    effect = "snailin",
    effectlength = 4,
    blinkalpha = 0.92
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}