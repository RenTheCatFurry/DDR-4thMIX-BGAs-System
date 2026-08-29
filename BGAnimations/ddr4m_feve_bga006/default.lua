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

-------------------------------------------------------------
-- HELPER DE VISIBILIDAD OPTIMIZADO (Búsqueda en mapa O(1))
-------------------------------------------------------------
local function ShowOn(...)
    local mask = {}
    for _, v in ipairs({...}) do
        mask[v] = true
    end

    return function(self, params)
        self:visible(mask[params.beat] or false)
    end
end

-- Pre-creación de funciones para no regenerarlas
local show_0_1 = ShowOn(0, 1)
local show_0   = ShowOn(0)
local show_1   = ShowOn(1)
local show_2_3 = ShowOn(2, 3)
local show_2   = ShowOn(2)
local show_3   = ShowOn(3)

-------------------------------------------------------------
-- BGANIMATION PRINCIPAL
-------------------------------------------------------------
return Def.ActorFrame{
    OnCommand = function(self)
        local start_beat = GAMESTATE:GetSongPosition():GetSongBeat()
        local lastBeat = -1
        local msg = { beat = 0 } -- Reutilizamos la misma tabla (Zero Allocation)

        self:SetUpdateFunction(function(self)
            local current_beat = GAMESTATE:GetSongPosition():GetSongBeat()
            local beat = math.floor((current_beat - start_beat) * 0.25) % 4

            if beat ~= lastBeat then
                lastBeat = beat
                msg.beat = beat
                MESSAGEMAN:Broadcast("Keyframe", msg)
            end
        end)
    end,

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
        KeyframeMessageCommand = show_0_1
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
        KeyframeMessageCommand = show_0
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer4),
        KeyframeMessageCommand = show_1
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer5),
        KeyframeMessageCommand = show_2_3
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer6),
        KeyframeMessageCommand = show_2
    },

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer7),
        KeyframeMessageCommand = show_3
    }
}