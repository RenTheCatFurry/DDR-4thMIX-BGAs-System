local layer1 = {
    textures = {{}}
}

local layer2 = {
    textures = {{img = "toys/bdc_toys (stretch).png"}},
    fadelength = 8,
    properties = {
        "fadelinearinvert",
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}