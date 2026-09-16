local layer1 = {
    textures = {{}},
    alpha = 0.825
}

local layer2 = {
    textures = {{}},
    alpha = 0.825,
    properties = {"invert"}
}

local layer3 = {
    textures = {
        {
            img = "rapp/f99_rapp f08 c04 8x8.png",
            size = {80,80},
            properties = {"colorama"}
        },
        {
            img = "rapp/f99_rapp f09 c04 8x8.png",
            size = {80,80},
            properties = {"colorama"}
        },
        {
            img = "rapp/f99_rapp f08 c04 8x8.png",
            size = {80,80},
            properties = {"colorama"}
        },
        {
            img = "rapp/f99_rapp f09 c04 8x8.png",
            size = {80,80},
            properties = {"colorama"}
        },
        {
            img = "rapp/f99_rapp f09 c04 8x8.png",
            size = {80,80},
            properties = {"colorama"}
        },
        {
            img = "rapp/f99_rapp f08 c04 8x8.png",
            size = {80,80},
            properties = {"colorama"}
        },
        {
            img = "rapp/f99_rapp f09 c04 8x8.png",
            size = {80,80},
            properties = {"colorama"}
        },
        {
            img = "rapp/f99_rapp f08 c04 8x8.png",
            size = {80,80},
            properties = {"colorama"}
        }
    },
    alpha = 7/8,
    blendmode = "Add"
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

local show_0 = ShowOn(0)
local show_1 = ShowOn(1)

return Def.ActorFrame{
    OnCommand = function(self)
        local start_beat = GAMESTATE:GetSongPosition():GetSongBeat()
        local lastBeat = -1
        local msg = {beat = 0}

        self:SetUpdateFunction(function(self)
            local current_beat = GAMESTATE:GetSongPosition():GetSongBeat()
            local beat = math.floor((current_beat - start_beat)) % 2

            if beat ~= lastBeat then
                lastBeat = beat
                msg.beat = beat
                MESSAGEMAN:Broadcast("Keyframe", msg)
            end
        end)
    end,

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
        KeyframeMessageCommand = show_0
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
        KeyframeMessageCommand = show_1
    },

    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
}