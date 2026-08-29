local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort1"
}

local layer2 = {
    textures = {
        {
            img = "toys/fba_toys 2x2 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    effect = "bgdistort7"
}

local layer3 = {
    textures = {
        {
            img = "toys/fba_toys 2x2 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    effect = "bgdooropen"
}

local function ShowOn(...)
    local mask = {}
    for _, v in ipairs({...}) do
        mask[v] = true
    end

    return function(self, params)
        self:visible(mask[params.beat] or false)
    end
end

local show_0_1_2 = ShowOn(0,1,2)
local show_3 = ShowOn(3)

return Def.ActorFrame{
    OnCommand = function(self)
        local start_beat = GAMESTATE:GetSongPosition():GetSongBeat()
        local lastBeat = -1
        local msg = { beat = 0 }

        self:SetUpdateFunction(function(self)
            local current_beat = GAMESTATE:GetSongPosition():GetSongBeat()
            local beat = math.floor(current_beat - start_beat)

            if beat > 4 then beat = 4 end

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
        KeyframeMessageCommand = show_0_1_2
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
        KeyframeMessageCommand = show_3
    }
}