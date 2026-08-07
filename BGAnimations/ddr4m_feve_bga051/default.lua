local layer1 = {
    textures = {
        {
        }
    },
    effect = "bgdistort7"
}

local layer2 = {
    textures = {
        {
            img = "feve/aba_feve f00 c08 4x4.png"
        },
        {
            img = "feve/aba_feve f01 c08 4x4.png"
        },
        {
            img = "feve/aba_feve f02 c08 4x4.png"
        },
        {
            img = "feve/aba_feve f03 c08 4x4.png"
        }
    },
    blendmode = "Add",
    alpha = 2/3,
    coloranim = 1,
    properties = {
        "coloramafix"
    }
}

return Def.ActorFrame{
    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1),

    Def.Quad{
        OnCommand = function(self)
            self:Center()
            self:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
            self:diffuse(0,0,0,0.25)
        end
    },

    LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer2)
}