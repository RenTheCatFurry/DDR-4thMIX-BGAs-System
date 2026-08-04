local layer1 = {
    textures = {
        {
            img = "feve/g99_feve hsv000 blackbg 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    effect = "bgdistort4"
}
return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
}