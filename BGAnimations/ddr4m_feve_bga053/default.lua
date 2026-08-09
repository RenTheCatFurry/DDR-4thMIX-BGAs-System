local layer1 = {
    textures = {
        {
        }
    },
    coloranim = 1,
    effect = "bgdistort8"
}

local blackbg = {
    textures = {
        {
        }
    },
    alpha = 0.5,
    fadelength = 2,
    properties = {
        "blackbg"
    }
}

local layer2 = {
    textures = {
        {
            img = "feve/dba_feve 2x2 (stretch).png",
            frames = {2,1,0},
            delay = 1/15
        }
    },
    effect = "bgmirror2",
    coloranim = 1,
    fadelength = 4,
    fadeoffset = 0.75
}

local layer3 = {
    textures = {
        {
            img = "feve/g99_feve hsv000 blackbg 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    coloranim = 1,
    blendmode = "Add",
    fadelength = 4,
    fadeoffset = 0.25
}

local layer4 = {
    textures = {
        {
            img = "feve/g99_feve hsv000 blackbg 4x3 (stretch).png",
            properties = {
                "noframes"
            }
        }
    },
    coloranim = 1,
    blendmode = "Add",
    fadelength = 4,
    fadeoffset = 0.25,
    effect = "bgdistort8"
}

local layer5 = {
    textures = {
        {
            img = "feve/c99_feve 4x3 (stretch).png",
            size = {80,80},
            delay = 1/15,
            properties = {
                "framesreverse"
            }
        }
    },
    fadelength = 4,
    fadeoffset = 0.25
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
                (GAMESTATE:GetSongPosition():GetSongBeat() - start_beat)
            ) % 8

            if beat ~= lastBeat then
                lastBeat = beat
                msg.beat = beat
                MESSAGEMAN:Broadcast("Keyframe", msg)
            end
        end)
    end,

    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),
        KeyframeMessageCommand = ShowOn(0,1,6,7)
    },
    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", blackbg),
        KeyframeMessageCommand = ShowOn(0,1)
    },
       Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2),
        KeyframeMessageCommand = ShowOn(2,3,4,5)
    },
    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer3),
        KeyframeMessageCommand = ShowOn(0)
    },
    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer4),
        KeyframeMessageCommand = ShowOn(1,2,3)
    },
    Def.ActorFrame{
        LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer5),
        KeyframeMessageCommand = ShowOn(4,5,6,7)
    }
}