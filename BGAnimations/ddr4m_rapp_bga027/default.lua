local layer1 = {
    textures = {{}},
    effect = "bgmirror2",
    coloranim = 2
}

local layer2 = {
    textures = {
        {
            img = "rapp/h77_rapp 5x4 (stretch).png",
            size = {60,60},
            properties = {"framesanim"}
        },
    },
    effect = "pulse",
    effectlength = 2,
    coloranim = 2
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}