local layer1 = {
    textures = {
        {
            img = "toys/g88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14},
            delay = 1/20,
            properties = {
                "framesanim"
            }
        }
    },
    scroll = {8,4},
    coloranim = 2
}

local layer2 = {
    textures = {
        {
        }
    }
}

local layer3 = {
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
    effect = "snailin",
    effectlength = 2
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

    -- layer 1
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),

    -- layer 2
    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
        BeatMessageCommand = function(self, params)
            local beat = params.beat
            beat = beat % 2

            if beat >= 1 then
                self:diffusealpha(1)
            else
                self:diffusealpha(0)
            end
        end
    },

    -- layer 3
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3)
}