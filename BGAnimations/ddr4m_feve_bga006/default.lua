local layer1 = {
    textures = {
        {
        }
    },
    coloranim = 1
}

local layer2 = {
    textures = {
        {
            img = "feve/j99_feve 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        },
        {
            img = "feve/i99_feve 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    scroll = {2,2},
    fadelength = 4,
    properties = {
        "fadelinear",
        "fadeout"
    }
}

local layer3 = {
    textures = {
        {
            img = "feve/g99_feve blackbg 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    fadelength = 4,
    properties = {
        "fadelinearinvert"
    }
}

local layer4 = {
    textures = {
        {
            img = "feve/hd7_feve 1x4 (stretch).png",
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        },
    },
    effect = "bgmirror1",
    coloranim = 1,
    fadelength = 4,
    properties = {
        "fadelinear"
    }
}

local layer5 = {
    textures = {
        {
        }
    },
    alpha = 2/3
}

local layer6 = {
    textures = {
        {
            img = "feve/hd7_feve 1x4 (stretch).png",
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        },
    },
    effect = "bgmirror1",
    coloranim = 1,
    fadelength = 8,
    properties = {
        "fadelinear",
        "fadeout"
    }
}

local layer7 = {
    textures = {
        {
            img = "feve/aba_feve f01 c01 8x8.png",
            properties = {
                "colorama"
            }
        }
    },
    alpha = 2/3,
    blendmode = "Add"
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
        KeyframeMessageCommand = ShowOn(0,1)
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
        KeyframeMessageCommand = ShowOn(0)
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer4),
        KeyframeMessageCommand = ShowOn(1)
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer5),
        KeyframeMessageCommand = ShowOn(2,3)
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer6),
        KeyframeMessageCommand = ShowOn(2)
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer7),
        KeyframeMessageCommand = ShowOn(3)
    }
}