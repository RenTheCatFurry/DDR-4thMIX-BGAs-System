local layer1 = {
    textures = {
        {
            img = "mero/g55_mero 8x6 (stretch).png",
            properties = {"noframes"}
        }
    }
}

local layer2 = {
    textures = {
        {
            img = "mero/g55_mero 8x6 (stretch).png",
            properties = {"noframes"}
        }
    },
    effect = "bgwarp",
    effectlength = 4
}

local layer3 = {
    textures = {
        {
            img = "mero/f55_mero 8x6 (stretch).png",
            properties = {"noframes"}
        }
    },
    effect = "bgwarpreverse",
    effectlength = 4
}

local layer4 = {
    textures = {
        {
            img = "mero/f55_mero 8x6 (stretch).png",
            properties = {"noframes"}
        }
    }
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
                (GAMESTATE:GetSongPosition():GetSongBeat() - start_beat) / 4
            ) % 4

            if beat ~= lastBeat then
                lastBeat = beat
                msg.beat = beat
                MESSAGEMAN:Broadcast("Keyframe", msg)
            end
        end)
    end,

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
        KeyframeMessageCommand = ShowOn(0)
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
        KeyframeMessageCommand = ShowOn(1)
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
        KeyframeMessageCommand = ShowOn(2)
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer4),
        KeyframeMessageCommand = ShowOn(3)
    },
}