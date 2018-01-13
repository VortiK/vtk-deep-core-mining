-- Reset technologies and recipes, just in case
-- already done automagically by the game on mod install/upgrade since 0.14+
-- for i, player in ipairs(game.players) do
-- 	player.force.reset_recipes()
-- 	player.force.reset_technologies()
--  player.force.reset_technology_effects()	
-- end

-- Apply unlocks and bonuses if already researched (case of loading an existing savegame)
for i, force in pairs(game.forces) do 

	if force.technologies["uranium-ammo"].researched then 
		force.recipes["uranium-cannon-shell-magazine"].enabled = true
        force.recipes["explosive-uranium-cannon-shell-magazine"].enabled = true
	end

-- Simpler catch all, magazine ammo are actually = to non magazine ammo type, so we can just copy the bonuses
-- 
    force.set_ammo_damage_modifier("cannon-shell-magazine", force.get_ammo_damage_modifier("cannon-shell"))
    force.set_gun_speed_modifier("cannon-shell-magazine", force.get_gun_speed_modifier("cannon-shell"))

-- Apply researched shell damage bonus to magazine ammo type
-- type = "ammo-damage", ammo_category = "cannon-shell-magazine", modifier = 0.2
-- TODO factorize modifier values
--[[
	if force.technologies["cannon-shell-damage-1"].researched then 
        force.set_ammo_damage_modifier("cannon-shell-magazine", force.get_ammo_damage_modifier("cannon-shell-magazine")+0.2)
	end
	if force.technologies["cannon-shell-damage-2"].researched then 
		force.set_ammo_damage_modifier("cannon-shell-magazine", force.get_ammo_damage_modifier("cannon-shell-magazine")+0.2)
	end
	if force.technologies["cannon-shell-damage-3"].researched then 
		force.set_ammo_damage_modifier("cannon-shell-magazine", force.get_ammo_damage_modifier("cannon-shell-magazine")+0.3)
	end
	if force.technologies["cannon-shell-damage-4"].researched then 
		force.set_ammo_damage_modifier("cannon-shell-magazine", force.get_ammo_damage_modifier("cannon-shell-magazine")+0.5)
	end
	if force.technologies["cannon-shell-damage-5"].researched then 
		force.set_ammo_damage_modifier("cannon-shell-magazine", force.get_ammo_damage_modifier("cannon-shell-magazine")+1)
	end
	if force.technologies["cannon-shell-damage-6"].researched then 
		force.set_ammo_damage_modifier("cannon-shell-magazine", force.get_ammo_damage_modifier("cannon-shell-magazine")+1)
	end

	if force.technologies["cannon-shell-speed-1"].researched then 
		force.set_gun_speed_modifier("cannon-shell-magazine", force.get_gun_speed_modifier("cannon-shell-magazine")+0.2)
	end
	if force.technologies["cannon-shell-speed-2"].researched then 
		force.set_gun_speed_modifier("cannon-shell-magazine", force.get_gun_speed_modifier("cannon-shell-magazine")+0.2)
	end
	if force.technologies["cannon-shell-speed-3"].researched then 
		force.set_gun_speed_modifier("cannon-shell-magazine", force.get_gun_speed_modifier("cannon-shell-magazine")+0.3)
	end
	if force.technologies["cannon-shell-speed-4"].researched then 
		force.set_gun_speed_modifier("cannon-shell-magazine", force.get_gun_speed_modifier("cannon-shell-magazine")+0.6)
	end
	if force.technologies["cannon-shell-speed-5"].researched then 
		force.set_gun_speed_modifier("cannon-shell-magazine", force.get_gun_speed_modifier("cannon-shell-magazine")+1)
	end
--]]
end