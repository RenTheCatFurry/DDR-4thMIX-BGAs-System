local layer1 = {
    textures = {
        {
            img = "dsad/fix000 3x1.png",
            size = {64,64},
            frames = {1,0,1,2},
            delay = 1,
            properties = {"framesbeat"}
        }
    },
    effect = "tilespin",
    effectlength = 8,
    effectstep = 1,
    coloranim = 1
}

local layer2 = {
    textures = {
        {
        }
    },
    effect = "bgdistort1",
    effectlength = 1,
    effectoffset = 0.5,
    effectstep = 0.5,
    blinkalpha = 0.9,
    blendmode = "Add"
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}