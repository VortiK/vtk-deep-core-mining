-- 1.8.2 update with DCMD rotation force and ore patches yields set for existing world before 1.8.2 version of the mod
function upgrade182(data)
    if data.mod_changes["vtk-deep-core-mining"].old_version < "1.8.2" then
        local orepatchesfixed = 0
        
        for s, surface in pairs (game.surfaces) do
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
                    if orepatchesfixed > 0 then
                        player.print("Deep Core Mining update : "..orepatchesfixed.." Ore patches & cracks have been updated and now have an undepleting yield of 100% to properly work with change Deep Core Mining drills power.")
                    end
                end
            end
        end
    end
end