-----------------------------------------------------------------------------------------------
local title	= "Ban Hammer"
local version = "0.1.1"
local mname	= "ban_hammer"
-----------------------------------------------------------------------------------------------

minetest.register_craftitem("ban_hammer:hammer", {
	description = "Ban Hammer",
	inventory_image = "ban_hammer.png",
	wield_scale = {x=1,y=1,z=1},
	
	on_use = function(itemstack, user, pointed_thing)
		-- Must be pointing at player
		if pointed_thing.type == "object" then
			if pointed_thing.ref:is_player() then
				punched_player = pointed_thing.ref:get_player_name()
				punched_player_privs = minetest.get_player_privs(punched_player)
				puncher = user:get_player_name()
				puncher_privs = minetest.get_player_privs(puncher)
				if (puncher_privs["ban"] == true) then
					minetest.ban_player(punched_player)
				end
			end
		end
	end,
})

-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------
