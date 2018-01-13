require 'stdlib/area/area'
require 'stdlib/area/position'

function spawn_ore_patch_on_depleted_ore(event)
  local ore = event.entity
  local surface = ore.surface
  local areaToScan = Position.expand_to_area(ore.position, 5)
  local patchableOres = {"iron-ore", "copper-ore", "coal", "stone"; "uranium-ore"}
  
  -- logic : 
  -- - depleted ore has an equivalent patch entity
  -- - 10% chance to spawn an ore patch on depletion
  -- - check if there isn't a nearby ore patch already
  -- - then spawn it on the location the ore was depleted
  
  -- debug
  -- local player = game.players[1]
  -- player.print("VTK-DEEP-CORE-MINING_DEBUG")
  -- player.print(serpent.block(player))
  
  validOre = false
  for _,patchableOre in pairs(patchableOres) do
    if patchableOre == ore.name then
      if settings.global["vtk-deep-core-mining-spawn-"..patchableOre.."-patch"].value then
        validOre = true
        break
      end
    end
  end
  
  if validOre and not Area.inside(Position.expand_to_area({0,0}, settings.global["vtk-deep-core-mining-spawn-radius-from-spawn"].value), ore.position) then
    orePatch = ore.name .. "-patch"
    local number = math.random(1, 10)
    entitiesCount = surface.count_entities_filtered{area = areaToScan, name = orePatch}
    
    if number == 1 and entitiesCount == 0 then
      oreamount = math.random(settings.global["vtk-deep-core-mining-min-richness"].value, settings.global["vtk-deep-core-mining-max-richness"].value)
      newOreEntity = surface.create_entity({name = orePatch, amount = oreamount, position = ore.position, force = game.forces.neutral})
    end
  end
  
end

local function remove_ore_patch(player, surface, area, entities)
  local patchescount = 0
  local uraniumpatchescount = 0
  local dronescount = player.get_item_count("vtk-deepcore-mining-drone")
  local sulfuricacidbarrelcount = player.get_item_count("sulfuric-acid-barrel")
  local deepminingsuccessfull = true
  
  for _,entity in pairs(entities) do
    if entity.type == "resource" and game.entity_prototypes[entity.name].resource_category == "vtk-deepcore-mining-ore" then
      patchescount = patchescount + 1
      if entity.name == "uranium-ore-patch" then
        uraniumpatchescount = uraniumpatchescount + 1
      end
    end
  end
  
  if patchescount > 0 then
    for _,entity in pairs(entities) do
    
      -- player.print("VTK-DEEP-CORE-MINING_DEBUG")
      -- player.print(serpent.block(entity.name))
      -- player.print(serpent.block(entity.amount))
      
      -- display all requirements if not enough in inventory
      if dronescount < patchescount then
          player.print("Not enough Deep Core mining drones. "..patchescount.." needed only "..dronescount.." in inventory.")
      end
      if sulfuricacidbarrelcount < uraniumpatchescount then
          player.print("Not enough sulfuric acid barrel. "..uraniumpatchescount.." needed only "..sulfuricacidbarrelcount.." in inventory.")
      end
      
      if entity.type == "resource" and game.entity_prototypes[entity.name].resource_category == "vtk-deepcore-mining-ore" then
        if dronescount >= patchescount then
          -- spawn deep core ore chunks depending on the ore patch removed amount
          -- 10 000 = 3%
          -- 300% = 1 000 000
          -- Set to 10% of amount by removing ore patch and max 1 000 chunks (stacks to 100, so 10 stacks to be transportable)
          -- Yields 100 per refine, so total = 1 000 000
          local countospawn = 0.1 * entity.amount
          -- prevent too much spawning if amount is over the top (ie creative mod / cheating, etc).
          if countospawn > 1000 then
            countospawn = 1000
          elseif countospawn < 10 then
            countospawn = 10
          end
          
          if entity.name == "iron-ore-patch" then
            surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-iron-ore-chunk", count = countospawn}, true)
            
          elseif entity.name == "copper-ore-patch" then
            surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-copper-ore-chunk", count = countospawn}, true)
            
          elseif entity.name == "coal-patch" then
            surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-coal-chunk", count = countospawn}, true)
            
          elseif entity.name == "stone-patch" then
            surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-stone-chunk", count = countospawn}, true)
            
          elseif entity.name == "uranium-ore-patch" then
            if sulfuricacidbarrelcount >= uraniumpatchescount then
              surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-uranium-ore-chunk", count = countospawn}, true)
              player.remove_item{name="sulfuric-acid-barrel", count = uraniumpatchescount}
            else
              deepminingsuccessfull = false
            end
          end
          
          if deepminingsuccessfull == true then
            player.remove_item{name="vtk-deepcore-mining-drone", count = patchescount}
            entity.destroy()
          end
        end
      end
    end
  end
	
end

-- events hook
events = defines.events
script.on_event({
    events.on_resource_depleted
}, function(event)
    spawn_ore_patch_on_depleted_ore(event)
end)

script.on_event(events.on_player_selected_area, function(event)
  if event.item == "vtk-deepcore-mining-planner" then
		local player = game.players[event.player_index]
		local surface = player.surface
		remove_ore_patch(player, surface, event.area, event.entities)
	end
end)