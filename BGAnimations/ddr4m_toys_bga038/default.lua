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
    local visible = {}

    for _, v in ipairs({...}) do
        visible[v] = true
    end

    return function(self, params)
        local beat = params.beat
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
            )

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
        KeyframeMessageCommand = ShowOn(0,1,2)
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
        KeyframeMessageCommand = ShowOn(3)
    }
}
