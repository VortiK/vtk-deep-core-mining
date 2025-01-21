-- Factorio STD Lib
local Area = require('__vtk-deep-core-mining__/stdlib/area/area')
local Position = require('__vtk-deep-core-mining__/stdlib/area/position')
local string = require('__vtk-deep-core-mining__/stdlib/utils/string')

function get_filtered_amount(amount)
    -- spawn deep core ore chunks depending on the ore patch removed amount
    -- 10 000 = 3%
    -- 300% = 1 000 000
    -- Set to 10% of amount by removing ore patch and max 1 000 chunks (stacks to 100, so 10 stacks to be transportable)
    -- eg : Yields 100 per refine, so total = 1 000 000
    local amountospawn = 0.1 * amount
    -- prevent too much spawning if amount is over the top (ie creative mod / cheating, etc).
    if amountospawn > 1000 then
        amountospawn = 1000
    elseif amountospawn < 10 then
        amountospawn = 10
    end
    
    return amountospawn
end

function get_all_patches()
  local patches = {}
  for _, ore in pairs(prototypes.get_entity_filtered({{filter = "type", type = "resource"}})) do
    if ore.resource_category == "vtk-deepcore-mining-ore-patch" then
      table.insert(patches, ore.name)
    end
  end
  return patches
end

function spawn_ore_patch_on_depleted_ore(event)
  local ore = event.entity
  local surface = ore.surface
  local areaToScan = Position.expand_to_area(ore.position, settings.global["vtk-deep-core-mining-patch-spawn-distance"].value)
  local minspawnrange = settings.global["vtk-deep-core-mining-spawn-radius-from-start"].value
  local minrichness = settings.global["vtk-deep-core-mining-patch-min-richness"].value
  local maxrichness = settings.global["vtk-deep-core-mining-patch-max-richness"].value

  -- since it is a user setting, it is possible to break things up, making sure this won't
  if minrichness > maxrichness then
      minrichness = maxrichness
  end

  -- logic : 
  -- - if depleted ore has an equivalent patch entity
  -- - configuration(default 10) % chance to spawn an ore patch on depletion
  -- - check if there isn't a nearby ore patch already
  -- - then spawn it on the location the ore was depleted
  
  -- debug
  -- local player = game.players[1]
  -- player.print("VTK-DEEP-CORE-MINING_DEBUG")
  -- player.print("mined ore : "..serpent.block(ore.name))
  -- player.print(serpent.block(ore))
  -- player.print(serpent.block(player))
  
  if ore.prototype.mineable_properties.products ~= nil then
    if prototypes.entity[ore.prototype.mineable_properties.products[1].name.."-patch"] ~= nil
    then
      local orePatchToSpawn = prototypes.entity[ore.prototype.mineable_properties.products[1].name.."-patch"].name
      if not Position.inside(ore.position, Position.expand_to_area({x=0,y=0}, minspawnrange)) then
          local number = math.random(1, settings.global["vtk-deep-core-mining-patch-spawn-chance"].value)
          
          local patches = get_all_patches()
          entitiesCount = surface.count_entities_filtered{area = areaToScan, name = patches}
          
          if number == 1 and entitiesCount == 0 then
              oreamount = math.random(minrichness, maxrichness)
              local newOreEntity = surface.create_entity({name = orePatchToSpawn, amount = oreamount, position = ore.position, force = game.forces.neutral, raise_built = true})
          end
      end
    end
  end
end


function place_deep_core_cracks(area, surface)
    if not settings.global["vtk-deep-core-mining-spawn-cracks"].value then
        return
    end
    
    local minspawnrange = settings.global["vtk-deep-core-mining-spawn-radius-from-start"].value
    
  -- debug
  -- local player = game.players[1]
  -- player.print)

    -- only spawn deep core mining cracks in nauvis
    -- supports New Game Plus mod's "Nauvis plus" worlds
    if surface.name ~= "nauvis" and not string.contains(surface.name, "Nauvis plus") then
        return
    end
    
    -- lucky day ? (1 / 500)
    local luck = math.random(1, settings.global["vtk-deep-core-mining-crack-spawn-chance"].value)
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
    
  -- minimum distance from spawn where deepcore mining cracks appear (default 1)
  -- debug
  -- player.print("setting value "..minspawnrange)
  -- player.print("position x "..area.left_top.x.." y "..area.left_top.y)

  if Position.inside({ x = area.left_top.x, y = area.left_top.y}, Position.expand_to_area({ x = 0, y = 0 }, minspawnrange)) then
    return
  end
  
  create_crack(surface, area, 1)
