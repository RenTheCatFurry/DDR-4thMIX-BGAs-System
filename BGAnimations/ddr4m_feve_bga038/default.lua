local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort4"
}

local layer2 = {
    textures = {
        {
            img = "feve/f99_feve blackbg 4x3 (stretch).png",
            size = {80,80},
            frames = {4,5,6,7,8,9,10,11},
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        }
    },
    coloranim = 2,
    fadelength = 8,
    properties = {
        "mirror",
        "fadelinear",
        "fadelinearinvert"
    }
}

local layer3 = {
    textures = {
        {
            img = "feve/hd7_feve 1x4 (stretch).png",
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        }
    },
    coloranim = 1,
    effect = "bgmirror1",
    fadelength = 8,
    properties = {
        "fadelinear"
    }
}

local layer4 = {
    textures = {
        {
            img = "feve/hd7_feve 1x4 (stretch).png",
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        }
    },
    coloranim = 1,
    effect = "bgmirror1",
    fadelength = 8,
    properties = {
        "fadelinear",
        "fadeout"
    }
}

local layer5 = {
    textures = {
        {
            img = "feve/c99_feve 4x3 (stretch).png",
            size = {80,80},
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        }
    },
    fadelength = 8,
    properties = {
        "fadelinear",
        "fadelinearinvert",
        "fadeout"
    }
}

return Def.ActorFrame{
    -- config beat
    OnCommand = function(self)
        local start_beat = GAMESTATE:GetSongPosition():GetSongBeat()

        self:SetUpdateFunction(function(self)
            local beat = GAMESTATE:GetSongPosition():GetSongBeat()

            beat = beat - start_beat
            beat = math.floor(beat / 8) % 2

            MESSAGEMAN:Broadcast("Keyframe", {beat = beat})
        end)
    end,

    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer5),
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer4),

        KeyframeMessageCommand = function(self, params)
            local beat = params.beat

            self:diffusealpha(beat)
        end
    }
}