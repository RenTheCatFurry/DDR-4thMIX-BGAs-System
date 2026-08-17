local layer1 = {
    textures = {
        {
            img = "ligh/adc_ligh (stretch).png"
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "ligh/cdc_ligh (stretch).png"
        }
    },
    fadelength = 8
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}