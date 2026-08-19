local p = ...

-- global config
local set_texture_filtering = true
local adj_x_to_center = true

-- global functions
local function has_property(prop, tex)
    if tex then
        if tex.properties then
            for _, v in ipairs(tex.properties) do
                if v == prop then return true end
            end
        end
    end

    if p.properties then
        for _, v in ipairs(p.properties) do
            if v == prop then return true end
        end
    end

    return false
end

local function get_version_date()
    return VersionDate():gsub("%D", "")
end

-- sprites path
local sprites_path = "BGAnimations/_DDR_4thMIX_BGAs_System/"
if get_version_date() > "20160811" then sprites_path = "" end

-- constants
local SCREEN_RATIO = SCREEN_WIDTH / SCREEN_HEIGHT
local DDR_SCREEN_WIDTH = 320
local DDR_SCREEN_HEIGHT = 240
local DDR_SCREEN_RATIO = 4 / 3
local ADJUST_TO_SCREEN_WIDTH = (SCREEN_WIDTH / DDR_SCREEN_WIDTH) * (DDR_SCREEN_RATIO / SCREEN_RATIO)
local ADJUST_TO_SCREEN_HEIGHT = SCREEN_HEIGHT / DDR_SCREEN_HEIGHT

-- layer config
local blink_alpha = p.blinkalpha
local fade_length = p.fadelength
local fade_alpha = p.fadealpha
local fade_offset = p.fadeoffset or 0
local fade_linear = has_property("fadelinear")
local fade_linear_invert = has_property("fadelinearinvert")
local fade_rgb = has_property("fadergb")
local fade_out = has_property("fadeout")
local fade_stop = has_property("fadestop")
local field_of_view = 0
local invert = has_property("invert")
local black_bg = has_property("blackbg")

-- sprites config
local bg_mode = false
local first_texture = p.textures[1]
local load_song_bg = not first_texture.img and not black_bg
local bg_crop_x, bg_crop_y
local stretch_x_res = has_property("stretchxres")
local sprites_in_song_folder = has_property("spritesinsongfolder")

if p.bgcrop then
    bg_mode = true
    bg_crop_x = p.bgcrop[1]
    bg_crop_y = p.bgcrop[2]
end

local sprite_size = {w = 64, h = 64}
if first_texture.size then
    if first_texture.size[1] >= 320 then
        sprite_size.w = SCREEN_WIDTH

        if first_texture.size[2] >= 240 then
            sprite_size.h = SCREEN_HEIGHT
            bg_mode = true
        end

    else
        if stretch_x_res then
            sprite_size.w = SCREEN_WIDTH / (320 / first_texture.size[1])
        else
            sprite_size.w = first_texture.size[1] * ADJUST_TO_SCREEN_WIDTH
        end
    end

    sprite_size.h = first_texture.size[2] * ADJUST_TO_SCREEN_HEIGHT
    
else
    sprite_size.w = SCREEN_WIDTH
    sprite_size.h = SCREEN_HEIGHT
    bg_mode = true
end

-- mesh config
local mesh = {
    cols = math.ceil(SCREEN_WIDTH / sprite_size.w),
    rows = math.ceil(SCREEN_HEIGHT / sprite_size.h)
}
local set_mesh = p.setmesh
local margin = has_property("margin")
local mirror = has_property("mirror")
local blend_mode = p.blendmode or "Normal"
local alpha = p.alpha or 1
local num_textures = #p.textures
local num_sprites = mesh.cols * mesh.rows
local align_center = false
local color_anim = p.coloranim
local depth_opacity = has_property("depthopacity")
local colorama_fix = has_property("coloramafix")

local function update_mesh(x, y)
    mesh.cols = x
    mesh.rows = y
    num_sprites = mesh.cols * mesh.rows
end

-- scroll config
local scroll_active = false
local scroll_intercalate = has_property("scrollintercalate")
local scroll_dir, scroll_length
local scroll_bg_crop = false

if p.scroll then
    scroll_dir = p.scroll[1]
    scroll_length = p.scroll[2]
end

if
bg_mode and
num_textures == 1 and
color_anim and
color_anim ~= 1 and
(
    scroll_dir == 2 or
    scroll_dir == 4 or
    scroll_dir == 6 or
    scroll_dir == 8
)
then
    scroll_bg_crop = true
end

-- effect config
local effect = p.effect or ""
local effect_length = p.effectlength or 1
local effect_step = p.effectstep
local effect_offset = p.effectoffset or 0
local spin_length = p.spinlength
local effect_half = has_property("effecthalf")
local effect_pingpong = has_property("effectpingpong")

-- activate effects
local wagpulse_effect = false
local particles_effect = false
local snail_effect = false
local spiral_effect = false
local explode_effect = false
local misc_effect = false
local tilespin_effect = false
local bgmirror_effect = false
local bgwarp_effect = false
local bgdistort_effect = false
local bgdoor_effect = false
local kaleidoscope2_effect = false

if
effect == "wagx" or
effect == "wagy" or
effect == "pulse"
then
    wagpulse_effect = true
    align_center = true

elseif
effect == "particlesin" or
effect == "particlesbouncein" or
effect == "particleslaserin" or
effect == "particlesout" or
effect == "particlesbounceout" or
effect == "particleslaserout" or
effect == "particlesleft" or
effect == "particlesright" or
effect == "particlesup" or
effect == "particlesdown"
then
    particles_effect = true
    align_center = true

    if
    effect == "particlesin" or
    effect == "particlesbouncein" or
    effect == "particleslaserin" or
    effect == "particlesout" or
    effect == "particlesbounceout" or
    effect == "particleslaserout"
    then
        num_sprites = 32
    end

elseif
effect == "snailin" or
effect == "snailinreverse" or
effect == "snailout" or
effect == "snailoutreverse"
then
    snail_effect = true

elseif
effect == "spiral1in" or
effect == "spiral1out" or
effect == "spiral2in" or
effect == "spiral2out" or
effect == "vortexin" or
effect == "vortexout"
then
    spiral_effect = true
    align_center = true
    num_sprites = 32

elseif
effect == "explodein" or
effect == "explodeinspin" or
effect == "explodeout" or
effect == "explodeoutspin"
then
    explode_effect = true
    align_center = true

elseif
effect == "dvdbounce" or
effect == "scrollxy"
then
    misc_effect = true
    num_sprites = math.floor(num_sprites * 3 / 5)

elseif effect == "tilespin" then
    tilespin_effect = true
    align_center = true
    num_sprites = 48

elseif effect == "bgmirror1" or effect == "bgmirror2" then
    bgmirror_effect = true
    bg_mode = true
    num_sprites = 48

elseif effect == "bgwarp" or effect == "bgwarpreverse" then
    bgwarp_effect = true
    bg_mode = true
    num_sprites = 2

elseif
effect == "bgdistort1" or
effect == "bgdistort2" or
effect == "bgdistort3" or
effect == "bgdistort4" or
effect == "bgdistort5" or
effect == "bgdistort6" or
effect == "bgdistort7" or
effect == "bgdistort8"
then
    bgdistort_effect = true
    bg_mode = true
    num_sprites = 1

elseif effect == "bgdooropen" or effect == "bgdoorclose" then
    bgdoor_effect = true
    bg_mode = true
    num_sprites = 4

elseif effect == "kaleidoscope2" then
    kaleidoscope2_effect = true
    bg_mode = true
    num_sprites = 90
end

-- config mesh for static effects
if set_mesh or margin or bg_crop_x then
    align_center = true

    if set_mesh then
        update_mesh(set_mesh[1], set_mesh[2])

    elseif bg_crop_x then
        update_mesh(bg_crop_x, bg_crop_y)
    end
end

-- field of view (for particle and spiral effects)
if particles_effect or spiral_effect then
    if
    effect ~= "particlesleft" or
    effect ~= "particlesright" or
    effect ~= "particlesup" or
    effect ~= "particlesdown"
    then
        field_of_view = 166
    end
end

-- activate scroll
local add_more_cols = false
if p.scroll then
    scroll_active = true

    local add_cols = 1
    local add_rows = 1
    local tex_has_2_frames = false
    local tex_frames_in_seq = has_property("framesseq", first_texture)

    if first_texture.frames then
        if #first_texture.frames == 2 and tex_frames_in_seq then
            tex_has_2_frames = true
        end
    end

    if num_textures == 2 or (num_textures == 1 and tex_has_2_frames) then
        if mesh.cols % 2 == 0 then
            add_more_cols = true
            add_cols = 2
        end

        if mesh.rows % 2 == 0 then
            add_rows = 2
        end
    end

    if scroll_bg_crop then
        if scroll_dir == 2 or scroll_dir == 6 then
            update_mesh(4,4)
        elseif scroll_dir == 4 or scroll_dir == 8 then
            update_mesh(5,3)
        end
    else
        update_mesh(
            mesh.cols + add_cols,
            mesh.rows + add_rows
        )
    end
end

-- song background
local song_bg_tex
local song_bg_aft
local song_bg_path = GAMESTATE:GetCurrentSong():GetBackgroundPath()
local song_has_bg = GAMESTATE:GetCurrentSong():HasBackground()

if not song_has_bg then
    song_bg_path = "ddr4m.png"
end

if load_song_bg then
    bg_mode = true

    song_bg_aft = Def.ActorFrameTexture{
        InitCommand = function(self)
            song_bg_tex = self

            self:SetWidth(SCREEN_WIDTH)
            self:SetHeight(SCREEN_HEIGHT)
            self:EnableAlphaBuffer(true)
            self:Create()
        end,
        
        -- layer 1 (black background)
        Def.Quad{
            OnCommand = function(self)
                self:Center()
                self:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
                self:diffuse(0,0,0,1)
            end
        },

        -- layer 2 (song background fill)
        Def.Sprite{
            Texture = song_bg_path,

            OnCommand = function(self)
                if song_has_bg then
                    self:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
                    self:Center()
                    
                else
                    self:diffusealpha(0)
                end
            end
        },

        -- layer 3 (song background)
        Def.Sprite{
            Texture = song_bg_path,

            OnCommand = function(self)
                if song_has_bg then
                    self:scale_or_crop_background()
                    self:Center()
                else
                    self:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
                end
            end
        },

        -- layer 4 (invert background colors)
        Def.Quad{
            OnCommand = function(self)
                if invert then
                    self:Center()
                    self:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT)
                    self:diffuse(1,1,1,1)
                    self:blend("InvertDest")

                else
                    self:diffusealpha(0)
                end
            end
        }
    }
end

-- colorama fix (for sprites like "aba_feve" or "i99_ligh" for example)
local colorama_fix_tex
local colorama_fix_aft

