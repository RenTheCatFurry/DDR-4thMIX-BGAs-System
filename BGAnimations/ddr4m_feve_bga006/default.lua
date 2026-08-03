local layer1 = {
    textures = {
        {
        }
    },
    coloranim = 1
}

local layer2 = {
    textures = {
        {
            img = "feve/j99_feve 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        },
        {
            img = "feve/i99_feve 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    scroll = {2,2},
    fadelength = 4,
    properties = {
        "fadeout"
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
        },
    },
    effect = "bgmirror1",
    coloranim = 1
}

local layer4 = {
    textures = {
        {
            img = "feve/hd7_feve 1x4 (stretch).png",
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        },
    },
    effect = "bgmirror1",
    coloranim = 1,
    fadelength = 8,
    fadeoffset = 4,
    properties = {
        "fadelinear"
    }
}

local layer5 = {
    textures = {
        {
            img = "feve/g99_feve blackbg 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    coloranim = 1,
    fadelength = 4
}

local layer6 = {
    textures = {
        {
        }
    }
}

local layer7 = {
    textures = {
        {
        }
    },
    alpha = 0.5
}

local layer8 = {
    textures = {
        {
            img = "feve/aba_feve f01 c01 8x8.png",
            properties = {
                "colorama"
            }
        }
    },
    alpha = 2/3,
    blendmode = "Add"
}

return Def.ActorFrame{
    -- config beat
    OnCommand = function(self)
        local start_beat = GAMESTATE:GetSongPosition():GetSongBeat()

        self:SetUpdateFunction(function(self)
            local beat = GAMESTATE:GetSongPosition():GetSongBeat()

            beat = beat - start_beat
            beat = math.floor(beat / 2) % 8

            MESSAGEMAN:Broadcast("Beat", {beat = beat})
        end)
    end,

    -- layers
    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
        BeatMessageCommand = function(self, params)
            beat = params.beat

            if beat <= 2 then
                self:diffusealpha(1)
            else
                self:diffusealpha(0)
            end
        end
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
        BeatMessageCommand = function(self, params)
            beat = params.beat

            if beat == 0 then
                self:diffusealpha(1)
            else
                self:diffusealpha(0)
            end
        end
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
        BeatMessageCommand = function(self, params)
            beat = params.beat

            if beat == 3 then
                self:diffusealpha(1)
            else
                self:diffusealpha(0)
            end
        end
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer5),
        BeatMessageCommand = function(self, params)
            beat = params.beat

            if beat == 2 or beat == 3 then
                self:diffusealpha(1)
            else
                self:diffusealpha(0)
            end
        end
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer6),
        BeatMessageCommand = function(self, params)
            beat = params.beat

            if beat == 4 or beat == 5 then
                self:diffusealpha(1)
            else
                self:diffusealpha(0)
            end
        end
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer7),
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer8),

        BeatMessageCommand = function(self, params)
            beat = params.beat

            if beat == 6 or beat == 7 then
                self:diffusealpha(1)
            else
                self:diffusealpha(0)
            end
        end
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer4),
        BeatMessageCommand = function(self, params)
            beat = params.beat

            if beat >= 4 and beat <= 5 then
                self:diffusealpha(1)
            else
                self:diffusealpha(0)
            end
        end
    }
}
