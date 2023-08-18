
if not vtk_deepcoremining_supported_ores then vtk_deepcoremining_supported_ores = {} end

if not vtk_deepcoremining_blacklist_ores then vtk_deepcoremining_blacklist_ores = {} end

-- Test blacklist
-- vtk_deepcoremining_blacklist_ores["iron-ore"] = 1

local vtk_custom_ores = {}

-- Factorio \o/
if mods["base"] then
  vtk_custom_ores["iron-ore"] = {
    ["results"] = { { type="item", name="iron-ore", amount=1 } }, 
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
    ["results"] = { { type="item", name="copper-ore", amount=1 } }, 
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
    ["results"] = { { type="item", name="stone", amount=1 } }, 
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
    ["results"] = { { type="item", name="coal", amount=1 } }, 
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
    ["results"] = { { type="item", name="uranium-ore", amount=1 } }, 
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

-- Simple Silicon
if mods["SimpleSilicon"] then
  vtk_custom_ores["SiSi-quartz-ore"] = {
    ["results"] = { { type="item", name="SiSi-quartz", amount=1 } }, 
    ["mining-liquid"] = "water", 
    ["mining-liquid-amount"] = 100, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.20,
    ["tint"] = true,
    ["patchtint"] = true
  }
end

-- Angel's ores
if mods["angelsrefining"] then
  vtk_custom_ores["angels-ore1"] = {
    ["results"] = { { type="item", name="angels-ore1", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.50,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["angels-ore2"] = {
    ["results"] = { { type="item", name="angels-ore2", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.50,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["angels-ore3"] = {
    ["results"] = { { type="item", name="angels-ore3", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.30,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["angels-ore4"] = {
    ["results"] = { { type="item", name="angels-ore4", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.30,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["angels-ore5"] = {
    ["results"] = { { type="item", name="angels-ore5", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.30,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["angels-ore6"] = {
    ["results"] = { { type="item", name="angels-ore6", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.30,
    ["tint"] = true,
    ["patchtint"] = true
  }
end

-- Mad Clown's Extended Angel's Bob's Minerals ores
if mods["Clowns-Extended-Minerals"] then
  vtk_custom_ores["clowns-ore1"] = {
    ["results"] = { { type="item", name="clowns-ore1", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.07,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["clowns-ore2"] = {
    ["results"] = { { type="item", name="clowns-ore2", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.22,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["clowns-ore3"] = {
    ["results"] = { { type="item", name="clowns-ore3", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.22,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["clowns-ore4"] = {
    ["results"] = { { type="item", name="clowns-ore4", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.22,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["clowns-ore5"] = {
    ["results"] = { { type="item", name="clowns-ore5", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.22,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["clowns-ore6"] = {
    ["results"] = { { type="item", name="clowns-ore6", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.15,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["clowns-ore7"] = {
    ["results"] = { { type="item", name="clowns-ore7", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.15,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["clowns-ore8"] = {
    ["results"] = { { type="item", name="clowns-ore8", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.07,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["clowns-ore9"] = {
    ["results"] = { { type="item", name="clowns-ore9", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.07,
    ["tint"] = true,
    ["patchtint"] = true
  }
end

-- Bob's ores
if mods["bobores"] then
  vtk_custom_ores["tin-ore"] = {
    ["results"] = { { type="item", name="tin-ore", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["lead-ore"] = {
    ["results"] = { { type="item", name="lead-ore", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["quartz"] =  {
    ["results"] = { { type="item", name="quartz", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["silver-ore"] = {
    ["results"] = { { type="item", name="silver-ore", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["zinc-ore"] = {
    ["results"] = { { type="item", name="zinc-ore", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["gold-ore"] = {
    ["results"] = { { type="item", name="gold-ore", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["bauxite-ore"] = {
    ["results"] = { { type="item", name="bauxite-ore", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["rutile-ore"] = {
    ["results"] = { { type="item", name="rutile-ore", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["tungsten-ore"] = {
    ["results"] = { { type="item", name="tungsten-ore", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["thorium-ore"] = {
    ["results"] = { { type="item", name="thorium-ore", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["nickel-ore"] = {
    ["results"] = { { type="item", name="nickel-ore", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["cobalt-ore"] = {
    ["results"] = { { type="item", name="cobalt-ore", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["sulfur"] = {
    ["results"] = { { type="item", name="sulfur", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["gem-ore"] = {
    ["results"] = { { type="item", name="gem-ore", amount=1 } }, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
end

-- Krastorio 2 Rare Metals
if mods["Krastorio2"] then
  vtk_custom_ores["rare-metals"] = {
    ["results"] = { { type="item", name="raw-rare-metals", amount=1 } }, 
    ["mining-liquid"] = "chlorine", 
    ["mining-liquid-amount"] = 25, 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
end

-- Omnimatter
if mods["omnimatter"] then
  vtk_custom_ores["omnite"] = {
    ["results"] = { { type="item", name="omnite", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 1, -- obviously, there's only omnite :D
    ["tint"] = true,
    ["patchtint"] = true
  }
end

-- Leighzer's Morphite support
if mods["leighzermorphite"] then
  vtk_custom_ores["morphite-ore"] = {
    ["results"] = { { type="item", name="morphite-ore", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
end

-- Pyanodon's Raw Ores support
if mods["pyrawores"] then
  vtk_custom_ores["ore-tin"] = {
    ["results"] = { { type="item", name="ore-tin", amount=1 } },
    ["mining-liquid"] = "steam",
    ["mining-liquid-amount"] = 100,
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["refineliquid2"] = 160,
    ["refineliquid2_name"] = "steam",
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["ore-quartz"] = {
    ["results"] = { { type="item", name="ore-quartz", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["ore-aluminium"] = {
    ["results"] = { { type="item", name="ore-aluminium", amount=1 } },
    ["mining-liquid"] = "coal-gas",
    ["mining-liquid-amount"] = 100,
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["refineliquid2"] = 200,
    ["refineliquid2_name"] = "coal-gas",
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["ore-chromium"] = {
    ["results"] = { { type="item", name="ore-chromium", amount=1 } },
    ["mining-liquid"] = "syngas",
    ["mining-liquid-amount"] = 40,
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["refineliquid2"] = 100,
    ["refineliquid2_name"] = "syngas",
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["ore-lead"] = {
    ["results"] = { { type="item", name="ore-lead", amount=1 } },
    ["mining-liquid"] = "acetylene",
    ["mining-liquid-amount"] = 100,
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["refineliquid2"] = 200,
    ["refineliquid2_name"] = "acetylene",
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["ore-nickel"] = {
    ["results"] = { { type="item", name="ore-nickel", amount=1 } },
    ["mining-liquid"] = "syngas",
    ["mining-liquid-amount"] = 40,
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["refineliquid2"] = 1000,
    ["refineliquid2_name"] = "syngas",
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["raw-coal"] = {
    ["results"] = { { type="item", name="raw-coal", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["ore-titanium"] = {
    ["results"] = { { type="item", name="ore-titanium", amount=1 } },
    ["mining-liquid"] = "acetylene",
    ["mining-liquid-amount"] = 40,
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["refineliquid2"] = 100,
    ["refineliquid2_name"] = "acetylene",
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["ore-zinc"] = {
    ["results"] = { { type="item", name="ore-zinc", amount=1 } },
    ["mining-liquid"] = "syngas",
    ["mining-liquid-amount"] = 40,
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["refineliquid2"] = 100,
    ["refineliquid2_name"] = "syngas",
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
end

-- Pyanodons Coal Processing support
if mods["pycoalprocessing"] then
  vtk_custom_ores["borax"] = {
    ["results"] = { { type="item", name="raw-borax", amount=1 } },
    ["mining-liquid"] = "syngas",
    ["mining-liquid-amount"] = 50,
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["refineliquid2"] = 80,
    ["refineliquid2_name"] = "syngas",
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["niobium"] = {
    ["results"] = { { type="item", name="niobium-ore", amount=1 } },
    ["mining-liquid"] = "refsyngas",
    ["mining-liquid-amount"] = 60,
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["refineliquid2"] = 200,
    ["refineliquid2_name"] = "refsyngas",
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
end

-- Brevvens's Titanium
if mods["bztitanium"] then
  vtk_custom_ores["titanium-ore"] = {
    ["results"] = { { type="item", name="titanium-ore", amount=1 } },
    ["mining-liquid"] = "lubricant", 
    ["mining-liquid-amount"] = 30, 
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  }
end

-- Brevvens's Lead
if mods["bzlead"] then
  vtk_custom_ores["lead-ore"] = {
    ["results"] = { { type="item", name="lead-ore", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0.30,
    ["tint"] = true,
    ["patchtint"] = true
  }
end

-- Brevvens's Tungsten
if mods["bztungsten"] then
  vtk_custom_ores["tungsten-ore"] = {
    ["results"] = { { type="item", name="tungsten-ore", amount=1 } },
    ["mining-liquid"] = "water",
    ["mining-liquid-amount"] = 100,
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0.30,
    ["tint"] = true,
    ["patchtint"] = true
  }
end

-- Brevvens's Zirconium
if mods["bzzirconium"] then
  vtk_custom_ores["zircon"] = {
    ["results"] = { { type="item", name="zircon", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0.30,
    ["tint"] = true,
    ["patchtint"] = true
  }
end

-- Space Exploration's ore support
if mods["space-exploration"] then
  vtk_custom_ores["se-beryllium-ore"] = {
    ["results"] = { { type="item", name="se-beryllium-ore", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["se-cryonite"] = {
    ["results"] = { { type="item", name="se-cryonite", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["se-holmium-ore"] = {
    ["results"] = { { type="item", name="se-holmium-ore", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["se-iridium-ore"] = {
    ["results"] = { { type="item", name="se-iridium-ore", amount=1 } },
    ["mining-liquid"] = "sulfuric-acid", 
    ["mining-liquid-amount"] = 50, 
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["se-naquium-ore"] = {
    ["results"] = { { type="item", name="se-naquium-ore", amount=1 } },
    ["mining-liquid"] = "sulfuric-acid", 
    ["mining-liquid-amount"] = 200, 
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["se-vulcanite"] = {
    ["results"] = { { type="item", name="se-vulcanite", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["se-vitamelange"] = {
    ["results"] = { { type="item", name="se-vitamelange", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["se-water-ice"] = {
    ["results"] = { { type="item", name="se-water-ice", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0,
    ["tint"] = true,
    ["patchtint"] = true
  }
  vtk_custom_ores["se-methane-ice"] = {
    ["results"] = { { type="item", name="se-methane-ice", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0,
    ["tint"] = true,
    ["patchtint"] = true
  }
end

{
  --Industrial Revolution 2
  ["tin-ore"] = {
    ["results"] = { { type="item", name="tin-ore", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0.30,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["gold-ore"] = {
    ["results"] = { { type="item", name="gold-ore", amount=1 } },
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0.15,
    ["tint"] = true,
    ["patchtint"] = true
  },
}


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
        vtk_results = { { type="item", name=resource.minable.result, amount=1 } }
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
            table.insert(vtk_results, result)
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
        resources_to_support[resource.name]["mining-liquid-amount"] = resource.minable.fluid_amount*10
      end
      vtk_deepcoremining_supported_ores[resource.name] = resources_to_support[resource.name]
    end
  end
end

-- log(serpent.block(vtk_deepcoremining_supported_ores))

vtk_deepcoremining_supported_ores_count = table_size(vtk_deepcoremining_supported_ores)
