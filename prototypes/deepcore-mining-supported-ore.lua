if not vtk_deepcoremining_supported_ores then vtk_deepcoremining_supported_ores = {} end

if not vtk_deepcoremining_blacklist_ores then vtk_deepcoremining_blacklist_ores = {} end

-- Test blacklist
-- vtk_deepcoremining_blacklist_ores["iron-ore"] = 1

local vtk_custom_ores = {}

-- Factorio \o/
if mods["base"] then
  vtk_custom_ores["iron-ore"] = {
    ["results"] = { { type = "item", name = "iron-ore", amount = 1 } },
    ["img"] = "ore",
    ["patchimg"] = "iron-ore",
    ["frame"] = 3,
    ["variation"] = 1,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0.50,
    ["tint"] = true,
    ["patchtint"] = false
  }
  vtk_custom_ores["copper-ore"] = {
    ["results"] = { { type = "item", name = "copper-ore", amount = 1 } },
    ["img"] = "ore",
    ["patchimg"] = "copper-ore",
    ["frame"] = 3,
    ["variation"] = 1,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0.40,
    ["tint"] = true,
    ["patchtint"] = false
  }
  vtk_custom_ores["stone"] = {
    ["results"] = { { type = "item", name = "stone", amount = 1 } },
    ["img"] = "ore",
    ["patchimg"] = "stone",
    ["frame"] = 3,
    ["variation"] = 1,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0.07,
    ["tint"] = true,
    ["patchtint"] = false
  }
  vtk_custom_ores["coal"] = {
    ["results"] = { { type = "item", name = "coal", amount = 1 } },
    ["img"] = "ore",
    ["patchimg"] = "coal",
    ["frame"] = 3,
    ["variation"] = 1,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0.06,
    ["tint"] = true,
    ["patchtint"] = false
  }
  vtk_custom_ores["uranium-ore"] = {
    ["results"] = { { type = "item", name = "uranium-ore", amount = 1 } },
    ["mining-liquid"] = "sulfuric-acid",
    ["mining-liquid-amount"] = 100,
    ["img"] = "ore",
    ["patchimg"] = "uranium-ore",
    ["frame"] = 3,
    ["variation"] = 1,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0.01,
    ["tint"] = true,
    ["patchtint"] = false
  }
end

-- Space Age \o/
if mods["space-age"] then
  vtk_custom_ores["tungsten-ore"] = {
    ["results"] = { { type = "item", name = "tungsten-ore", amount = 1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["calcite"] = {
    ["results"] = { { type = "item", name = "calcite", amount = 1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["tint"] = true,
    ["patchtint"] = true
  }

  vtk_deepcoremining_blacklist_ores["scrap"] = 1
end

if mods["Cerys-Moon-of-Fulgora"] then
  vtk_deepcoremining_blacklist_ores["cerys-nuclear-scrap"] = 1
  vtk_deepcoremining_blacklist_ores["cerys-nitrogen-rich-minerals"] = 1
  vtk_deepcoremining_blacklist_ores["methane-ice"] = 1
end

-- Process all existing resources to create deepcore mining reference for them to create associated patches, items, refining and technology
for _, resource in pairs(data.raw.resource) do
  local proceed = false
  local vtk_results = nil

  -- log(" new ore found : "..resource.name)
  -- log(serpent.block(resource))
  -- log("minable "..serpent.block(resource.minable))
  -- log("results "..serpent.block(resource.minable.results))
  -- log("infinite "..serpent.block(resource.infinite))
  -- log("map_grid "..serpent.block(resource.map_grid))
  -- log("autoplace "..serpent.block(resource.autoplace))
  if resource.minable then
    if resource.infinite then
      proceed = false
    elseif resource.autoplace == nil then
      proceed = false
    elseif resource.map_grid == false then
      proceed = false
    elseif resource.minable.result then
      vtk_results = { { type = "item", name = resource.minable.result, amount = 1 } }
      proceed = true
    elseif resource.minable.results then
      vtk_results = {}
      for _, result in ipairs(resource.minable.results) do
        -- log("loop _ "..serpent.block(_))
        -- log("loop result "..serpent.block(result))
        -- log("loop result.name "..serpent.block(result.name))
        if result.name and result.type ~= "fluid" then
          table.insert(vtk_results, result)
          proceed = true
        elseif result[1] then
          if result[2] then
            table.insert(vtk_results, { type = "item", name = result[1], amount = result[2] })
          else
            table.insert(vtk_results, { type = "item", name = result[1], amount = 1 })
          end
          proceed = true
        end
      end
    end
  end

  if vtk_deepcoremining_blacklist_ores[resource.name] then
    proceed = false
  end

  if proceed then
    -- custom sprites for vanilla and explicitly supported mod's ores, else generic gfx and stats
    if vtk_custom_ores[resource.name] then
      vtk_deepcoremining_supported_ores[resource.name] = vtk_custom_ores[resource.name]
    else
      local resources_to_support = {
        [resource.name] = {
          ["results"] = vtk_results,
          ["img"] = "ore",
          ["patchimg"] = "ore",
          ["frame"] = 4,
          ["variation"] = 3,
          ["refineamount"] = 80,
          ["refineliquid"] = 20,
          ["probability"] = 0.10,
          ["tint"] = true,
          ["patchtint"] = true,
        }
      }
      if resource.minable.required_fluid then
        resources_to_support[resource.name]["mining-liquid"] = resource.minable.required_fluid
      end
      if resource.minable.fluid_amount then
        resources_to_support[resource.name]["mining-liquid-amount"] = resource.minable.fluid_amount * 10
      end
      vtk_deepcoremining_supported_ores[resource.name] = resources_to_support[resource.name]
    end
  end
end

-- log(serpent.block(vtk_deepcoremining_supported_ores))

vtk_deepcoremining_supported_ores_count = table_size(vtk_deepcoremining_supported_ores)
