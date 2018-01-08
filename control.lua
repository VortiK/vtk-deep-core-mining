function getboundingbox(position, radius) 
  if not position then error("Invalid position!", 2) end -- just error checking
  if not radius then local radius = 1 end -- default radius to one if not provided
  return {{position.x-radius, position.y-radius}, {position.x+radius, position.y+radius}} 
end

--- Tests if a position {x, y} is inside (inclusive) of area
-- @tparam LuaBoundingBox area the area
-- @tparam LuaPosition pos the position to check
-- @treturn boolean true if the position is inside of the area
function Area.inside(area, pos)
    fail_if_missing(pos, 'missing pos value')
    fail_if_missing(area, 'missing area value')
    pos = Position.to_table(pos)
    area = Area.to_table(area)

    local left_top = area.left_top
    local right_bottom = area.right_bottom
    return pos.x >= left_top.x and pos.y >= left_top.y and pos.x <= right_bottom.x and pos.y <= right_bottom.y
end

function spawn_ore_patch_on_depleted_ore(event)
  local ore = event.entity
  local surface = ore.surface
  local areaToScan = getboundingbox(ore.position, 5)
  local orePatchable = {"iron-ore", "copper-ore", "coal"}
  
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
  for _,v in pairs(orePatchable) do
    if v == ore.name then
      validOre = true
      break
    end
  end
  
  if validOre then
    orePatch = ore.name .. "-patch"
    local number = math.random(1, 10)
    entitiesCount = surface.count_entities_filtered{area = areaToScan, name = orePatch}
    
    if number == 1 and entitiesCount == 0 then
      oreamount = math.random(60000, 300000)
      newOreEntity = surface.create_entity({name = orePatch, amount = oreamount, position = ore.position, force = game.forces.neutral})
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
