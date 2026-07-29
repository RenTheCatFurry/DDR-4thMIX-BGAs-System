local BGA_dirs = FILEMAN:GetDirListing( "//BGAnimations/", true, true )
local s

if #BGA_dirs > 1 then
	s = BGA_dirs[ math.random( 1, #BGA_dirs ) ] .. "/default.lua"

	return Def.ActorFrame{	
		loadfile(s)(),
	}

else
	local layer1 = {
		textures = {
			{
			}
		}
	}
	
	return Def.ActorFrame{
		LoadActor("../_DDR_4thMIX_BGAs_System/layer.lua", layer1)
	}
end