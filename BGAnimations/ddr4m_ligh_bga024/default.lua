local layer1 = {
    textures = {
        {
            img = "ligh/e99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {2,4,0,3},
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
            img = "ligh/e99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {4}
        }
    },
    effect = "snailin",
    effectlength = 2
}

local layer3 = {
    textures = {
        {
            img = "ligh/e99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {0}
        }
    },
    effect = "snailin",
    effectlength = 2,
    effectoffset = 3
}

local layer4 = {
    textures = {
        {
            img = "ligh/e99_ligh 4x3 (stretch).png",
            size = {80,80},
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
            img = "ligh/e99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {1}
        }
    },
    effect = "snailin",
    effectlength = 2,
    effectoffset = 1
}

local function ShowOn(...)
    local visible = {}

    for _, v in ipairs({...}) do
        visible[v] = true
    end

    return function(self, params)
        self:visible(visible[params.beat] or false)
    end
end

return Def.ActorFrame{
    OnCommand = function(self)
        local start_beat = GAMESTATE:GetSongPosition():GetSongBeat()
        local lastBeat = -1
        local msg = {}

        self:SetUpdateFunction(function(self)
            local beat = math.floor(
                (GAMESTATE:GetSongPosition():GetSongBeat() - start_beat)
            ) % 4

            if beat ~= lastBeat then
                lastBeat = beat
                msg.beat = beat
                MESSAGEMAN:Broadcast("Keyframe", msg)
            end
        end)
    end,

    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
        KeyframeMessageCommand = ShowOn(0)
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
        KeyframeMessageCommand = ShowOn(1)
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer4),
        KeyframeMessageCommand = ShowOn(2)
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer5),
        KeyframeMessageCommand = ShowOn(3)
    }
}