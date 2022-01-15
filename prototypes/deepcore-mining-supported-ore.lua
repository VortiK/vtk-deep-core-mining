
if not vtk_deepcoremining_supported_ores then vtk_deepcoremining_supported_ores = {} end

local vtk_custom_ores = {

  -- Factorio \o/
  ["iron-ore"] = {
    ["result"] = "iron-ore", 
    ["img"] = "ore", 
    ["patchimg"] = "iron-ore", 
    ["frame"] = 3, 
    ["variation"] = 1,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.50,
    ["tint"] = true,
    ["patchtint"] = false
  },
  ["copper-ore"] = {
    ["result"] = "copper-ore", 
    ["img"] = "ore", 
    ["patchimg"] = "copper-ore", 
    ["frame"] = 3,
    ["variation"] = 1,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.40,
    ["tint"] = true,
    ["patchtint"] = false
  },
  ["stone"] = {
    ["result"] = "stone", 
    ["img"] = "ore", 
    ["patchimg"] = "stone", 
    ["frame"] = 3,
    ["variation"] = 1,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.07,
    ["tint"] = true,
    ["patchtint"] = false
  },
  ["coal"] = {
    ["result"] = "coal", 
    ["img"] = "ore", 
    ["patchimg"] = "coal", 
    ["frame"] = 3,
    ["variation"] = 1,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.06,
    ["tint"] = true,
    ["patchtint"] = false
  },
  ["uranium-ore"] = {
    ["result"] = "uranium-ore", 
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
  },

  -- Simple Silicon
  ["SiSi-quartz-ore"] = {
    ["result"] = "SiSi-quartz", 
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
  },

  -- Angel's ores
  ["angels-ore1"] = {
    ["result"] = "angels-ore1", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.50,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["angels-ore2"] = {
    ["result"] = "angels-ore2", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.50,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["angels-ore3"] = {
    ["result"] = "angels-ore3", 
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
  ["angels-ore4"] = {
    ["result"] = "angels-ore4", 
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
  ["angels-ore5"] = {
    ["result"] = "angels-ore5", 
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
  ["angels-ore6"] = {
    ["result"] = "angels-ore6", 
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

  -- Mad Clown's Extended Angel's Bob's Minerals ores
  ["clowns-ore1"] = {
    ["result"] = "clowns-ore1", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.07,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["clowns-ore2"] = {
    ["result"] = "clowns-ore2", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.22,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["clowns-ore3"] = {
    ["result"] = "clowns-ore3", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.22,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["clowns-ore4"] = {
    ["result"] = "clowns-ore4", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.22,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["clowns-ore5"] = {
    ["result"] = "clowns-ore5", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.22,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["clowns-ore6"] = {
    ["result"] = "clowns-ore7", 
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
  ["clowns-ore7"] = {
    ["result"] = "clowns-ore7", 
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
  ["clowns-ore8"] = {
    ["result"] = "clowns-ore8", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.07,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["clowns-ore9"] = {
    ["result"] = "clowns-ore9", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.07,
    ["tint"] = true,
    ["patchtint"] = true
  },

  -- Bob's ores
  ["tin-ore"] = {
    ["result"] = "tin-ore", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["lead-ore"] = {
    ["result"] = "lead-ore", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["quartz"] =  {
    ["result"] = "quartz", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["silver-ore"] = {
    ["result"] = "silver-ore", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["zinc-ore"] = {
    ["result"] = "zinc-ore", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["gold-ore"] = {
    ["result"] = "gold-ore", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["bauxite-ore"] = {
    ["result"] = "bauxite-ore", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["rutile-ore"] = {
    ["result"] = "rutile-ore", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["tungsten-ore"] = {
    ["result"] = "tungsten-ore", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["thorium-ore"] = {
    ["result"] = "thorium-ore", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["nickel-ore"] = {
    ["result"] = "nickel-ore", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["cobalt-ore"] = {
    ["result"] = "cobalt-ore", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["sulfur"] = {
    ["result"] = "sulfur", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["gem-ore"] = {
    ["result"] = "gem-ore", 
    ["img"] = "ore", 
    ["patchimg"] = "ore", 
    ["frame"] = 4, 
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },

  -- Krastorio 2 Rare Metals
  ["rare-metals"] = {
    ["result"] = "raw-rare-metals", 
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
  },

  -- Omnimatter
  ["omnite"] = {
    ["result"] = "omnite",
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 1, -- obviously, there's only omnite :D
    ["tint"] = true,
    ["patchtint"] = true
  },

  -- Leighzer's Morphite support
  ["morphite-ore"] = {
    ["result"] = "morphite-ore",
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },

  -- Pyanodon's Raw Ores support
  ["ore-tin"] = {
    ["result"] = "ore-tin",
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
  },
  ["ore-quartz"] = {
    ["result"] = "ore-quartz",
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["ore-aluminium"] = {
    ["result"] = "ore-aluminium",
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
  },
  ["ore-chromium"] = {
    ["result"] = "ore-chromium",
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
  },
  ["ore-lead"] = {
    ["result"] = "ore-lead",
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
  },
  ["ore-nickel"] = {
    ["result"] = "ore-nickel",
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
  },
  ["raw-coal"] = {
    ["result"] = "raw-coal",
    ["img"] = "ore",
    ["patchimg"] = "ore", 
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80, 
    ["refineliquid"] = 20, 
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["ore-titanium"] = {
    ["result"] = "ore-titanium",
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
  },
  ["ore-zinc"] = {
    ["result"] = "ore-zinc",
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
  },

  -- Pyanodons Coal Processing support
  ["borax"] = {
    ["result"] = "raw-borax",
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
  },
  ["niobium"] = {
    ["result"] = "niobium-ore",
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
  },
  
  -- Brevvens's Titanium
  ["titanium-ore"] = {
    ["result"] = "titanium-ore",
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0.10,
    ["tint"] = true,
    ["patchtint"] = true
  },

  -- Brevvens's Lead
  ["lead-ore"] = {
    ["result"] = "lead-ore",
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
  
  -- Brevvens's Tungsten
  ["tungsten-ore"] = {
    ["result"] = "tungsten-ore",
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
  },
  
  -- Brevvens's Zirconium
  ["zircon"] = {
    ["result"] = "zircon",
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
  
  -- Space Exploration's ore support
  ["se-beryllium-ore"] = {
    ["result"] = "se-beryllium-ore",
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["se-cryonite"] = {
    ["result"] = "se-cryonite",
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["se-holmium-ore"] = {
    ["result"] = "se-holmium-ore",
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["se-iridium-ore"] = {
    ["result"] = "se-iridium-ore",
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
  },
  ["se-naquium-ore"] = {
    ["result"] = "se-naquium-ore",
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
  },
  ["se-vulcanite"] = {
    ["result"] = "se-vulcanite",
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0,
    ["tint"] = true,
    ["patchtint"] = true
  },
  ["se-vitamelange"] = {
    ["result"] = "se-vitamelange",
    ["img"] = "ore",
    ["patchimg"] = "ore",
    ["frame"] = 4,
    ["variation"] = 3,
    ["refineamount"] = 80,
    ["refineliquid"] = 20,
    ["probability"] = 0,
    ["tint"] = true,
    ["patchtint"] = true
  },
  
  --Industrial Revolution 2
  ["tin-ore"] = {
    ["result"] = "tin-ore",
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
    ["result"] = "gold-ore",
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
  local vtk_result = nil
  
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
        vtk_result = resource.minable.result
        proceed = true
    elseif resource.minable.results then
      for _, result in ipairs(resource.minable.results) do
          -- log("loop _ "..serpent.block(_))
          -- log("loop result "..serpent.block(result))
          -- log("loop result.name "..serpent.block(result.name))
          if result.name and result.type ~= "fluid" then
            vtk_result = result.name
            proceed = true
          elseif result[1] then
            vtk_result = result[1]
            proceed = true
          end
      end
    end
  end
  
  if proceed then
    -- custom sprites for vanilla and explicitly supported mod's ores, else generic gfx and stats
    if vtk_custom_ores[resource.name] then
      vtk_deepcoremining_supported_ores[resource.name] = vtk_custom_ores[resource.name]
    else 
      local resources_to_support = {
        [resource.name] = {
          ["result"] = vtk_result,
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
      vtk_deepcoremining_supported_ores[resource.name] = resources_to_support[resource.name]
    end
  end
end

-- log(serpent.block(vtk_deepcoremining_supported_ores))

vtk_deepcoremining_supported_ores_count = table_size(vtk_deepcoremining_supported_ores)
