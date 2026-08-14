local layer1 = {
    textures = {
        {
            img = "feve/g99_feve hsv000 blackbg 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    effect = "bgdistort4"
}

local layer2 = {
    textures = {
        {
            img = "feve/f99_feve blackbg 4x3 (stretch).png",
            size = {80,80},
            frames = {4,5,6,7,8,9,10,11},
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        }
    },
    coloranim = 3,
    fadelength = 8,
    properties = {
        "mirror",
        "fadelinearinvert"
    }
}

local layer3 = {
    textures = {
        {
            img = "feve/hd7_feve 1x4 (stretch).png",
            rgb = {1,0.5,0.5},
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        }
    },
    effect = "bgmirror1",
    fadelength = 8,
    properties = {
        "fadelinear"
    }
}

local layer4 = {
    textures = {
        {
            img = "feve/hd7_feve 1x4 (stretch).png",
            rgb = {1,0.5,0.5},
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        }
    },
    effect = "bgmirror1",
    fadelength = 8,
    properties = {
        "fadelinear",
        "fadeout"
    }
}

local layer5 = {
    textures = {
        {
            img = "feve/c99_feve hsv001 4x3 (stretch).png",
            size = {80,80},
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        }
    },
    fadelength = 8,
    properties = {
        "fadelinearinvert",
        "fadeout"
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
                (GAMESTATE:GetSongPosition():GetSongBeat() - start_beat) / 8
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
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
        KeyframeMessageCommand = ShowOn(0)
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer5),
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer4),
        KeyframeMessageCommand = ShowOn(1)
    }
}