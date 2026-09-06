local layer1 = {
    textures = {{}},
    fadelength = 2,
    fadeoffset = 0.5
}

local layer2 = {
    textures = {{}},
    fadelength = 2,
    fadeoffset = 0.75
}

local layer3 = {
    textures = {{}},
    fadelength = 2
}

local layer4 = {
    textures = {{}},
    fadelength = 2,
    fadeoffset = 0.25
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
local show_2 = ShowOn(2)
local show_3 = ShowOn(3)

return Def.ActorFrame{Def.Quad{OnCommand=function(self)self:zoomto(6666,6666):diffuse(0,0,0,1)end},
    OnCommand = function(self)
        local start_beat = GAMESTATE:GetSongPosition():GetSongBeat()
        local lastBeat = -1
        local msg = {beat = 0}

        self:SetUpdateFunction(function(self)
            local current_beat = GAMESTATE:GetSongPosition():GetSongBeat()
            local beat = math.floor((current_beat - start_beat) / 1.5) % 4

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

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
        KeyframeMessageCommand = show_2
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer4),
        KeyframeMessageCommand = show_3
    }
}