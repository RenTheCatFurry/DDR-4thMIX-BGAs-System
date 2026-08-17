local layer1 = {
    textures = {
        {
            img = "ligh/cdc_ligh (stretch).png"
        }
    },
    effect = "bgdistort4"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}