local layer1 = {
    textures = {
        {
            img = "toys/fba_toys 2x2 (stretch).png",
            properties = {
                "noframes"
            }
        }
    }
}

local layer2 = {
    textures = {
        {
        }
    },
    effect = "bgdoorclose"
}

local layer3 = {
    textures = {
        {
        }
    },
    fadelength = 4,
    properties = {
        "fadelinearinvert",
        "fadeout"
    }
}

local layer4 = {
    textures = {
        {
            img = "toys/fba_toys 2x2 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    effect = "bgdoorclose"
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

local show_0_1_3 = ShowOn(0,1,3)
local show_0 = ShowOn(0)
local show_1_2 = ShowOn(1,2)
local show_2 = ShowOn(2)

return Def.ActorFrame{
    OnCommand = function(self)
        local start_beat = GAMESTATE:GetSongPosition():GetSongBeat()
        local lastBeat = -1
        local msg = { beat = 0 }

        self:SetUpdateFunction(function(self)
            local current_beat = GAMESTATE:GetSongPosition():GetSongBeat()
            local beat = math.floor((current_beat - start_beat)) % 4

            if beat ~= lastBeat then
                lastBeat = beat
                msg.beat = beat
                MESSAGEMAN:Broadcast("Keyframe", msg)
            end
        end)
    end,

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
        KeyframeMessageCommand = show_0_1_3
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
        KeyframeMessageCommand = show_0
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
        KeyframeMessageCommand = show_1_2
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer4),
        KeyframeMessageCommand = show_2
    }
}