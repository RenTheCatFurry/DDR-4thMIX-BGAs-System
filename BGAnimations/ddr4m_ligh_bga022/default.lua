local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort4",
    properties = {
        "invert"
    }
}

local layer2 = {
    textures = {
        {
            img = "ligh/f99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {4}
        }
    },
    scroll = {8,4}
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}