end

function create_crack(surface, area, cracks)

  local stop = math.random(settings.global["vtk-deep-core-mining-spawn-min-group"].value, settings.global["vtk-deep-core-mining-spawn-max-group"].value)
  if cracks > stop then
    return
  end

  local x1 = area.left_top.x
  local y1 = area.left_top.y
  local x2 = area.right_bottom.x
  local y2 = area.right_bottom.y
  
  local crackrichness = settings.global["vtk-deep-core-mining-crack-richness"].value
  local attempts = 0
  -- try 10 times to find a valid position to spawn a crack otherwise abandon
  while attempts < 10 do
      local x = math.random(x1, x2)
      local y = math.random(y1, y2)
      
      local tile = surface.get_tile(x, y)
  -- debug player.print(serpent.block(tile.name))
    
      if tile.valid and surface.can_place_entity{name = "vtk-deepcore-mining-crack", position = tile.position} then
          local oreamount = crackrichness
          local createdentity = surface.create_entity({name = "vtk-deepcore-mining-crack", amount = oreamount, position = tile.position, force = game.forces.neutral})
          
          -- cleanup decoratives around the newly spawned crack
          local cleanupzone = Area.construct(createdentity.position.x, createdentity.position.y, createdentity.position.x, createdentity.position.y)
          surface.destroy_decoratives({area=Area.expand(cleanupzone, 0.6)})
    -- debug
    -- player.print("vtk-deepcore-mining-crack placed successfully")
    -- player.print(serpent.block(tile.position))
    -- player.print(serpent.block(cleanupzone))

          -- a crack was spawned succesfully, let's continue to try to spawn a group up to a maxium recurcively
          cracks = cracks + 1
          create_crack(surface, Area.expand(cleanupzone, 20), cracks)
          return
      end
      attempts = attempts + 1
  end
end


function remove_ore_patch(player, surface, area, entities)
    local patchescount = 0
    local sulfuricpatchescount = 0
    local dronescount = player.get_item_count("vtk-deepcore-mining-drone")
    local patches = {}
    local todo = true
    local sulfuricacidbarrel = "sulfuric-acid-barrel"
    local sulfuricacidbarrelcount = player.get_item_count(sulfuricacidbarrel)

    -- debug
    -- player.print("inventory : "..serpent.line(player.get_inventory(defines.inventory.player_main).get_contents()))
    for _,entity in pairs(entities) do
      -- player.print("entity : "..serpent.line(entity))
      -- player.print("entity : "..serpent.block(entity))
      -- player.print("name : "..entity.name)
      -- player.print("type : "..entity.type)
      -- player.print("entity proto : "..serpent.block(entity.prototype))
      -- player.print("proto : "..serpent.line(game.entity_prototypes[entity.name].name))
      -- player.print("cat : "..game.entity_prototypes[entity.name].resource_category)
      -- player.print("entity proto name : "..serpent.block(entity.prototype.name))
      -- player.print("entity proto cat : "..serpent.block(entity.prototype.resource_category))

        if entity.type == "resource"
            and (entity.prototype.resource_category == "vtk-deepcore-mining-ore-patch" 
            or entity.prototype.resource_category == "vtk-deepcore-mining-crack")
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

        if entity.name == "vtk-deepcore-mining-crack" then
          surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-ore-chunk", count = amountospawn}, true)
        
        elseif (entity.prototype.resource_category == "vtk-deepcore-mining-ore-patch") then
          local chunk = string.sub(entity.name, 1, -7) -- "iron-ore-patch"
          surface.spill_item_stack(entity.position, {name="vtk-deepcore-mining-"..chunk.."-chunk", count = amountospawn}, true)

        end
        entity.destroy({raise_destroy = true})
    end
    
    player.remove_item{name="vtk-deepcore-mining-drone", count = patchescount}
    if sulfuricpatchescount > 0 then
        player.remove_item{name=sulfuricacidbarrel, count = sulfuricpatchescount}
    end
end
