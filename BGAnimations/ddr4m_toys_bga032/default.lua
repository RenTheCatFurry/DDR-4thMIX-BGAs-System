local layer1 = {
    textures = {
        {
            img = "toys/fix001 4x1.png",
            size = {64,64},
            frames = {0,1,2,3},
            delay = 1,
            properties = {
                "framesbeat"
            }
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "toys/fix001 4x1.png",
            size = {64,64},
            frames = {1}
        }
    },
    effect = "snailin",
    effectlength = 2
}

local layer3 = {
    textures = {
        {
            img = "toys/fix001 4x1.png",
            size = {64,64},
            frames = {2}
        }
    },
    effect = "snailin",
    effectlength = 2,
    effectoffset = 3
}

local layer4 = {
    textures = {
        {
            img = "toys/fix001 4x1.png",
            size = {64,64},
            frames = {3}
        }
    },
    effect = "snailin",
    effectlength = 2,
    effectoffset = 2
}

local layer5 = {
    textures = {
        {
            img = "toys/fix001 4x1.png",
            size = {64,64},
            frames = {0}
        }
    },
    effect = "snailin",
    effectlength = 2,
    effectoffset = 1
}

return Def.ActorFrame{
    -- config beat
    OnCommand = function(self)
        local start_beat = GAMESTATE:GetSongPosition():GetSongBeat()

        self:SetUpdateFunction(function(self)
            local beat = GAMESTATE:GetSongPosition():GetSongBeat()

            beat = beat - start_beat
            beat = math.floor(beat % 4)

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
            
            if beat == 0 then
                self:diffusealpha(1)
            else
                self:diffusealpha(0)
            end
        end
    },

    -- layer 3
    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
        BeatMessageCommand = function(self, params)
            local beat = params.beat
            
            if beat == 1 then
                self:diffusealpha(1)
            else
                self:diffusealpha(0)
            end
        end
    },

    -- layer 4
    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer4),
        BeatMessageCommand = function(self, params)
            local beat = params.beat
            
            if beat == 2 then
                self:diffusealpha(1)
            else
                self:diffusealpha(0)
            end
        end
    },
    
    -- layer 5
    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer5),
        BeatMessageCommand = function(self, params)
            local beat = params.beat
            
            if beat == 3 then
                self:diffusealpha(1)
            else
                self:diffusealpha(0)
            end
        end
    },
}