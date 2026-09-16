local layer1 = {
    textures = {
        {
            img = "rapp/fix000 (stretch).png",
            size = {40,40}
        }
    },
    scroll = {2,4},
    alpha = 0.35
}

local layer2 = {
    textures = {
        {
            img = "rapp/fix001 15x8.png",
            size = {60,60},
            properties = {"colorama"}
        },
    },
    effect = "particlesdown",
    effectlength = 10,
    blendmode = "Add",
    properties = {"depthopacity"}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}