if colorama_fix then
    bg_mode = true

    colorama_fix_aft = Def.ActorFrameTexture{
        InitCommand = function(self)
            colorama_fix_tex = self

            self:SetWidth(SCREEN_WIDTH)
            self:SetHeight(SCREEN_HEIGHT)
            self:EnableAlphaBuffer(true)
            self:Create()
        end,
    }

    for i = 1, 4 do
        local colorama_tex
        
        if sprites_in_song_folder then
            colorama_tex = p.textures[i].img
        else
            colorama_tex = sprites_path..p.textures[i].img
        end

        colorama_fix_aft[#colorama_fix_aft + 1] = Def.Sprite{
            Texture = p.textures[i].img,

            OnCommand = function(self)
                if i == 1 then
                    self:x(SCREEN_WIDTH / 4)
                    self:y(SCREEN_HEIGHT / 4)
                end

                if i == 2 then
                    self:x(SCREEN_WIDTH * 3 / 4)
                    self:y(SCREEN_HEIGHT / 4)
                end

                if i == 3 then
                    self:x(SCREEN_WIDTH / 4)
                    self:y(SCREEN_HEIGHT * 3 / 4)
                end

                if i == 4 then
                    self:x(SCREEN_WIDTH * 3 / 4)
                    self:y(SCREEN_HEIGHT * 3 / 4)
                end

                self:SetTextureFiltering(set_texture_filtering)
                self:zoomto(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
                self:SetAllStateDelays(1 / 30)
                self:effectclock("music")
            end
        }
    end
end

-- sprite in general
local function load_sprite(i, tex)
    local size_per_sprite = {w = 64, y = 64}

    if tex.size then
        -- size per sprite
        if stretch_x_res then
            size_per_sprite.w = SCREEN_WIDTH / (320 / tex.size[1])
        else
            size_per_sprite.w = tex.size[1] * ADJUST_TO_SCREEN_WIDTH
        end

        size_per_sprite.h = tex.size[2] * ADJUST_TO_SCREEN_HEIGHT

        if tex.size[1] >= 320 then
            size_per_sprite.w = SCREEN_WIDTH
            sprite_size.w = SCREEN_WIDTH
        end

        -- custom size per effect
        local ratio = size_per_sprite.w / size_per_sprite.h

        if spiral_effect or tilespin_effect then
            -- set size
            local size
            local condition

            if spiral_effect then
                size = 110

                if effect == "spiral2in" or effect == "spiral2out" then
                    size = 125
                end

                condition = ratio >= 1
            end

            if tilespin_effect then
                local sprite_zoom = (SCREEN_RATIO * (3 / 4))

                if SCREEN_RATIO <= 1 then
                    sprite_zoom = (SCREEN_RATIO * (4 / 3))
                end

                size = 58 * sprite_zoom

                condition = ratio <= 1
            end

            -- adjust sprite size
            if condition then
                size_per_sprite.w = size * ADJUST_TO_SCREEN_HEIGHT
                size_per_sprite.h = (size / ratio) * ADJUST_TO_SCREEN_HEIGHT
            else
                size_per_sprite.w = (size * ratio) * ADJUST_TO_SCREEN_HEIGHT
                size_per_sprite.h = size * ADJUST_TO_SCREEN_HEIGHT
            end
        end

    else
        size_per_sprite.w = SCREEN_WIDTH
        size_per_sprite.h = SCREEN_HEIGHT
    end

    local states = {}

    local delay = 1 / 10
    if tex.delay then delay = tex.delay end

    local rgb = {1, 1, 1}
    if tex.rgb then rgb = {tex.rgb[1], tex.rgb[2], tex.rgb[3]} end

    local glow = {1, 1, 1, 0}
    if tex.glow then glow = {tex.glow[1], tex.glow[2], tex.glow[3], tex.glow[4]} end

    local no_frames = has_property("noframes", tex)
    local frames_seq = has_property("framesseq", tex)
    local frames_anim = has_property("framesanim", tex)
    local frames_beat = has_property("framesbeat", tex)
    local frames_reverse = has_property("framesreverse", tex)
    local colorama = has_property("colorama", tex)

    local tex_to_load
    if not load_song_bg then 
        if sprites_in_song_folder then
            tex_to_load = tex.img
        else
            tex_to_load = sprites_path..tex.img
        end
    end

    return Def.Sprite{
        Texture = tex_to_load,
        
        OnCommand = function(self)
            -- load texture
            if load_song_bg then
                self:SetTexture(song_bg_tex:GetTexture())
                self:SetTextureFiltering(true)

            elseif colorama_fix then
                self:SetTexture(colorama_fix_tex:GetTexture())
                self:SetTextureFiltering(set_texture_filtering)
            
            else
                self:SetTextureFiltering(set_texture_filtering)
            end

            -- set frames
            if not load_song_bg and not colorama_fix then
                local num_frames = self:GetTexture():GetNumFrames()
                if tex.frames then
                    if frames_reverse then
                        for j = #tex.frames, 1, -1 do
                            states[#states + 1] = { Frame = tex.frames[j] }
                        end

                    else
                        for _, v in ipairs(tex.frames) do
                            states[#states + 1] = { Frame = v }
                        end
                    end

                else
                    if frames_reverse then
                        for j = 0, num_frames - 1 do
                            local frame = num_frames - j - 1
                            states[#states + 1] = { Frame = frame }
                        end

                    else
                        for j = 0, num_frames - 1 do
                            states[#states + 1] = { Frame = j }
                        end
                    end
                end

                self:SetStateProperties(states)

            else
                self:SetStateProperties({ { Frame = 0 } })
            end

            -- zoom
            self:zoomto(size_per_sprite.w, size_per_sprite.h)

            -- if "no frames" property is activated
            if no_frames then
                self:customtexturerect(0,0,1,1)
            end

            -- background mirror effect crops
            if bgmirror_effect then
                -- vertical crop
                if i < 24 then
                    self:croptop(math.floor(i / 8) / 3)
                    self:cropbottom((2 - math.floor(i / 8)) / 3)

                else
                    self:rotationx(180)
                    self:y(SCREEN_HEIGHT)

                    self:cropbottom(math.floor((i - 24) / 8) / 3)
                    self:croptop((2 - math.floor((i - 24) / 8)) / 3)
                end

                -- horizontal crop
                if effect == "bgmirror1" then
                    self:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT / 2)

                    self:cropleft((i % 8) / 8)
                    self:cropright((7 - (i % 8)) / 8)
                
                else
                    self:zoomto(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)

                    if math.floor(i / 4) % 2 == 0 then
                        self:cropleft((i % 4) / 4)
                        self:cropright((3 - (i % 4)) / 4)
                    else
                        self:x(SCREEN_WIDTH)
                        self:rotationy(180)

                        self:cropright((i % 4) / 4)
                        self:cropleft((3 - (i % 4)) / 4)
                    end
                end
            end

            -- background crops
            if bg_crop_x then
                -- horizontal crop
                self:cropright((mesh.cols - (i % mesh.cols) - 1) / mesh.cols)
                self:cropleft((i % mesh.cols) / mesh.cols)
                self:halign((((i % mesh.cols) * 2) + 1) / (mesh.cols * 2))

                -- vertical crop
                self:cropbottom((mesh.rows - math.floor(i / mesh.cols) - 1) / mesh.rows)
                self:croptop(math.floor(i / mesh.cols) / mesh.rows)
                self:valign(((math.floor(i / mesh.cols) * 2) + 1) / (mesh.rows * 2))
            
            elseif bgdoor_effect then
                if i == 0 then
                    self:cropright(0.5)
                    self:cropbottom(0.5)
                end

                if i == 1 then
                    self:cropleft(0.5)
                    self:cropbottom(0.5)
                end

                if i == 2 then
                    self:cropright(0.5)
                    self:croptop(0.5)
                end

                if i == 3 then
                    self:cropleft(0.5)
                    self:croptop(0.5)
                end
            end

            -- anchor point
            if not align_center then self:halign(0):valign(0) end

            if tilespin_effect and bg_mode then
                if not tex.size then
                    self:halign(1/8):valign(1/6)
                end
            end

            -- mirror
            if mirror then
                if i % 2 == 1 then
                    self:rotationy(180)
                    if not align_center then self:x(size_per_sprite.w) end
                end
            end

            -- rgb channels
            self:diffuse(rgb[1], rgb[2], rgb[3], alpha)

            -- rgb channels (glow)
            self:glow(glow[1], glow[2], glow[3], glow[4])

            -- blend mode
            self:blend(blend_mode)

            -- frames delay config (doesn't refresh when BGAnimation changes)
            if not frames_beat then
                if colorama then
                    self:SetAllStateDelays(1 / 30)
                    
                else
                    self:SetAllStateDelays(delay)

                    if frames_seq then
                        self:setstate(i % #states)

                    elseif frames_anim then
                        local iterator = i

                        if i % 2 == 1 then
                            iterator = num_sprites - i
                        end

                        self:SetAllStateDelays(delay / (iterator / (num_sprites * 2) + 1))
                    end
                end

                self:effectclock("music")
            end
        end,

        BeatMessageCommand = function(self, params)
            local beat = params.beat

            -- frames delay config (does refresh when BGAnimation changes)
            if frames_beat then
                -- frames config
                if frames_seq then
                    self:setstate(math.floor(i + beat / delay) % #states)

                elseif frames_anim then
                    local iterator = i

                    if i % 2 == 1 then
                        iterator = num_sprites - i
                    end

                    self:setstate(math.floor((beat / delay) / (iterator / (num_sprites * 2) + 1)) % #states)
                
                else
                    self:setstate(math.floor(beat / delay) % #states)
                end
            end

            -- background warp animation
            if bgwarp_effect then
                -- beat config
                local beat_bgwarp = (beat % effect_length) / effect_length

                if effect_step then
                    beat_bgwarp = (math.floor(beat / effect_step) / effect_length * effect_step) % 1
                end

                if effect_pingpong then
                    beat_bgwarp = beat_bgwarp * 2

                    if beat_bgwarp > 1 then
                        beat_bgwarp = 1 - (-1 + beat_bgwarp)
                    end
                end

                if effect == "bgwarpreverse" then
                    beat_bgwarp = 1 - beat_bgwarp
                end

                if effect_half then
                    beat_bgwarp = beat_bgwarp / 2
                end

                -- animation
                if i == 0 then
                    self:valign(0)
                    self:zoomto(SCREEN_WIDTH, SCREEN_HEIGHT ^ 2)

                    self:cropbottom(1 - beat_bgwarp)
                    self:y(beat_bgwarp * ((-SCREEN_HEIGHT ^ 2) + SCREEN_HEIGHT))

                else
                    self:croptop(beat_bgwarp)
                end
            end
        end
    }
end

-- background distort ActorMultiVertex
local bgdistort_amv

if bgdistort_effect then
    -------------------------------------------------------------
    -- FLYWEIGHT / MEMORIA ESTÁTICA Y LOOKUP TABLES
    -------------------------------------------------------------
    local vertices = {}
    
    -- Mapeo optimizado de punteros directos a los vértices para la animación
    local vertex_pointers = {}

    -- Malla estática de índices (extraída del código original)
    local VERT_INDICES = {
        {3,8,34,37},   {7,12,38,41},  {11,16,42,45}, {15,20,46,49}, {19,24,50,53}, {23,28,54,57}, {27,32,58,61},
        {35,40,66,69}, {39,44,70,73}, {43,48,74,77}, {47,52,78,81}, {51,56,82,85}, {55,60,86,89}, {59,64,90,93},
        {67,72,98,101},{71,76,102,105},{75,80,106,109},{79,84,110,113},{83,88,114,117},{87,92,118,121},{91,96,122,125},
        {99,104,130,133},{103,108,134,137},{107,112,138,141},{111,116,142,145},{115,120,146,149},{119,124,150,153},{123,128,154,157},
        {131,136,162,165},{135,140,166,169},{139,144,170,173},{143,148,174,177},{147,152,178,181},{151,156,182,185},{155,160,186,189}
    }

    -- Valores aleatorios pregenerados (Flyweight)
    local random_values = {}
    for i = 1, 35 do
        local values_per_vert = {}
        for j = 1, 8 do
            values_per_vert[j] = 0.5 - (math.random(0,100) / 100)
        end
        random_values[i] = values_per_vert
    end

    -------------------------------------------------------------
    -- INICIALIZACIÓN DE LA MALLA (1 Sola vez)
    -------------------------------------------------------------
    local function init_mesh(tex_width, tex_height)
        if not tex_width or tex_width == 0 then tex_width = SCREEN_WIDTH end
        if not tex_height or tex_height == 0 then tex_height = SCREEN_HEIGHT end

        local adjust_u = (load_song_bg or colorama_fix) and (SCREEN_WIDTH / tex_width) or 1
        local adjust_v = (load_song_bg or colorama_fix) and (SCREEN_HEIGHT / tex_height) or 1

        vertices = {}

        local function add_quad(x1, y1, x2, y2)
            local idx = #vertices
            vertices[idx + 1] = { {SCREEN_WIDTH * x1 / 8, SCREEN_HEIGHT * y1 / 6, 0}, {1,1,1,1}, {x1 / 8 * adjust_u, y1 / 6 * adjust_v} }
            vertices[idx + 2] = { {SCREEN_WIDTH * x2 / 8, SCREEN_HEIGHT * y1 / 6, 0}, {1,1,1,1}, {x2 / 8 * adjust_u, y1 / 6 * adjust_v} }
            vertices[idx + 3] = { {SCREEN_WIDTH * x2 / 8, SCREEN_HEIGHT * y2 / 6, 0}, {1,1,1,1}, {x2 / 8 * adjust_u, y2 / 6 * adjust_v} }
            vertices[idx + 4] = { {SCREEN_WIDTH * x1 / 8, SCREEN_HEIGHT * y2 / 6, 0}, {1,1,1,1}, {x1 / 8 * adjust_u, y2 / 6 * adjust_v} }
        end

        for row = 0, 5 do
            for col = 0, 7 do
                add_quad(col, row, col + 1, row + 1)
            end
        end

        -- Crear tabla de punteros directos para acceso O(1) ultra rápido durante la animación
        vertex_pointers = {}
        for vert_idx = 1, #VERT_INDICES do
            vertex_pointers[vert_idx] = {}
            for _, i in ipairs(VERT_INDICES[vert_idx]) do
                table.insert(vertex_pointers[vert_idx], vertices[i][1]) -- Guardamos la referencia de posición {x, y, z}
            end
        end
    end

    -------------------------------------------------------------
    -- ANIMACIÓN MUTABLE ULTRA RÁPIDA
    -------------------------------------------------------------
    local function anim_vertices(vert, x, y)
        local col = ((vert - 1) % 7) + 1
        local row = math.floor((vert - 1) / 7) + 1

        local px = SCREEN_WIDTH / 8 * col + x
        local py = SCREEN_HEIGHT / 6 * row + y

        -- Actualización directa sin bucles complejos ni re-indexación
        local ptrs = vertex_pointers[vert]
        if ptrs then
            ptrs[1][1] = px; ptrs[1][2] = py
            ptrs[2][1] = px; ptrs[2][2] = py
            ptrs[3][1] = px; ptrs[3][2] = py
            ptrs[4][1] = px; ptrs[4][2] = py
        end
    end

    -- ActorMultiVertex for the background distort effects
    bgdistort_amv = Def.ActorMultiVertex{
        Texture = first_texture.img,

        InitCommand = function(self)
            self:SetDrawState{Mode = "DrawMode_Quads"}
        end,

        OnCommand = function(self)
            if load_song_bg and song_bg_tex then
                self:SetTexture(song_bg_tex:GetTexture())
                self:SetTextureFiltering(true)
            elseif colorama_fix and colorama_fix_tex then
                self:SetTexture(colorama_fix_tex:GetTexture())
                self:SetTextureFiltering(set_texture_filtering or false)
            end

            local tex = self:GetTexture()
            if tex then
                init_mesh(tex:GetTextureWidth(), tex:GetTextureHeight())
                self:SetVertices(vertices)
            end

            -- Blend mode y colores
            self:blend(blend_mode)
            if first_texture.rgb then
                local rgb = first_texture.rgb
                self:diffuse(rgb[1], rgb[2], rgb[3], alpha)
            else
                self:diffuse(1,1,1,alpha)
            end

            if first_texture.glow then
                local glow = first_texture.glow
                self:glow(glow[1], glow[2], glow[3], glow[4])
            end
        end,

        -- effects code
        BeatMessageCommand = function(self, params)
            -- beat config
            local beat = params.beat

            local max_beat = 1
            if effect == "bgdistort8" then max_beat = 16 end

            if effect_step then
                beat = (math.floor((
                    beat + effect_offset
                ) / effect_step) / effect_length * effect_step) % max_beat

            else
                beat = ((
                    beat + effect_offset
                ) / effect_length) % max_beat
            end

            -- background distort effects
            if effect == "bgdistort1" then
                for i = 1, 35 do
                    anim_vertices(
                        i,
                        math.sin(math.rad(((beat + ((1 / 17.5) * i)) % 1) * 360)) * (SCREEN_WIDTH / 40),
                        math.cos(math.rad(((beat + ((1 / 17.5) * i)) % 1) * 360)) * (SCREEN_HEIGHT / 30)
                    )
                end
            
            elseif effect == "bgdistort2" then
                for i = 1, 35 do
                    anim_vertices(
                        i,
                        math.sin(math.rad(180 + ((beat + ((1 / 70) * i)) % 1) * 360)) * (SCREEN_WIDTH / 12),
                        0
                    )
                end

            elseif effect == "bgdistort3" then
                for i = 1, 35 do
                    anim_vertices(
                        i,
                        math.sin(math.rad(((beat + ((1 / 87.5) * i)) % 1) * 360)) * (SCREEN_WIDTH / 40),
                        math.sin(math.rad(((beat + ((1 / 87.5) * i)) % 1) * 360)) * (SCREEN_HEIGHT / 40)
                    )
                end

            elseif effect == "bgdistort4" then
                for i = 1, 35 do
                    local col = (((i - 1) % 7) + 1) / 2

                    anim_vertices(
                        i,
                        math.sin(math.rad(((beat + (col / 7)) % 1) * 360)) * (SCREEN_WIDTH / 32),
                        math.sin(math.rad(((beat + (col / 7)) % 1) * 360)) * (SCREEN_HEIGHT / 64)
                    )
                end

            elseif effect == "bgdistort5" then
                local center_x = SCREEN_WIDTH  / 2
                local center_y = SCREEN_HEIGHT / 2
                local max_radius = math.sqrt(center_x * center_x + center_y * center_y)

                local function anim_spin(vert)
                    local col = ((vert - 1) % 7) + 1
                    local row = math.floor((vert - 1) / 7) + 1

                    local px = SCREEN_WIDTH  / 8 * col
                    local py = SCREEN_HEIGHT / 6 * row

                    local dx = px - center_x
                    local dy = py - center_y

                    local radius = math.sqrt(dx * dx + dy * dy)

                    local influence = 1 - radius / max_radius

                    influence = influence * influence

                    local twist = math.sin(
                        ((beat * 2) * math.pi) % 360
                    ) * influence * math.rad(70)

                    local s = math.sin(twist)
                    local c = math.cos(twist)

                    local nx = dx * c - dy * s
                    local ny = dx * s + dy * c

                    anim_vertices(
                        vert,
                        nx - dx,
                        ny - dy
                    )
                end

                for i = 2,34 do
                    anim_spin(i)
                end
            
            elseif effect == "bgdistort6" then
                local coord_x = (SCREEN_WIDTH / 48) * math.sin(math.rad((beat * 360) % 360))
                local coord_y = (SCREEN_HEIGHT / 36) * math.sin(math.rad((beat * 360) % 360))

                local offsets = {
                    { 1.25,  0.75}, {-0.25, -0.25}, {-0.40, -0.90}, { 0.00, -1.25}, { 0.40, -0.90}, { 0.25, -0.25}, {-1.25,  0.75},
                    { 0.30,  0.15}, {-0.90, -0.35}, {-1.00, -1.00}, { 0.00, -1.25}, { 1.00, -1.00}, { 0.90, -0.35}, {-0.30,  0.15},
                    { 0.00,  0.00}, {-1.20,  0.00}, {-1.35,  0.00}, { 0.00,  0.00}, { 1.35,  0.00}, { 1.20,  0.00}, { 0.00,  0.00},
                    { 0.30, -0.15}, {-0.90,  0.35}, {-1.00,  1.00}, { 0.00,  1.25}, { 1.00,  1.00}, { 0.90,  0.35}, {-0.30,  0.15},
                    { 1.25, -0.75}, {-0.25,  0.25}, {-0.40,  0.90}, { 0.00,  1.25}, { 0.40,  0.90}, { 0.25,  0.25}, {-1.25, -0.75}
                }

                for vert = 1, #offsets do
                    anim_vertices(
                        vert,
                        coord_x * offsets[vert][1],
                        coord_y * offsets[vert][2]
                    )
                end
            
            elseif effect == "bgdistort7" then
                local function get_delay(vert)
                    local x = ((vert - 1) % 7) + 1
                    local y = math.floor((vert - 1) / 7) + 1

                    local dx = x - 4
                    local dy = y - 3

                    return math.sqrt(dx * dx + dy * dy) * 0.12
                end

                local offsets = {
                    { 0.00,  0.00}, {-0.25, -0.25}, {-0.40, -0.90}, { 0.00, -1.25}, { 0.40, -0.90}, { 0.25, -0.25}, { 0.00,  0.00},
                    { 0.00,  0.00}, {-0.90, -0.35}, {-1.00, -1.00}, { 0.00, -1.25}, { 1.00, -1.00}, { 0.90, -0.35}, { 0.00,  0.00},
                    { 0.00,  0.00}, {-1.20,  0.00}, {-1.35,  0.00}, { 0.00,  0.00}, { 1.35,  0.00}, { 1.20,  0.00}, { 0.00,  0.00},
                    { 0.00,  0.00}, {-0.90,  0.35}, {-1.00,  1.00}, { 0.00,  1.25}, { 1.00,  1.00}, { 0.90,  0.35}, { 0.00,  0.00},
                    { 0.00,  0.00}, {-0.25,  0.25}, {-0.40,  0.90}, { 0.00,  1.25}, { 0.40,  0.90}, { 0.25,  0.25}, { 0.00,  0.00}
                }

                for vert = 1, 35 do
                    local phase = beat - get_delay(vert)
                    local wave = math.sin(phase * math.pi * 2)

                    local coord_x = (SCREEN_WIDTH / 100) * wave
                    local coord_y = (SCREEN_HEIGHT / 75) * wave

                    anim_vertices(
                        vert,
                        coord_x * offsets[vert][1],
                        coord_y * offsets[vert][2]
                    )
                end

            elseif effect == "bgdistort8" then
                local function anim_controller(values, speed)
                    local beat_speed = beat * speed
                    local keyframe = beat_speed % #values

                    local value1, value2

                    for j = 0, #values - 1 do
                        if keyframe >= j and keyframe <= j + 1 then
                            value1 = values[j + 1]
                            value2 = values[(j + 1) % #values + 1]
                        end
                    end

                    return (value1 + ((beat_speed % 1) * (value2 - value1)))
                end

                local vert_keyframes = {
                    anim_controller({
                        1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
                        1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1
                    }, 24),

                    anim_controller({
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1
                    }, 24),

                    anim_controller({
                        0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,
                        1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,1,1,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,
                        1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        1,1,1,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,1,1,1,1,1,1,1,
                        1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
                        1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,
                        1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                    }, 24),

                    anim_controller({
                        1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1
                    }, 24),

                    anim_controller({
                        0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,
                        1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,
                        1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,
                        1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,
                        1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),
                    
                    anim_controller({
                        0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0
                    }, 24),
                    
                    anim_controller({
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,
                        1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,
                        1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,1,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
                        1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,
                        1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,
                        1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,
                        1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,
                        1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,
                        1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,
                        1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,
                        1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,
                        1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
                        1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,
                        0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
                        1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24),

                    anim_controller({
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                        0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                        1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    }, 24)
                }

                for i = 1, 35 do
                    anim_vertices(
                        i,
                        (SCREEN_WIDTH/48 * 0.75) * anim_controller(random_values[i], 10) * vert_keyframes[i],
                        (SCREEN_HEIGHT/32 * 0.75) * anim_controller(random_values[36 - i], 10) * vert_keyframes[i]
                    )
                end
            end

            self:SetVertices(vertices)
        end
    }
end

-- background scroll crop
local scroll_bg_crop_tex
local scroll_bg_crop_aft

if scroll_bg_crop then
    scroll_bg_crop_aft = Def.ActorFrameTexture{
        InitCommand = function(self)
            scroll_bg_crop_tex = self

            if scroll_dir == 2 or scroll_dir == 6 then
                self:SetWidth(SCREEN_WIDTH)
                self:SetHeight(SCREEN_HEIGHT * 4 / 3)
            else
                self:SetWidth(SCREEN_WIDTH * 5 / 4)
                self:SetHeight(SCREEN_HEIGHT)
            end

            self:EnableAlphaBuffer(true)
            self:Create()
        end,

        Def.ActorFrame{
            load_sprite(0, first_texture),

            BeatMessageCommand = function(self, params)
                local beat = params.beat
                beat = (beat / scroll_length) % 1

                -- vertical scroll
                if scroll_dir == 2 then
                    self:y(-math.floor(beat * 3) * (SCREEN_HEIGHT / 3))

                elseif scroll_dir == 6 then
                    self:y(-(SCREEN_HEIGHT * 2 / 3) + math.floor(beat * 3) * (SCREEN_HEIGHT / 3))

                -- horizontal scroll
                elseif scroll_dir == 4 then
                    self:x((-SCREEN_WIDTH * 3 / 4) + math.floor(beat * 4) * (SCREEN_WIDTH / 4))

                else
                    self:x(-math.floor(beat * 4) * (SCREEN_WIDTH / 4))
                end
            end
        },

        Def.ActorFrame{
            load_sprite(0, first_texture),

            BeatMessageCommand = function(self, params)
                local beat = params.beat
                beat = (beat / scroll_length) % 1

                -- vertical scroll
                if scroll_dir == 2 then
                    self:y(SCREEN_HEIGHT - math.floor(beat * 3) * (SCREEN_HEIGHT / 3))
                
                elseif scroll_dir == 6 then
                    self:y((SCREEN_HEIGHT / 3) + math.floor(beat * 3) * (SCREEN_HEIGHT / 3))

                -- horizontal scroll
                elseif scroll_dir == 4 then
                    self:x((SCREEN_WIDTH / 4) + math.floor(beat * 4) * (SCREEN_WIDTH / 4))

                else
                    self:x(SCREEN_WIDTH - math.floor(beat * 4) * (SCREEN_WIDTH / 4))
                end
            end
        }
    }
end

-- tilespin
local tilespin_tex
local tilespin_aft

if tilespin_effect then
    tilespin_aft = Def.ActorFrameTexture{
        InitCommand = function(self)
            tilespin_tex = self

            self:SetWidth(SCREEN_WIDTH / 8)
            self:SetHeight(SCREEN_HEIGHT / 6)
            self:EnableAlphaBuffer(true)
            self:Create()
        end,

        Def.ActorFrame{
            load_sprite(0, first_texture),

            OnCommand = function(self)
                self:x(SCREEN_WIDTH / 16)
                self:y(SCREEN_HEIGHT / 12)

                if bg_mode then
                    if not first_texture.size then
                        if SCREEN_RATIO >= 1 then
                            self:zoom(0.75 * (SCREEN_RATIO * (3 / 4)))
                        else
                            self:zoom(0.8 * (SCREEN_HEIGHT / SCREEN_WIDTH))
                        end
                    end
                end

                -- get beat where BGAnimation start
                local start_beat = GAMESTATE:GetSongPosition():GetSongBeat()

                -- spin
                self:SetUpdateFunction(function(self)
                    local song_position = GAMESTATE:GetSongPosition()
                    local beat = song_position:GetSongBeat()
                    beat = beat - start_beat

                    if effect_step then
                        self:rotationz(
                            (math.floor(beat / effect_step) / effect_length * effect_step) % 4 * 360
                        )
                
                    else
                        self:rotationz((beat / effect_length) * 360 % 360)
                    end
                end)
            end
        }
    }
end

-- kaleidoscope 2
local kaleidoscope2_amv

local kaleidoscope2_amv

if kaleidoscope2_effect then
    -------------------------------------------------------------
    -- FLYWEIGHT / MEMORIA ESTÁTICA
    -------------------------------------------------------------
    -- 1. Triángulo base (Posiciones físicas que jamás cambian)
    local POSITIONS = {
        {-SCREEN_WIDTH/13.75, SCREEN_HEIGHT/6, 0},
        {SCREEN_WIDTH/13.75, SCREEN_HEIGHT/6, 0},
        {0, 0, 0}
    }

    -- 2. Baricentro precalculado (evita divisiones continuas)
    local TRI_CENTER_X = (POSITIONS[1][1] + POSITIONS[2][1] + POSITIONS[3][1]) / 3
    local TRI_CENTER_Y = (POSITIONS[1][2] + POSITIONS[2][2] + POSITIONS[3][2]) / 3

    -- 3. Tabla única reutilizable (Pool de vértices)
    -- Asignamos la memoria una sola vez al cargar el archivo
    local vertices = {
        { POSITIONS[1], {1, 1, 1, 1}, {0, 0} },
        { POSITIONS[2], {1, 1, 1, 1}, {0, 0} },
        { POSITIONS[3], {1, 1, 1, 1}, {0, 0} }
    }

    local function update_vertices(tex_width, tex_height, beat)
        if not tex_width or tex_width == 0 then tex_width = SCREEN_WIDTH end
        if not tex_height or tex_height == 0 then tex_height = SCREEN_HEIGHT end

        local adjust_u = (load_song_bg or colorama_fix) and (SCREEN_WIDTH / tex_width) or 1
        local adjust_v = (load_song_bg or colorama_fix) and (SCREEN_HEIGHT / tex_height) or 1

        local scale_x = 0.5 / SCREEN_RATIO
        local scale_y = 1
        local offset_x = -0.1
        local offset_y = -0.025
        local skew_x = 0.5
        local skew_y = -0.25

        local effect_len = -effect_length * 16
        local base_rotation = -math.pi / 3
        local angle = base_rotation - ((beat or 0) / effect_len) * (math.pi * 2)

        local cos_a = math.cos(angle)
        local sin_a = math.sin(angle)

        local center_u = adjust_u * 0.5
        local center_v = adjust_v * 0.5

        -- ACTUALIZACIÓN MUTABLE (Sin crear nuevas tablas)
        for i = 1, 3 do
            local rel_x = -((POSITIONS[i][1] - TRI_CENTER_X) / SCREEN_WIDTH)
            local rel_y = (POSITIONS[i][2] - TRI_CENTER_Y) / SCREEN_HEIGHT

            local skewed_x = rel_x + (rel_y * skew_x)
            local skewed_y = rel_y + (rel_x * skew_y)

            local u = skewed_x * SCREEN_RATIO * scale_x * adjust_u + offset_x
            local v = skewed_y * scale_y * adjust_v + offset_y

            -- Modificamos los valores directamente en el array ya existente
            local rot_u = center_u + (u * cos_a - v * sin_a)
            local rot_v = center_v + (u * sin_a + v * cos_a)

            -- Inyección directa en la coordenada UV (sub-índice 3)
            vertices[i][3][1] = rot_u
            vertices[i][3][2] = rot_v
        end
    end

    kaleidoscope2_amv = Def.ActorMultiVertex{
        Texture = first_texture.img,

        InitCommand = function(self)
            self:SetDrawState{Mode = "DrawMode_Triangles"}
        end,

        OnCommand = function(self)
            if load_song_bg and song_bg_tex then
                self:SetTexture(song_bg_tex:GetTexture())
                self:SetTextureFiltering(true)
            elseif colorama_fix and colorama_fix_tex then
                self:SetTexture(colorama_fix_tex:GetTexture())
                self:SetTextureFiltering(set_texture_filtering or false)
            end

            local tex = self:GetTexture()
            if tex then
                update_vertices(tex:GetTextureWidth(), tex:GetTextureHeight(), 0)
                self:SetVertices(vertices)
            end
        end,

        BeatMessageCommand = function(self, params)
            local tex = self:GetTexture()
            if tex then
                update_vertices(tex:GetTextureWidth(), tex:GetTextureHeight(), params.beat)
                self:SetVertices(vertices)
            end
        end
    }
end

-- layer
local layer = Def.ActorFrame{
    song_bg_aft,
    colorama_fix_aft,
    scroll_bg_crop_aft,
    tilespin_aft,
    
    OnCommand = function(self)
        self:fov(field_of_view)

        -- set z-buffer
        if
        (particles_effect or spiral_effect) and
        blend_mode == "Normal"
        then
            self:zbuffer(true)
        end

        -- config for kaleidoscope effects
        self:zoomx(SCREEN_RATIO / DDR_SCREEN_RATIO)

        -- get beat where BGAnimation start
        local start_beat = GAMESTATE:GetSongPosition():GetSongBeat()

        -- update beat each frame
        self:SetUpdateFunction(function(self)
            local song_position = GAMESTATE:GetSongPosition()
            local beat = song_position:GetSongBeat()
            local sec = song_position:GetMusicSeconds()
            beat = beat - start_beat

            MESSAGEMAN:Broadcast("Beat", {beat = beat})

            -- blink effect
            local sec_blink = 1
            if blink_alpha then
                local time = math.floor(sec * 30 % 2)

                sec_blink = blink_alpha
                if time == 1 then sec_blink = 1 end

                self:diffuse(sec_blink, sec_blink, sec_blink, 1)
            end

            -- fade effect
            if fade_length then
                local beat_fade

                -- animation fade linear
                if fade_linear or fade_linear_invert then
                    local fade_toggle = math.floor((beat / fade_length * 2) % 2) 
        
                    if fade_stop then
                        beat_fade = beat / fade_length
                    else
                        beat_fade = (beat * 2) / fade_length
                    end

                    -- config fade
                    if fade_out then
                        beat_fade = 1 - beat_fade % 1
                    else
                        beat_fade = beat_fade % 1
                    end

                    -- fade animation
                    if not fade_stop then
                        if fade_out then
                            if fade_linear_invert then
                                if fade_toggle == 0 then beat_fade = 1 end
                            else
                                if fade_toggle == 1 then beat_fade = 0 end
                            end

                        else
                            if fade_linear_invert then
                                if fade_toggle == 1 then beat_fade = 1 end
                            else
                                if fade_toggle == 0 then beat_fade = 0 end
                            end
                        end

                    -- fade stop
                    else
                        if fade_out then
                            if beat > fade_length then beat_fade = 0 end
                            if beat_fade == 0 then self:visible(false) end
                        else
                            if beat > fade_length then beat_fade = 1 end
                        end
                    end

                -- animation fade normal
                else
                    local adjust_offset = 0
                    if fade_offset ~= 0 then
                        adjust_offset = (360 * fade_offset)
                    end

                    beat_fade = beat / fade_length
                    beat_fade = (beat_fade % 1) * 360
                    beat_fade = (1 + math.sin(math.rad(beat_fade + 90 + adjust_offset))) / 2
                end

                -- fade alpha
                if fade_alpha then
                    local factor = (1 - fade_alpha) / fade_alpha
                    beat_fade = ((beat_fade * fade_alpha) * factor) + fade_alpha
                end
                
                -- apply fade
                if fade_rgb then
                    self:diffuse(beat_fade, beat_fade, beat_fade, sec_blink)
                else
                    self:diffuse(sec_blink, sec_blink, sec_blink, beat_fade)
                end
            end
        end)
    end
}

-- add sprites to layer
-------------------------------------------------------------
-- 1. LOOKUP TABLE (LUT) DE POSICIONES DEL CALEIDOSCOPIO
-- Precalculamos los 90 valores fuera del bucle (Flyweight)
-------------------------------------------------------------
local KALEIDOSCOPE_TRANSFORMS = {}

if kaleidoscope2_effect then
    local factor = DDR_SCREEN_RATIO / SCREEN_RATIO
    local sw7 = SCREEN_WIDTH / 7
    local sh6 = SCREEN_HEIGHT / 6

    -- Matriz de datos puros [i] = { x_mult, y_mult, rotz, zoomx, zoomy }
    -- Nota: Si zoomx o zoomy es nil, se asume 1 por defecto.
    local DATA = {
        [0]  = {6, 4, 0},            [1]  = {6, 6, 180, -1},     [2]  = {6, 6, 240},
        [3]  = {7.5, 5, 60, -1},     [4]  = {7.5, 5, 120, 1},    [5]  = {6, 4, 120, 1, -1},
        [6]  = {6, 2, 0},            [7]  = {6, 4, 180, -1},     [8]  = {6, 4, 240},
        [9]  = {7.5, 3, 60, -1},     [10] = {7.5, 3, 120, 1},    [11] = {6, 2, 120, 1, -1},
        [12] = {6, 0, 0},            [13] = {6, 2, 180, -1},     [14] = {6, 2, 240},
        [15] = {7.5, 1, 60, -1},     [16] = {7.5, 1, 120, 1},    [17] = {6, 0, 120, 1, -1},

        [18] = {4.5, 5, 0},          [19] = {4.5, 1, 180, -1},   [20] = {4.5, 1, 240},
        [21] = {6, 0, 60, -1},       [22] = {6, 6, 120, 1},      [23] = {4.5, 5, 120, 1, -1},
        [24] = {4.5, 3, 0},          [25] = {4.5, 5, 180, -1},   [26] = {4.5, 5, 240},
        [27] = {6, 4, 60, -1},       [28] = {6, 4, 120, 1},      [29] = {4.5, 3, 120, 1, -1},
        [30] = {4.5, 1, 0},          [31] = {4.5, 3, 180, -1},   [32] = {4.5, 3, 240},
        [33] = {6, 2, 60, -1},       [34] = {6, 2, 120, 1},      [35] = {4.5, 1, 120, 1, -1},

        [36] = {3, 4, 0},            [37] = {3, 6, 180, -1},     [38] = {3, 6, 240},
        [39] = {4.5, 5, 60, -1},     [40] = {4.5, 5, 120, 1},    [41] = {3, 4, 120, 1, -1},
        [42] = {3, 2, 0},            [43] = {3, 4, 180, -1},     [44] = {3, 4, 240},
        [45] = {4.5, 3, 60, -1},     [46] = {4.5, 3, 120, 1},    [47] = {3, 2, 120, 1, -1},
        [48] = {3, 0, 0},            [49] = {3, 2, 180, -1},     [50] = {3, 2, 240},
        [51] = {4.5, 1, 60, -1},     [52] = {4.5, 1, 120, 1},    [53] = {3, 0, 120, 1, -1},

        [54] = {1.5, 5, 0},          [55] = {1.5, 1, 180, -1},   [56] = {1.5, 1, 240},
        [57] = {3, 0, 60, -1},       [58] = {3, 6, 120, 1},      [59] = {1.5, 5, 120, 1, -1},
        [60] = {1.5, 3, 0},          [61] = {1.5, 5, 180, -1},   [62] = {1.5, 5, 240},
        [63] = {3, 4, 60, -1},       [64] = {3, 4, 120, 1},      [65] = {1.5, 3, 120, 1, -1},
        [66] = {1.5, 1, 0},          [67] = {1.5, 3, 180, -1},   [68] = {1.5, 3, 240},
        [69] = {3, 2, 60, -1},       [70] = {3, 2, 120, 1},      [71] = {1.5, 1, 120, 1, -1},

        [72] = {0, 4, 0},            [73] = {0, 6, 180, -1},     [74] = {0, 6, 240},
        [75] = {1.5, 5, 60, -1},     [76] = {1.5, 5, 120, 1},    [77] = {0, 4, 120, 1, -1},
        [78] = {0, 2, 0},            [79] = {0, 4, 180, -1},     [80] = {0, 4, 240},
        [81] = {1.5, 3, 60, -1},     [82] = {1.5, 3, 120, 1},    [83] = {0, 2, 120, 1, -1},
        [84] = {0, 0, 0},            [85] = {0, 2, 180, -1},     [86] = {0, 2, 240},
        [87] = {1.5, 1, 60, -1},     [88] = {1.5, 1, 120, 1},    [89] = {0, 0, 120, 1, -1}
    }

    -- Generamos las funciones de transformación dinámicamente al cargar el script
    for idx, d in pairs(DATA) do
        KALEIDOSCOPE_TRANSFORMS[idx] = function(actor)
            actor:x(sw7 * d[1] * factor):y(sh6 * d[2])
            if d[3] and d[3] ~= 0 then actor:rotationz(d[3]) end
            if d[4] then actor:zoomx(d[4]) end
            if d[5] then actor:zoomy(d[5]) end
        end
    end
end

-------------------------------------------------------------
-- 2. UPDATE FUNCTION ESTÁTICA Y ÚNICA
-- Cero asignación de funciones en memoria durante ejecución
-------------------------------------------------------------
local function shared_sprite_update(self)
    local i = self.i
    local random_index = self.random_index
    local random_angle = self.random_angle
    local random_pos = self.random_pos
    local calc_margin = self.calc_margin
    local adj_x = self.adj_x

    local song_position = GAMESTATE:GetSongPosition()
    local beat = song_position:GetSongBeat() - self.start_beat

    if self.effect_step and not self.scroll_active then
        beat = math.floor(beat / self.effect_step)
    end

    ---------------------------------------------------------
    -- Aquí va toda la lógica de tus 40+ efectos.
    -- Tip: Usa `self.i` para saber cuál sprite se está animando.
    ---------------------------------------------------------
    -- scroll effect
    if scroll_active then
        local limit = {
            x = mesh.cols * sprite_size.w,
            y = mesh.rows * sprite_size.h
        }

        local speed = {
            x = (beat * sprite_size.w / scroll_length) % (sprite_size.w * mesh.cols),
            y = (beat * sprite_size.h / scroll_length) % (sprite_size.h * mesh.rows)
        }

        local anim = {
            x = (i % mesh.cols) * sprite_size.w,
            y = math.floor(i / mesh.cols) * sprite_size.h
        }

        -- movement as step
        if effect_step then
            speed.x = math.floor(beat / effect_step) * sprite_size.w / scroll_length * effect_step
            speed.y = math.floor(beat / effect_step) * sprite_size.h / scroll_length * effect_step
        end

        -- pingpong loop
        if effect_pingpong then
            speed.x = math.abs(-sprite_size.w + (sprite_size.w + speed.x) % (sprite_size.w * 2))
            speed.y = math.abs(-sprite_size.h + (sprite_size.h + speed.y) % (sprite_size.h * 2))
        end

        -- animation
        if scroll_dir == 1 then
            anim.x = -sprite_size.w + (((i % mesh.cols) * sprite_size.w) - speed.x) % limit.x
            anim.y = -sprite_size.h + ((math.floor(i / mesh.cols) * sprite_size.h) - speed.y) % limit.y
        
        elseif scroll_dir == 2 then
            anim.y = -sprite_size.h + ((math.floor(i / mesh.cols) * sprite_size.h) - speed.y) % limit.y
        
        elseif scroll_dir == 3 then
            anim.x = -sprite_size.w + (((i % mesh.cols) * sprite_size.w) + speed.x) % limit.x
            anim.y = -sprite_size.h + ((math.floor(i / mesh.cols) * sprite_size.h) - speed.y) % limit.y

        elseif scroll_dir == 4 then
            anim.x = -sprite_size.w + (((i % mesh.cols) * sprite_size.w) + speed.x) % limit.x

        elseif scroll_dir == 5 then
            anim.x = -sprite_size.w + (((i % mesh.cols) * sprite_size.w) + speed.x) % limit.x
            anim.y = -sprite_size.h + ((math.floor(i / mesh.cols) * sprite_size.h) + speed.y) % limit.y

        elseif scroll_dir == 6 then
            anim.y = -sprite_size.h + ((math.floor(i / mesh.cols) * sprite_size.h) + speed.y) % limit.y

        elseif scroll_dir == 7 then
            anim.x = -sprite_size.w + (((i % mesh.cols) * sprite_size.w) - speed.x) % limit.x
            anim.y = -sprite_size.h + ((math.floor(i / mesh.cols) * sprite_size.h) + speed.y) % limit.y

        elseif scroll_dir == 8 then
            anim.x = -sprite_size.w + (((i % mesh.cols) * sprite_size.w) - speed.x) % limit.x
        end

        if scroll_bg_crop then
            -- vertical scroll
            if scroll_dir == 2 then
                self:x(SCREEN_CENTER_X)
                self:y((SCREEN_HEIGHT * 2 / 3) - ((beat / scroll_length * 3) % 1) * (SCREEN_HEIGHT / 3))

            elseif scroll_dir == 6 then
                self:x(SCREEN_CENTER_X)
                self:y((SCREEN_HEIGHT * 1 / 3) + ((beat / scroll_length * 3) % 1) * (SCREEN_HEIGHT / 3))

            -- horizontal scroll
            elseif scroll_dir == 4 then
                self:x(
                    (SCREEN_CENTER_X - SCREEN_WIDTH / 8) + 
                    (((beat / scroll_length) % (1 / 4)) * (SCREEN_WIDTH))
                )
                self:y(SCREEN_CENTER_Y)
            else

                self:x(
                    (SCREEN_CENTER_X + SCREEN_WIDTH / 8) -
                    (((beat / scroll_length) % (1 / 4)) * (SCREEN_WIDTH))
                )
                self:y(SCREEN_CENTER_Y)
            end

        else
            local adj_x_scroll = 0

            if adj_x_to_center then
                local num_cols = mesh.cols

                if add_more_cols then
                    num_cols = mesh.cols - 1
                end

                adj_x_scroll = (SCREEN_WIDTH - (sprite_size.w * num_cols)) / 2

                self:x(adj_x_scroll + anim.x + sprite_size.w / 2)

            else
                self:x(anim.x)
            end

            self:y(anim.y)
        end
    end

    -- wag pulse effect
    if wagpulse_effect then
        beat = beat * 360 / effect_length % 360

        -- start angle
        local start_angle = 90 + (360 * effect_offset)

        -- animation
        local beat_sin = 0.5 + math.sin(math.rad(start_angle + beat)) / 2

        local function anim(v)
            if effect == "wagx" then
                self:zoomy(v)
            elseif effect == "wagy" then
                self:zoomx(v)
            else
                self:zoom(v)
            end
        end

        anim(beat_sin)

    -- particles effect
    elseif particles_effect then
        if
        effect == "particlesin" or
        effect == "particlesbouncein" or
        effect == "particleslaserin" or
        effect == "particlesout" or
        effect == "particlesbounceout" or
        effect == "particleslaserout"
        then
            self:zoom(1.5)
            local separator = 1000 / num_sprites
            local length = beat * ( (1000 / 3) / (effect_length / 4) )

            -- position x and y
            self:x(random_pos.x)
            if effect == "particlesbouncein" or effect == "particlesbounceout" then
                local anim = SCREEN_HEIGHT - math.sin(
                    math.rad((
                        (beat * (4 / effect_length)) + (random_index / num_sprites)
                    ) * (180 + i * (90 / num_sprites)) % 180
                )) * SCREEN_HEIGHT

                self:y(anim)

            else
                self:y(random_pos.y)
            end

            -- position z
            local anim_z
            if
            effect == "particlesin" or
            effect == "particlesbouncein" or
            effect == "particleslaserin"
            then
                anim_z = -1000 + ((i * separator) + length) % 1000
            else
                anim_z = -1000 + ((i * separator) - length) % 1000
            end
            self:z(anim_z)

        else
            local expand = (i / num_sprites) + 1
            local speed

            self:zoom(0.25 + ((i + 1) / num_sprites / 1.5))

            if
            effect == "particlesup" or
            effect == "particlesdown"
            then
                if effect == "particlesup" then
                    speed = -SCREEN_HEIGHT / effect_length
                else
                    speed = SCREEN_HEIGHT / effect_length
                end

                self:x(random_pos.x)
                self:y(-(sprite_size.h / 2) + 
                    (((beat * speed) + random_pos.y) % SCREEN_HEIGHT) * (1.25 * expand)
                )

            else
                if effect == "particlesleft" then
                    speed = -SCREEN_HEIGHT / effect_length
                else
                    speed = SCREEN_HEIGHT / effect_length
                end

                self:x(-(sprite_size.w / 2) + 
                    (((beat * speed) + random_pos.x) % SCREEN_WIDTH) * (1.25 * expand)
                )
                self:y(random_pos.y)
            end
        end

        -- depth opacity
        if depth_opacity then
            local opacity_value
            if
            effect == "particlesin" or
            effect == "particlesbouncein" or
            effect == "particleslaserin" or
            effect == "particlesout" or
            effect == "particlesbounceout" or
            effect == "particleslaserout"
            then
                opacity_value = (1000 + self:GetZ()) / 1000
            else
                opacity_value = 0.25 + (i / num_sprites / 1.5)
            end

            self:diffuse(opacity_value, opacity_value, opacity_value, 1)
        end

        -- rotation
        if spin_length then
            if
            effect == "particlesin" or
            effect == "particlesdown" or
            effect == "particlesright"
            then
                if effect == "particlesdown" or effect == "particlesright" then
                    self:rotationz((random_angle[i] - (beat * 360 / spin_length)) % 360)
                else
                    self:rotationz(-((beat * (360 / spin_length)) % 360))
                end

            elseif
            effect == "particlesout" or
            effect == "particlesup" or
            effect == "particlesleft"
            then
                if effect == "particlesup" or effect == "particlesleft" then
                    self:rotationz((random_angle[i] + (beat * 360 / spin_length)) % 360)
                else
                    self:rotationz((beat * (360 / spin_length)) % 360)
                end
            end
        end

        if effect == "particleslaserin" or effect == "particleslaserout" then
            self:rotationx(-90)
        end

    -- snail effect
    elseif snail_effect then
        local function generate_snail_order(cols, rows)
            local snail_x = {}
            local snail_y = {}

            -- bordes del "rectángulo" actual
            local left   = 0
            local right  = cols - 1
            local top    = 0
            local bottom = rows - 1

            local index = 1

            while left <= right and top <= bottom do
                
                -- 1) mover derecha
                for x = left, right do
                    snail_x[index] = x
                    snail_y[index] = top
                    index = index + 1
                end
                top = top + 1
                if top > bottom then break end

                -- 2) mover abajo
                for y = top, bottom do
                    snail_x[index] = right
                    snail_y[index] = y
                    index = index + 1
                end
                right = right - 1
                if left > right then break end

                -- 3) mover izquierda
                for x = right, left, -1 do
                    snail_x[index] = x
                    snail_y[index] = bottom
                    index = index + 1
                end
                bottom = bottom - 1
                if top > bottom then break end

                -- 4) mover arriba
                for y = bottom, top, -1 do
                    snail_x[index] = left
                    snail_y[index] = y
                    index = index + 1
                end
                left = left + 1
            end

            return snail_x, snail_y
        end

        -- x and y position
        local snail_x_coord, snail_y_coord = generate_snail_order(mesh.cols, mesh.rows)

        if effect == "snailinreverse" or effect == "snailoutreverse" then
            self:x(adj_x + (snail_x_coord[#snail_x_coord - i] * sprite_size.w))
            self:y(snail_y_coord[#snail_y_coord - i] * sprite_size.h)
        else
            self:x(adj_x + (snail_x_coord[i + 1] * sprite_size.w))
            self:y(snail_y_coord[i + 1] * sprite_size.h)
        end

        -- diffuse alpha anim
        local alpha_anim

        if effect == "snailin" or effect == "snailinreverse" then
            alpha_anim = math.abs(
                math.floor((((beat + effect_offset) / effect_length) + (num_sprites - (i / num_sprites))) % 2) - 1
            )
        else
            alpha_anim = math.floor(
                (((beat + effect_offset) / effect_length) + (num_sprites - (i / num_sprites))) % 2
            )
        end

        self:diffusealpha(alpha_anim)

    -- spiral effects
    elseif spiral_effect then
        -- Z movement
        local separator = 1000 / num_sprites
        local speed = beat * 1000 / effect_length

        if effect == "spiral2in" or effect == "spiral2out" then
            speed = beat * 1000 / 6
        elseif effect == "vortexin" or effect == "vortexout" then
            speed = beat * 1000 / 5
        end

        local anim_z
        if effect == "spiral1in" or effect == "spiral2in" or effect == "vortexin" then
            anim_z = -1000 + ((i * separator) + speed) % 1000
        else
            anim_z = -1000 + ((i * separator) - speed) % 1000
        end

        self:z(anim_z)

        local function expand(start, increase)
            return start + ((1000 + self:GetZ()) / 1000) * increase
        end

        -- spiral 1
        if effect == "spiral1in" or effect == "spiral1out" then
            -- X and Y position
            self:x(SCREEN_CENTER_X + SCREEN_CENTER_X * expand(0.5, 0.75) * math.sin(math.rad(
                i * (360 / num_sprites)
            )))
            self:y(SCREEN_CENTER_Y + SCREEN_CENTER_X * expand(0.5, 0.75) * math.cos(math.rad(
                i * (360 / num_sprites)
            )))

            -- rotation
            local rotation
            if effect == "spiral1in" then
                rotation = -(beat * 360 / effect_length) % 360
            else
                rotation = (beat * 360 / effect_length) % 360
            end

            -- set parameters
            self:zoom(1.25)
            self:rotationz(rotation)

        -- spiral 2
        elseif effect == "spiral2in" or effect == "spiral2out" then
            local function set_coords_a_and_b(start, finish)
                local anim = (1000 + self:GetZ()) / 1000
                return start + anim * (finish - start)
            end

            self:x(
                set_coords_a_and_b(
                    SCREEN_CENTER_X + SCREEN_CENTER_X * math.sin(math.rad(-i * 60)),
                    SCREEN_CENTER_X + SCREEN_CENTER_X * math.sin(math.rad(-(i + 1) * 60))
                )
            )
            self:y(
                set_coords_a_and_b(
                    SCREEN_CENTER_Y + SCREEN_CENTER_X * math.cos(math.rad(-i * 60)),
                    SCREEN_CENTER_Y + SCREEN_CENTER_X * math.cos(math.rad(-(i + 1) * 60))
                )
            )

            self:rotationz(-60 * (i + 1) % 360)

        -- vortex
        else
            SCREENMAN:SystemMessage("Effect \""..effect.."\" under construction")
        end

    -- explode effects
    elseif explode_effect then
        -- beat config
        beat = (beat / effect_length) % 1
        beat = (beat + effect_offset) % 1

        if effect_half then
            beat = beat / 2
        end

        if effect == "explodeout" or effect == "explodeoutspin" then
            if effect_half then
                beat = 0.5 - beat
            else
                beat = 1 - beat
            end
        end

        if effect_pingpong then
            if effect == "explodein" or effect == "explodeinspin" then
                if effect_half then
                    beat = 0.25 - math.abs(-0.25 + beat)
                else
                    beat = 0.5 - math.abs(-0.5 + beat)
                end

            else
                if effect_half then
                    beat = math.abs(-0.25 + beat)
                else
                    beat = math.abs(-0.5 + beat)
                end
            end
        end

        -- movement calc
        local mov_x = beat * calc_margin(i, "x", mesh, sprite_size) * (SCREEN_WIDTH / sprite_size.w) * (2 - (2 / mesh.cols))
        local mov_y = beat * calc_margin(i, "y", mesh, sprite_size) * (SCREEN_HEIGHT / sprite_size.h) * (2 - (2 / mesh.rows))

        if mesh.cols % 2 == 1 then
            mov_x = beat * calc_margin(i, "x", mesh, sprite_size) * (SCREEN_WIDTH / sprite_size.w) * 2
        end

        if mesh.rows % 2 == 1 then
            mov_y = beat * calc_margin(i, "y", mesh, sprite_size) * (SCREEN_HEIGHT / sprite_size.h) * 2
        end

        -- rotation calc
        local rotation = 0
        if effect == "explodeinspin" or effect == "explodeoutspin" then
            rotation = (-i * (360 / 14)) - (beat * 360 * 4)
        end

        -- animations
        self:x(SCREEN_CENTER_X + mov_x * (mesh.cols * 2))
        self:y(SCREEN_CENTER_Y + mov_y * (mesh.rows * 2) * (mesh.cols / mesh.rows))
        self:rotationz(rotation)

    -- misc effects
    elseif misc_effect then
        -- DVD bounce effect
        if effect == "dvdbounce" then
            if effect_half then
                beat = beat + 4
            end

            local limit = {
                x = SCREEN_WIDTH - sprite_size.w,
                y = SCREEN_HEIGHT - sprite_size.h
            }

            local init_pos = {
                x = (
                    (SCREEN_WIDTH - sprite_size.w * 1.5)
                    - ((SCREEN_WIDTH - sprite_size.w * 1.5) - (SCREEN_WIDTH / ((num_sprites - 1) / 1.5)))
                    / (num_sprites - 1) * 2 * ((i - 1) % ((num_sprites - 1) / 2))
                ) / 2,
                y = (
                    ((SCREEN_HEIGHT / ((num_sprites - 1) / 2))
                    + ((SCREEN_HEIGHT - (sprite_size.h * 1.25)) - (SCREEN_HEIGHT / ((num_sprites - 1) / 2)))
                    / (num_sprites - 1) * i)
                ) / 3
            }

            local speed = {
                x = (beat / effect_length * 2.75) * (1 + (i / num_sprites) / 1.3),
                y = (beat / effect_length * 2.75) * (1.15 + (1 - (i / num_sprites)))
            }
            if sprite_size.w >= SCREEN_WIDTH / 2 then
                speed.y = speed.y * num_sprites / 2
            end

            local anim = {
                x = math.abs(-limit.x + (init_pos.x - speed.x * sprite_size.w) % limit.x * 2),
                y = math.abs(-limit.y + (init_pos.y - speed.y * sprite_size.h) % limit.y * 2)
            }
            if sprite_size.w >= SCREEN_WIDTH then anim.x = 0 end

            self:x(anim.x)
            self:y(anim.y)

        -- scroll X and Y effect
        elseif effect == "scrollxy" then
            local length = effect_length / 2

            beat = (-0.5 + length + ((beat + num_sprites) / ((i / num_sprites) + 1))) % length

            if i % 2 == 0 then
                self:x(-sprite_size.w / 2 + (sprite_size.w * i / 2))

                if math.floor(i / 2) % 2 == 0 then
                    self:y(-sprite_size.h + (SCREEN_HEIGHT + sprite_size.h) * beat / length)
                else
                    self:y(SCREEN_HEIGHT - (SCREEN_HEIGHT + sprite_size.h) * beat / length)
                end

            else
                self:y((-sprite_size.h / 1.5) + (sprite_size.h * i / 2.5))

                if math.floor(i / 2) % 2 == 0 then
                    self:x(-sprite_size.w + (SCREEN_WIDTH + sprite_size.w) * beat / length)
                else
                    self:x(SCREEN_WIDTH - (SCREEN_WIDTH + sprite_size.w) * beat / length)
                end
            end
        end

    -- background door effects
    elseif bgdoor_effect then
        beat = (beat / effect_length) % 1

        if effect == "bgdoorclose" then
            beat = 1 - beat
        end

        if i == 0 then
            self:x(-beat * SCREEN_WIDTH / 2)
            self:y(-beat * SCREEN_HEIGHT / 2)
        end

        if i == 1 then
            self:x(beat * SCREEN_WIDTH / 2)
            self:y(-beat * SCREEN_HEIGHT / 2)
        end

        if i == 2 then
            self:x(-beat * SCREEN_WIDTH / 2)
            self:y(beat * SCREEN_HEIGHT / 2)
        end

        if i == 3 then
            self:x(beat * SCREEN_WIDTH / 2)
            self:y(beat * SCREEN_HEIGHT / 2)
        end

    elseif kaleidoscope2_effect then
        --SCREENMAN:SystemMessage("Effect \""..effect.."\" under construction")

    else
        if effect ~= "" then
            if
            not bgmirror_effect and
            not tilespin_effect and
            not bgwarp_effect and
            not bgdistort_effect and
            not kaleidoscope2_effect
            then
                SCREENMAN:SystemMessage("Effect \""..effect.."\" doesn't exist")
            end
        end
    end
end

-------------------------------------------------------------
-- 3. CÁLCULO DE MARGENES OPTIMIZADO (Sin closures internos)
-------------------------------------------------------------
local function calc_margin(i, axis, mesh, sprite_size)
    local is_y = (axis == "y")
    local dir = is_y and mesh.rows or mesh.cols
    local separator = is_y and (sprite_size.h / mesh.rows / 2) 
                      or ((sprite_size.w / mesh.cols / 2) * (SCREEN_WIDTH / (SCREEN_HEIGHT * 4 / 3)))
    local iterator = is_y and math.floor(i / mesh.cols) or i
    local startPoint = -math.floor(dir / 2)

    if dir % 2 == 0 then
        return ((startPoint + ((iterator % dir) * (dir / (dir - 1)))) * separator)
    else
        return ((startPoint + (iterator % dir)) * separator)
    end
end

-------------------------------------------------------------
-- 4. BUCLE PRINCIPAL "ADD SPRITES TO LAYER"
-------------------------------------------------------------
for i = 0, num_sprites - 1 do
    local tex_iterator = i % num_textures

    if num_textures == 2 and scroll_active and not scroll_intercalate then
        if math.floor(i / mesh.cols) % 2 == 1 then
            tex_iterator = (i + 1) % num_textures
        end
    end

    local tex = p.textures[tex_iterator + 1]

    -- Fabrica de objetos ligada al tipo de efecto
    local inner_obj
    if tilespin_effect then
        inner_obj = Def.Sprite{
            OnCommand = function(self)
                self:SetTexture(tilespin_tex:GetTexture())
                self:blend(blend_mode)
            end
        }
    elseif scroll_bg_crop then
        inner_obj = Def.Sprite{
            OnCommand = function(self)
                self:SetTexture(scroll_bg_crop_tex:GetTexture())
                self:blend(blend_mode)

                local col = i % 4
                local row = math.floor(i / 4)
                if scroll_dir == 2 or scroll_dir == 6 then
                    self:cropright((3 - col) / 4):cropleft(col / 4)
                    if scroll_dir == 6 then
                        self:cropbottom((3 - row) / 4):croptop(row / 4)
                    else
                        self:croptop((3 - row) / 4):cropbottom(row / 4)
                    end
                else
                    col = i % 5
                    row = math.floor(i / 5)
                    if scroll_dir == 8 then
                        self:cropleft((4 - col) / 5):cropright(col / 5)
                    else
                        self:cropright((4 - col) / 5):cropleft(col / 5)
                    end
                    self:croptop((2 - row) / 3):cropbottom(row / 3)
                end
            end
        }
    elseif bgdistort_effect then
        inner_obj = bgdistort_amv
    elseif kaleidoscope2_effect then
        inner_obj = kaleidoscope2_amv
    elseif black_bg then
        inner_obj = Def.Quad{
            OnCommand = function(self)
                self:Center():zoomto(SCREEN_WIDTH, SCREEN_HEIGHT):diffuse(0,0,0,alpha)
            end
        }
    else
        inner_obj = load_sprite(i, tex)
    end

    -- Inserción directa en la capa
    layer[#layer + 1] = Def.ActorFrame{
        Def.ActorFrame{
            inner_obj,

            -- RGB channel animations
            OnCommand = function(self)
                if color_anim then
                    -- get beat where BGAnimation start
                    local start_beat = GAMESTATE:GetSongPosition():GetSongBeat()

                    self:SetUpdateFunction(function(self)
                        local song_position = GAMESTATE:GetSongPosition()
                        local beat = song_position:GetSongBeat()
                        beat = beat - start_beat

                        -- function to anim rgb channels (linear)
                        local function color_values(values)
                            local speed = beat + i
                            local cv_effect_length = speed % 1
                            local keyframe = speed % #values

                            local value1, value2

                            for j = 0, #values - 1 do
                                if keyframe >= j and keyframe <= j + 1 then
                                    value1 = values[j + 1]
                                    value2 = values[(j + 1) % #values + 1]
                                end
                            end

                            return (value1 + (cv_effect_length * (value2 - value1))) / 255
                        end

                        -- rgb channels animations (coloranim)
                        local speed = beat * 90
                        local r, g, b

                        if color_anim == 0 then
                            local time = (beat % 2) * (7 / 8)
                            local keyframe = i % 7
                            local colors = {
                                {0,0,1}, -- blue
                                {1,0,1}, -- magenta
                                {0,1,0}, -- green
                                {1,1,0}, -- yellow
                                {0,1,1}, -- cyan
                                {1,1,1}, -- white
                                {1,0,0}, -- red

                                -- duplicated colors
                                {0,0,1},
                                {1,0,1},
                                {0,1,0},
                                {1,1,0},
                                {0,1,1},
                                {1,1,1},
                                {1,0,0}
                            }

                            if time < 0.25 then
                                self:diffuse(
                                    colors[keyframe % 7 + 1][1],
                                    colors[keyframe % 7 + 1][2],
                                    colors[keyframe % 7 + 1][3],1
                                )
                            elseif time > 0.25 and time < 0.5 then
                                self:diffuse(
                                    colors[keyframe % 7 + 3][1],
                                    colors[keyframe % 7 + 3][2],
                                    colors[keyframe % 7 + 3][3],1
                                )
                            elseif time > 0.5 and time < 0.75 then
                                self:diffuse(
                                    colors[keyframe % 7 + 5][1],
                                    colors[keyframe % 7 + 5][2],
                                    colors[keyframe % 7 + 5][3],1
                                )
                            elseif time > 0.75 and time < 1 then
                                self:diffuse(
                                    colors[keyframe % 7 + 7][1],
                                    colors[keyframe % 7 + 7][2],
                                    colors[keyframe % 7 + 7][3],1
                                )
                            elseif time > 1 and time < 1.25 then
                                self:diffuse(
                                    colors[keyframe % 7 + 2][1],
                                    colors[keyframe % 7 + 2][2],
                                    colors[keyframe % 7 + 2][3],1
                                )
                            elseif time > 1.25 and time < 1.5 then
                                self:diffuse(
                                    colors[keyframe % 7 + 4][1],
                                    colors[keyframe % 7 + 4][2],
                                    colors[keyframe % 7 + 4][3],1
                                )
                            elseif time > 1.5 and time < 1.75 then
                                self:diffuse(
                                    colors[keyframe % 7 + 6][1],
                                    colors[keyframe % 7 + 6][2],
                                    colors[keyframe % 7 + 6][3],1
                                )
                            end
                        
                        elseif color_anim == 1 then
                            r = (math.sin(math.rad(speed)) + 1) / 2
                            g = (math.sin(math.rad(120 + speed)) + 1) / 2
                            b = (math.sin(math.rad(240 + speed)) + 1) / 2

                        elseif color_anim == 2 then
                            r = (math.sin(math.rad(speed + i * 36)) + 1) / 2
                            g = (math.sin(math.rad(120 + speed + i * 36)) + 1) / 2
                            b = (math.sin(math.rad(240 + speed + i * 36)) + 1) / 2

                        elseif color_anim == 3 then
                            r = 1
                            g = color_values({0, 128, 255})
                            b = 0

                        elseif color_anim == 4 then
                            r = 1
                            g = color_values({255, 128, 0})
                            b = color_values({0  , 128, 255})

                        elseif color_anim == 5 then
                            r = color_values({218, 205, 244, 246, 205, 217, 255, 231, 201, 233, 255})
                            g = color_values({252, 119, 10 , 185, 236, 46 , 49 , 234, 185, 8  , 120})
                            b = color_values({26 , 122, 85 , 0  , 61 , 126, 43 , 0  , 102, 115, 10 })

                        elseif color_anim == 6 then
                            r = 0
                            g = color_values({0, 128, 255})
                            b = 1

                        elseif color_anim == 7 then
                            r = color_values({0  , 128, 255})
                            g = color_values({255, 128, 0})
                            b = 1

                        elseif color_anim == 8 then
                            r = color_values({26 , 122, 85 , 0  , 61 , 126, 43 , 0  , 102, 115, 10 })
                            g = color_values({252, 119, 10 , 185, 236, 46 , 49 , 234, 185, 8  , 120})
                            b = color_values({218, 205, 244, 246, 205, 217, 255, 231, 201, 233, 255})

                        elseif color_anim == 9 then
                            r = color_values({0, 128, 255})
                            g = 0
                            b = color_values({255, 128, 0})

                        elseif color_anim == 10 then
                            r = color_values({0, 160, 90})
                            g = color_values({0, 255, 160})
                            b = color_values({255, 0, 79})

                        elseif color_anim == 11 then
                            r = color_values({0, 0, 255, 255})
                            g = color_values({128, 128, 255, 255})
                            b = 0
                        end

                        if r and g and b then self:diffuse(r,g,b,1) end
                    end)
                end
            end
        },

        OnCommand = function(self)
            -- Asignación de variables al Actor para usarlas en el update estático
            self.i = i
            self.start_beat = GAMESTATE:GetSongPosition():GetSongBeat()
            self.effect_step = effect_step
            self.scroll_active = scroll_active

            ---------------------------------------------------------
            -- POSICIONAMIENTO INICIAL (Sin crear tablas basura)
            ---------------------------------------------------------
            -- adjust tile to center
            local adj_x = align_center and (sprite_size.w / 2) or 0
            local adj_y = align_center and (sprite_size.h / 2) or 0

            if adj_x_to_center and not stretch_x_res and not bg_mode and sprite_size.w <= 320 then
                local tile_offset = (SCREEN_WIDTH - (sprite_size.w * mesh.cols)) / 2
                if add_more_cols then tile_offset = tile_offset + (sprite_size.w / 2) end
                adj_x = adj_x + tile_offset
            end

            -- initial position by effect
            if tilespin_effect then
                self:x((SCREEN_WIDTH / 16) + (SCREEN_WIDTH / 8) * (i % 8))
                self:y((SCREEN_HEIGHT / 12) + (SCREEN_HEIGHT / 6) * math.floor(i / 8))

                local is_odd_row = math.floor(i / 8) % 2 == 1
                local is_odd_col = i % 2 == 1
                if (is_odd_row and not is_odd_col) or (not is_odd_row and is_odd_col) then
                    self:zoomx(-1)
                end

            elseif kaleidoscope2_effect then
                -- Búsqueda rápida O(1) en la tabla de transformaciones
                local transform = KALEIDOSCOPE_TRANSFORMS[i]
                if transform then transform(self) end

            elseif set_mesh or bg_crop_x then
                local cols = mesh.cols
                local rows = mesh.rows
                self:x((SCREEN_WIDTH / (cols * 2)) + ((i % cols) * (SCREEN_WIDTH / cols)))
                self:y((SCREEN_HEIGHT / (rows * 2)) + (math.floor(i / cols) * (SCREEN_HEIGHT / rows)))

            elseif bgmirror_effect or bgwarp_effect or bgdoor_effect then
                self:x(0):y(0)

            else
                self:x(adj_x + sprite_size.w * (i % mesh.cols))
                self:y(adj_y + sprite_size.h * math.floor(i / mesh.cols))
            end

            if margin then
                self:x(adj_x + sprite_size.w * (i % mesh.cols) + calc_margin(i, "x", mesh, sprite_size))
                self:y(adj_y + sprite_size.h * math.floor(i / mesh.cols) + calc_margin(i, "y", mesh, sprite_size))
            end

            -- random values
            local random_index = 0
            if num_sprites > 1 then random_index = math.random(0, num_sprites - 1) end

            local random_angle = {}
            if
            (effect == "particlesleft" or
            effect == "particlesright" or
            effect == "particlesup" or
            effect == "particlesdown") and spin_length
            then
                random_angle[i] = math.random(0, 360)
            end

            local random_pos = {x = 0, y = 0}
            if particles_effect then
                if
                effect == "particlesin" or
                effect == "particleslaserin" or
                effect == "particlesbouncein" or
                effect == "particlesout" or
                effect == "particlesbounceout" or
                effect == "particleslaserout"
                then
                    if effect == "particlesbouncein" or effect == "particlesbounceout" then
                        random_pos.x = math.random(-SCREEN_WIDTH, SCREEN_WIDTH * 2)
                    else
                        random_pos.x = math.random(-SCREEN_WIDTH / 2, SCREEN_WIDTH * 1.5)
                    end

                    random_pos.y = math.random(-SCREEN_HEIGHT / 2, SCREEN_HEIGHT * 1.5)
                
                else
                    random_pos.x = math.random(0, SCREEN_WIDTH)
                    random_pos.y = math.random(0, SCREEN_HEIGHT)
                end
            end

            -- Vinculamos la función de actualización compartida
            self.random_index = random_index
            self.random_angle = random_angle
            self.random_pos = random_pos
            self.calc_margin = calc_margin
            self.adj_x = adj_x
            self:SetUpdateFunction(shared_sprite_update)
        end
    }
end

return layer