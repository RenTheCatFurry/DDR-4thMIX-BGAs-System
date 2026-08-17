local layer1 = {
    textures = {
        {
            img = "ligh/e99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {8,9,10,11},
            delay = 1/15
        }
    },
    coloranim = 3,
    alpha = 7/8
}

local layer2 = {
    textures = {
        {
            img = "ligh/e99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {7}
        }
    },
    effect = "snailin",
    effectlength = 2,
    coloranim = 3,
    blendmode = "Add",
    fadelength = 4,
    fadealpha = 0.25
}

local layer3 = {
    textures = {
        {
            img = "ligh/e99_ligh 4x3 (stretch).png",
            size = {80,80},
            frames = {7}
        }
    },
    effect = "snailin",
    effectlength = 2,
    coloranim = 3,
    blendmode = "Add",
    alpha = 0.125,
    fadelength = 2
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
                (GAMESTATE:GetSongPosition():GetSongBeat() - start_beat) / 2
            ) % 2

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
}