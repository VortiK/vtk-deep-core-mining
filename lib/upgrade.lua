-- 1.8.2 update with DCMD rotation force and ore patches yields set for existing world before 1.8.2 version of the mod
function upgrade182(data)
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
            
            -- notify everyone if needed
            for f, force in pairs(game.forces) do
                for p, player in pairs(force.players) do
                    if dcmdfixed > 0 then
                        player.print("Deep Core Mining update : "..dcmdfixed.." DCMD have been force rotate south and might need logistic fixing. They have been marked on the map.")
                    end
                    if orepatchesfixed > 0 then
                        player.print("Deep Core Mining update : "..orepatchesfixed.." Ore patches & cracks have been updated and now have an undepleting yield of 100% to properly work with change Deep Core Mining drills power.")
                    end
                end
            end
        end
    end
end