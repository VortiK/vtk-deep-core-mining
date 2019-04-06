if mods.bobores and not mods.angelsrefining then
  if bobmods.ores.settings.UnsortedGemOre == true then
    bobmods.lib.resource.add_result("gem-ore-patch", {name="gem-ore"})
    data.raw.recipe["vtk-deepcore-mining-gem-ore-chunk-refining"].results = 
    {
        {type="item", name="gem-ore", amount=vtk_deepcoremining_supported_ores["gem-ore"].refineamount}, 
    }
    -- table.insert(data.raw['recipe']['vtk-deepcore-mining-gem-ore-chunk-refining']['results'],
    -- {name = "vtk-deepcore-mining-"..ore.."-chunk", probability = oredata.probability, amount = 10 })

  else
    bobmods.lib.resource.add_result("gem-ore-patch", {name="diamond-ore", probability = bobmods.gems.DiamondRatio})
    bobmods.lib.resource.add_result("gem-ore-patch", {name="emerald-ore", probability = bobmods.gems.EmeraldRatio})
    bobmods.lib.resource.add_result("gem-ore-patch", {name="amethyst-ore", probability = bobmods.gems.AmethystRatio})
    bobmods.lib.resource.add_result("gem-ore-patch", {name="ruby-ore", probability = bobmods.gems.RubyRatio})
    bobmods.lib.resource.add_result("gem-ore-patch", {name="sapphire-ore", probability = bobmods.gems.SapphireRatio})
    bobmods.lib.resource.add_result("gem-ore-patch", {name="topaz-ore", probability = bobmods.gems.TopazRatio})

    data.raw.recipe["vtk-deepcore-mining-gem-ore-chunk-refining"].results = 
    {
        {type="item", name="diamond-ore", probability = bobmods.gems.DiamondRatio, amount=vtk_deepcoremining_supported_ores["gem-ore"].refineamount/6}, 
        {type="item", name="emerald-ore", probability = bobmods.gems.EmeraldRatio, amount=vtk_deepcoremining_supported_ores["gem-ore"].refineamount/6}, 
        {type="item", name="amethyst-ore", probability = bobmods.gems.AmethystRatio, amount=vtk_deepcoremining_supported_ores["gem-ore"].refineamount/6}, 
        {type="item", name="ruby-ore", probability = bobmods.gems.RubyRatio, amount=vtk_deepcoremining_supported_ores["gem-ore"].refineamount/6}, 
        {type="item", name="sapphire-ore", probability = bobmods.gems.SapphireRatio, amount=vtk_deepcoremining_supported_ores["gem-ore"].refineamount/6}, 
        {type="item", name="topaz-ore", probability = bobmods.gems.TopazRatio, amount=vtk_deepcoremining_supported_ores["gem-ore"].refineamount/6}, 
    }
  end

  if bobmods.ores.settings.GemsFromOtherOres == true then
    bobmods.lib.resource.add_result("coal-patch", {name="diamond-ore", probability = bobmods.ores.settings.GemProbability * bobmods.gems.DiamondRatio})

    bobmods.lib.resource.add_result("quartz-patch", {name="emerald-ore", probability = bobmods.ores.settings.GemProbability * bobmods.gems.EmeraldRatio})
    bobmods.lib.resource.add_result("quartz-patch", {name="amethyst-ore", probability = bobmods.ores.settings.GemProbability * bobmods.gems.AmethystRatio})

    bobmods.lib.resource.add_result("bauxite-ore-patch", {name="ruby-ore", probability = bobmods.ores.settings.GemProbability * bobmods.gems.RubyRatio})
    bobmods.lib.resource.add_result("bauxite-ore-patch", {name="sapphire-ore", probability = bobmods.ores.settings.GemProbability * bobmods.gems.SapphireRatio})
    bobmods.lib.resource.add_result("bauxite-ore-patch", {name="topaz-ore", probability = bobmods.ores.settings.GemProbability * bobmods.gems.TopazRatio})
  end


  if bobmods.ores.settings.LeadGivesNickel == true then
    bobmods.lib.resource.add_result("lead-ore-patch", {name = "nickel-ore", probability = bobmods.ores.settings.LeadNickelRatio})
  end


  if bobmods.ores.settings.NickelGivesCobalt == true then
    if bobmods.ores.nickel.enabled then
      bobmods.lib.resource.add_result("nickel-ore-patch", {name = "cobalt-ore", probability = bobmods.ores.settings.NickelCobaltRatio})
    else
      if bobmods.ores.settings.LeadGivesNickel == true then
        bobmods.lib.resource.add_result("lead-ore-patch", {name = "cobalt-ore", probability = bobmods.ores.settings.LeadNickelRatio * bobmods.ores.settings.NickelCobaltRatio})
      end
    end
  end

  if data.raw.item["obsidian"] then
    bobmods.lib.resource.add_result("cobalt-ore-patch", {name = "obsidian", amount_min = 1, amount_max = 12, probability = 0.25})
  end
end

-- Disallow AAI vehicles to mine resource-category vtk-deepcore-mining-ore-patch and vtk-deepcore-mining-crack
--[[
if mods["aai-vehicles-miner"] then
  for _, resource in pairs(data.raw.resource) do

    if resource.category ~= nil and string.match(resource.category, "vtk-deepcore-mining") then
      settings.global["vehicle-mining-disallow-resources"].value = settings.global["vehicle-mining-disallow-resources"].value .. " " .. resource.name 
    end
  end
end
]]--