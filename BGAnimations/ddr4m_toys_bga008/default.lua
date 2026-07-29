local layer1 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {8,9,6,7},
            delay = 0,
            properties = {
                "framesseq"
            }
        }
    },
    scroll = {8,2}
}

local layer2 = {
    textures = {
        {
            img = "toys/i88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {9,6,7,8},
            delay = 0,
            properties = {
                "framesseq"
            }
        }
    },
    scroll = {4,2},
    fadelength = 2,
    properties = {
        "fadeout"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),

    Def.Quad{
        OnCommand = function(self)
            self:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
            self:Center()
            self:diffuse(1,1,1,1)
            self:blend("InvertDest")
        end
    }
}
