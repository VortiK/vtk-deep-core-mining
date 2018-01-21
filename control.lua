require 'stdlib/area/area'
require 'stdlib/area/position'
require 'stdlib/table'

function spawn_ore_patch_on_depleted_ore(event)
  local ore = event.entity
  local surface = ore.surface
  local areaToScan = Position.expand_to_area(ore.position, 5)
  local patchableOres = {"iron-ore", "copper-ore", "coal", "stone"; "uranium-ore"}
  local minspawnrange = settings.global["vtk-deep-core-mining-spawn-radius-from-start"].value
  local minrichness = settings.global["vtk-deep-core-mining-patch-min-richness"].value
  local maxrichness = settings.global["vtk-deep-core-mining-patch-max-richness"].value
  
  if game.active_mods["angelsrefining"] then
    local angelsores = {"angels-ore1", "angels-ore2", "angels-ore3", "angels-ore4", "angels-ore5", "angels-ore6"}
    patchableOres = table.merge(patchableOres, angelsores, {option1=true})
  end
  
  -- logic : 
  -- - depleted ore has an equivalent patch entity
  -- - 10% chance to spawn an ore patch on depletion
  -- - check if there isn't a nearby ore patch already
  -- - then spawn it on the location the ore was depleted
  
  -- debug
  -- local player = game.players[1]
  -- player.print("VTK-DEEP-CORE-MINING_DEBUG")
  -- player.print(serpent.block(ore.name))
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
  
  if validOre and not Area.inside(Position.expand_to_area({0,0}, minspawnrange), ore.position) then
    orePatch = ore.name .. "-patch"
    local number = math.random(1, 10)
    entitiesCount = surface.count_entities_filtered{area = areaToScan, name = orePatch}
    
    if number == 1 and entitiesCount == 0 then
      oreamount = math.random(minrichness, maxrichness)
      newOreEntity = surface.create_entity({name = orePatch, amount = oreamount, position = ore.position, force = game.forces.neutral})
    end
  end
  
end



function place_deep_core_cracks(area, surface)

  if not settings.global["vtk-deep-core-mining-spawn-cracks"].value then
    return
  end
  
  local minspawnrange = settings.global["vtk-deep-core-mining-spawn-radius-from-start"].value
  local crackrichness = settings.global["vtk-deep-core-mining-crack-richness"].value
  
-- debug
-- local player = game.players[1]
-- player.print("VTK-DEEP-CORE-MINING_DEBUG")

  -- only spawn deep core mining cracks in nauvis
  if surface.name ~= "nauvis" then
    return
  end
  
  -- lucky day ? (1 / 500)
  local luck = math.random(1, 500)
-- debug player.print(serpent.block(luck))
  if luck ~= 250 then
    return
  end

  -- check if there's already an entity present here (shouldn't but just in case)
  entitiesCount = surface.count_entities_filtered{area = area, name = "vtk-deepcore-mining-crack"}
-- debug player.print(serpent.block(entitiesCount))

  if entitiesCount ~= 0 then
    return
  end
  
  local x1 = area.left_top.x
  local y1 = area.left_top.y
  local x2 = area.right_bottom.x
  local y2 = area.right_bottom.y
  
  -- minimum distance from spawn where deepcore mining cracks appear (default 1)
-- debug
-- player.print("setting value "..minspawnrange)
-- player.print("position x "..x1.." y "..y1)

  if Area.inside(Position.expand_to_area({0,0}, minspawnrange), {x1, y1}) then
    return
  end
  
  local attempts = 0
  -- try 10 times to find a valid position to spawn a crack otherwise abandon
  while attempts < 10 do
    local x = math.random(x1, x2)
    local y = math.random(y1, y2)
    
    local tile = surface.get_tile(x, y)
-- debug player.print(serpent.block(tile.name))
  
    if tile.valid and surface.can_place_entity{name = "vtk-deepcore-mining-crack", position = tile.position} then
      oreamount = crackrichness
      createdentity = surface.create_entity({name = "vtk-deepcore-mining-crack", amount = oreamount, position = tile.position, force = game.forces.neutral})
      
      -- cleanup decoratives around the newly spawned crack
      cleanupzone = Area.construct(createdentity.position.x, createdentity.position.y, createdentity.position.x, createdentity.position.y)
      cleanupzone = Area.expand(cleanupzone, 2)
      surface.destroy_decoratives(cleanupzone)
