local layer1 = {
    textures = {
        {
            img = "feve/aba_feve f00 c06 8x16.png"
        },
        {
            img = "feve/aba_feve f01 c06 8x16.png"
        },
        {
            img = "feve/aba_feve f02 c06 8x16.png"
        },
        {
            img = "feve/aba_feve f03 c06 8x16.png"
        },
    },
    properties = {
        "coloramafix"
    },
    coloranim = 1
}

local layer2 = {
    textures = {
        {
        }
    },
    alpha = 0.5,
    coloranim = 1
}

local layer3 = {
    textures = {
        {
        }
    },
    alpha = 0.5,
    coloranim = 1,
    properties = {
        "invert"
    }
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

    -- layer 1
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),

    -- layer 2
    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
        BeatMessageCommand = function(self, params)
            local beat = params.beat
            beat = 1 - math.floor(beat % 2)
            self:diffusealpha(beat)
        end
    },

    -- layer 3
    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
        BeatMessageCommand = function(self, params)
            local beat = params.beat
            beat = math.floor(beat % 2)
            self:diffusealpha(beat)
        end
    }
}
