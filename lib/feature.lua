-- beacon usage with DCMDs is overpowered 
-- and can't flag them as not affected for this entity type (mining drill, but it somehow works for furnaces)
-- so we prevent building them around beacon and building beacons around them
function prevent_beacons(entity)
    if settings.global["vtk-deep-core-mining-allow-beacon"].value then
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

function adcmd_energy_companion_add(entity)
    local surface = entity.surface
    local force = entity.force
    local position = entity.position
    local companion = surface.create_entity({name = "vtk-deepcore-mining-drill-advanced-energy-companion", position = position, force = force})
    
    -- debug
    -- local player = game.players[1]
    -- player.print("VTK-DEEP-CORE-MINING_DEBUG")
    -- player.print("companion created : "..serpent.block(companion))
end

function adcmd_energy_companion_remove(entity)
    local surface = entity.surface
    local area = Position.expand_to_area(entity.position, 4)
    local entitiesCount = surface.count_entities_filtered{name = "vtk-deepcore-mining-drill-advanced-energy-companion", area = area}
    local companion = surface.find_entities_filtered{name="vtk-deepcore-mining-drill-advanced-energy-companion", area = area}

    if entitiesCount > 0 then
        -- debug
        -- local player = game.players[1]
        -- player.print("VTK-DEEP-CORE-MINING_DEBUG")
        -- player.print("companion destroyed : "..serpent.block(companion))
        
        companion[1].destroy()
    end
end

function adcmd_energy_switcher()
    for _, surface in pairs(game.surfaces) do
        local adcmdcompanions = surface.find_entities_filtered{name="vtk-deepcore-mining-drill-advanced-energy-companion"}
        for _, companion in pairs(adcmdcompanions) do
            -- debug
            --local player = game.players[1]
            -- player.print("VTK-DEEP-CORE-MINING_DEBUG")
            -- player.print(companion.help())
            -- player.print(companion.name .." ".. companion.unit_number .." energy : ".. companion.energy)
            -- player.print(companion.name .." ".. companion.unit_number .." usage : ".. companion.power_usage)
            
            local area = Position.expand_to_area(companion.position, 4)
            local adcmd = surface.find_entities_filtered{name="vtk-deepcore-mining-drill-advanced", area = area}
            for _, drill in pairs(adcmd) do
                -- player.print(adcmd.name .." ".. adcmd.unit_number .." status : ".. drill.status)
                if companion.energy < companion.power_usage then
                    drill.active = false
                else
                    drill.active = true
                end
            end
        end
    end
end