-- debug
-- player.print("vtk-deepcore-mining-crack placed successfully")
-- player.print(serpent.block(tile.position))
      return
    end
    attempts = attempts + 1
  end
  
end

local function get_filtered_amount(amount)
  -- spawn deep core ore chunks depending on the ore patch removed amount
  -- 10 000 = 3%
  -- 300% = 1 000 000
  -- Set to 10% of amount by removing ore patch and max 1 000 chunks (stacks to 100, so 10 stacks to be transportable)
  -- Yields 100 per refine, so total = 1 000 000
  local amountospawn = 0.1 * amount
  -- prevent too much spawning if amount is over the top (ie creative mod / cheating, etc).
  if amountospawn > 1000 then
    amountospawn = 1000
  elseif amountospawn < 10 then
    amountospawn = 10
  end
  
  return amountospawn
end

local function remove_ore_patch(player, surface, area, entities)
  local patchescount = 0
  local sulfuricpatchescount = 0
  local dronescount = player.get_item_count("vtk-deepcore-mining-drone")
  local sulfuricacidbarrelcount = player.get_item_count("sulfuric-acid-barrel")
  local patches = {}
  local sulfuricpatches = {}
  local todo = true
  
  for _,entity in pairs(entities) do
    if entity.type == "resource"
      and (game.entity_prototypes[entity.name].resource_category == "vtk-deepcore-mining-ore-patch" 
        or game.entity_prototypes[entity.name].resource_category == "vtk-deepcore-mining-crack")
    then
      table.insert(patches, entity)
      patchescount = patchescount + 1
      if entity.name == "uranium-ore-patch" or entity.name == "vtk-deepcore-mining-crack" then
        sulfuricpatchescount = sulfuricpatchescount + 1
      end
    end
  end
  
  -- nothing todo ?
  if patchescount <= 0 then
    todo = false
  end
  -- display all requirements if not enough in inventory
  if dronescount < patchescount then
    player.print("Not enough Deep Core mining drones. "..patchescount.." needed only "..dronescount.." in inventory.")
    todo = false
  end
  if sulfuricacidbarrelcount < sulfuricpatchescount then
    player.print("Not enough sulfuric acid barrel. "..sulfuricpatchescount.." needed only "..sulfuricacidbarrelcount.." in inventory.")
    todo = false
  end
  if not todo then
    return
  end
  
  -- removing !
  for _,entity in pairs(patches) do
    local amountospawn = get_filtered_amount(entity.amount)
    -- debug
    -- player.print("VTK-DEEP-CORE-MINING_DEBUG")
    -- player.print("Found "..patchescount.." patches to remove and "..sulfuricpatchescount.." sulfuric patches to remove")
    -- player.print(serpent.block(entity.name))
    -- player.print(serpent.block(entity.amount))
    -- player.print(serpent.block(amountospawn))

    if entity.name == "iron-ore-patch" then
      surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-iron-ore-chunk", count = amountospawn}, true)
      
    elseif entity.name == "copper-ore-patch" then
      surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-copper-ore-chunk", count = amountospawn}, true)
      
    elseif entity.name == "coal-patch" then
      surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-coal-chunk", count = amountospawn}, true)
      
    elseif entity.name == "stone-patch" then
      surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-stone-chunk", count = amountospawn}, true)
      
    elseif entity.name == "uranium-ore-patch" then
      surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-uranium-ore-chunk", count = amountospawn}, true)

    elseif entity.name == "vtk-deepcore-mining-crack" then
      surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-ore-chunk", count = amountospawn}, true)
    
    elseif entity.name == "angels-ore1-patch" then
      surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-angels-ore1-chunk", count = amountospawn}, true)
      
    elseif entity.name == "angels-ore2-patch" then
      surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-angels-ore2-chunk", count = amountospawn}, true)
      
    elseif entity.name == "angels-ore3-patch" then
      surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-angels-ore3-chunk", count = amountospawn}, true)
      
    elseif entity.name == "angels-ore4-patch" then
      surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-angels-ore4-chunk", count = amountospawn}, true)
      
    elseif entity.name == "angels-ore5-patch" then
      surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-angels-ore5-chunk", count = amountospawn}, true)
      
    elseif entity.name == "angels-ore6-patch" then
      surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-angels-ore6-chunk", count = amountospawn}, true)
    
    end
    entity.destroy()
  end
  
  player.remove_item{name="vtk-deepcore-mining-drone", count = patchescount}
  if sulfuricpatchescount > 0 then
    player.remove_item{name="sulfuric-acid-barrel", count = sulfuricpatchescount}
  end
	
