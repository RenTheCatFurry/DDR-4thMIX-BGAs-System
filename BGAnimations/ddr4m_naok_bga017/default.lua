local layer1 = {
    textures = {
        {
            img = "naok/f88_naok 5x3 (stretch).png",
            size = {64,64},
            frames = {5,6,7,8,9,10,11,12,13,14},
            delay = 1/20,
            properties = {
                "framesanim"
            }
        }
    },
    scroll = {1,0.5},
    alpha = 7/8,
    fadelength = 4,
    properties = {
        "fadeout"
    }
}

local layer2 = {
    textures = {
        {
            img = "naok/f88_naok 5x3 (stretch).png",
            size = {64,64},
            frames = {5,6,7,8,9,10,11,12,13,14},
            delay = 1/20,
            properties = {
                "framesanim"
            }
        }
    },
    scroll = {5,0.5},
    blendmode = "Add",
    alpha = 7/8,
    coloranim = 1
}

local layer3 = {
    textures = {
        {
            img = "naok/f88_naok 5x3 (stretch).png",
            size = {64,64},
            frames = {5,6,7,8,9,10,11,12,13,14},
            delay = 1/20,
            properties = {
                "framesanim"
            }
        }
    },
    scroll = {5,0.5},
    alpha = 7/8,
    fadelength = 4,
    properties = {
        "fadeout"
    }
}

local layer4 = {
    textures = {
        {
            img = "naok/f88_naok 5x3 (stretch).png",
            size = {64,64},
            frames = {5,6,7,8,9,10,11,12,13,14},
            delay = 1/20,
            properties = {
                "framesanim"
            }
        }
    },
    scroll = {1,0.5},
    blendmode = "Add",
    alpha = 7/8,
    coloranim = 1
}

return Def.ActorFrame{
    -- config beat
    OnCommand = function(self)
        local start_beat = GAMESTATE:GetSongPosition():GetSongBeat()

        self:SetUpdateFunction(function(self)
            local beat = GAMESTATE:GetSongPosition():GetSongBeat()
            beat = beat - start_beat
            MESSAAGEMAN:Broadcast("Beat", {beat = beat})
        end)
    end,

    Def.ActorFrame{
        -- Layer 1
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),

        -- Layer 2
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),

        BeatMessageCommand = function(self, params)
            local beat = params.beat
            beat = 1 - math.floor((beat / 4) % 2)
            self:diffusealpha(beat)
        end
    },

    Def.ActorFrame{
        -- Layer 3
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),

        -- Layer 4
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer4),

        BeatMessageCommand = function(self, params)
            local beat = params.beat
            beat = math.floor((beat / 4) % 2)
            self:diffusealpha(beat)
        end
    }
}
