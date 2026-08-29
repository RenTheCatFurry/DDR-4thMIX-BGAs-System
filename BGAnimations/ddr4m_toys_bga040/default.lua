local layer1 = {
    textures = {
        {
        }
    }
}

local blackbg = {
    textures = {
        {
        }
    },
    fadelength = 2,
    properties = {
        "fadelinear",
        "fadestop",
        "blackbg"
    }
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
    effect = "bgdoorclose"
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
    effect = "bgdistort7"
}

local layer4 = {
    textures = {
        {
            img = "toys/g88_toys 5x3 (stretch).png",
            size = {64,64},
            frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14},
            delay = 1/25,
            properties = {
                "framesanim"
            }
        }
    },
    effect = "explodein",
    effectlength = 8,
    effectoffset = -0.25,
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
        local msg = { beat = 0 }

        self:SetUpdateFunction(function(self)
            local current_beat = GAMESTATE:GetSongPosition():GetSongBeat()
            local beat = math.floor(current_beat - start_beat)

            if beat > 1 then beat = 1 end

            if beat ~= lastBeat then
                lastBeat = beat
                msg.beat = beat
                MESSAGEMAN:Broadcast("Keyframe", msg)
            end
        end)
    end,

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", blackbg),
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
        KeyframeMessageCommand = show_0
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer4),
        KeyframeMessageCommand = show_1
    }
}