end



-- deep core mining drills sprites are not rotatable, so force then south!
local function force_rotation(entity)
  if entity.name == "vtk-deepcore-mining-drill" or entity.name == "vtk-deepcore-mining-drill-advanced" then
    entity.rotatable = false
    entity.direction = defines.direction.south
  end
end



-- events hook

-- Spawn ore patches on ore depletion
events = defines.events
script.on_event({
    events.on_resource_depleted
}, function(event)
    spawn_ore_patch_on_depleted_ore(event)
end)

-- manual planner remove tool
script.on_event({
  events.on_player_selected_area
}, function(event)
  if event.item == "vtk-deepcore-mining-planner" then
		local player = game.players[event.player_index]
		local surface = player.surface
		remove_ore_patch(player, surface, event.area, event.entities)
	end
end)

-- force DMCD rotation
script.on_event({
    events.on_robot_built_entity, 
    events.on_built_entity
}, function(event)
    force_rotation(event.created_entity)
end)

-- spawn cracks in the world on exploration
script.on_event({
    events.on_chunk_generated, 
}, function(event)
    place_deep_core_cracks(event.area, event.surface)
end)

-- on mod update fix DCMD rotation and ore patches yields for existing world before 1.8.2 version of the mod
script.on_configuration_changed(function(data)
  if data.mod_changes["vtk-deep-core-mining"].old_version ~= nil
    if data.mod_changes["vtk-deep-core-mining"].old_version < "1.8.2" then
      local orepatchesfixed = 0
      local dcmdfixed = 0
      
      -- scan surface for DCMD already installed in the world and rotate them south if needed and mark them on the map for their force to check their logistics
      for s, surface in pairs (game.surfaces) do
        for e, entity in pairs(surface.find_entities_filtered({name = "vtk-deepcore-mining-drill"})) do
          entity.rotatable = false 
          if entity.direction ~= defines.direction.south then
            entity.direction = defines.direction.south
            entity.force.add_chart_tag(entity.surface,{position=entity.position, text="Rotated DCMD need its output fixed.",icon={type="item", name=entity.name}})
            dcmdfixed = dcmdfixed + 1
          end
        end
        
        -- scan surface for all ore patches and set their amount to the new intended 100% yield
        local orepatches = {}
        orepatches = table.merge(orepatches, surface.find_entities_filtered({name = "iron-ore-patch"}), {option1=true})
        orepatches = table.merge(orepatches, surface.find_entities_filtered({name = "copper-ore-patch"}), {option1=true})
        orepatches = table.merge(orepatches, surface.find_entities_filtered({name = "coal-patch"}), {option1=true})
        orepatches = table.merge(orepatches, surface.find_entities_filtered({name = "stone-patch"}), {option1=true})
        orepatches = table.merge(orepatches, surface.find_entities_filtered({name = "uranium-ore-patch"}), {option1=true})
        orepatches = table.merge(orepatches, surface.find_entities_filtered({name = "crack"}), {option1=true})
        
        for o, orepatch in pairs(orepatches) do
          orepatch.amount = 10000
          orepatchesfixed = orepatchesfixed + 1
        end
        
        -- notify everyone
        for f, force in pairs(game.forces) do
          for p, player in pairs(force.players) do
            player.print("Deep Core Mining update : "..dcmdfixed.." DCMD have been force rotate south and might need logistic fixing. They have been marked on the map.")
            player.print("Deep Core Mining update : "..orepatchesfixed.." Ore patches & cracks have been updated and now have an undepleting yield of 100% to properly work with change Deep Core Mining drills power.")
          end
        end
      end
    end
  end
end)