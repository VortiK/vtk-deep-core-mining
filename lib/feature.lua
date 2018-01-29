-- deep core mining drills sprites are not rotatable, so force then south!
function force_rotation(entity)
    if entity.name == "vtk-deepcore-mining-drill" or entity.name == "vtk-deepcore-mining-drill-advanced" then
        entity.rotatable = false
        entity.direction = defines.direction.south
    end
end

-- beacon usage with DCMDs is overpowered 
-- and can't flag them as not affected for this entity type (mining drill, but it somehow works for furnaces)
-- so we prevent building them around beacon and building beacons around them
function prevent_beacons(entity)
    if not settings.global["vtk-deep-core-mining-allow-beacon"].value then
        return
    end
    
    local builtentityname = entity.name
    -- refuse DCMDs placeing if beacons presents around
    if builtentityname == "vtk-deepcore-mining-drill" or entity.name == "vtk-deepcore-mining-drill-advanced" then
        local area = Position.expand_to_area(entity.position, 7)
        local surface = entity.surface
        local force = entity.force
        local entitiesCount = 0
        entitiesCount = surface.count_entities_filtered{area = area, name = "beacon"}
        if entitiesCount > 0 then
            surface.spill_item_stack(entity.position, {name=builtentityname, count = 1}, true)
            entity.destroy()
            -- notify everyone
            for p, player in pairs(force.players) do
                player.print("It is not possible to place Beacons near Deep Core Mining Drills. Item was dropped on the ground.")
            end
        end
    end

    -- refuse beacon placing if DCMDs are present around
    if builtentityname == "beacon" then
        local area = Position.expand_to_area(entity.position, 4)
        local surface = entity.surface
        local force = entity.force
        local entitiesCount = 0
        entitiesCount = surface.count_entities_filtered{area = area, name = "vtk-deepcore-mining-drill"}
        entitiesCount = entitiesCount + surface.count_entities_filtered{area = area, name = "vtk-deepcore-mining-drill-advanced"}
        if entitiesCount > 0 then
            surface.spill_item_stack(entity.position, {name=builtentityname, count = 1}, true)
            entity.destroy()
            -- notify everyone
            for p, player in pairs(force.players) do
                player.print("It is not possible to place Deep Core Mining Drills near Beacons. Item was dropped on the ground.")
            end
        end
    end
end