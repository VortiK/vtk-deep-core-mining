-- Apply unlocks and bonuses if already researched (case of loading an existing savegame)
for i, surface in pairs(game.surfaces) do 
	surface.regenerate_decorative()
end