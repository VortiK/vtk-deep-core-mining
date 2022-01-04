if not vtk_deepcoremining_supported_ores then vtk_deepcoremining_supported_ores = {} end

if not mods.angelsrefining then
  vtk_deepcoremining_supported_ores = {
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
    }
  }
end

local alwaysthereore = {
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
  }
}
vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, alwaysthereore)

-- SimpleSilicon's ore support
if mods["SimpleSilicon"] then
  local SimpleSilicon_ore = {
    ["SiSi-quartz-ore"] = {
      ["result"] = "SiSi-quartz", 
      ["mining-liquid"] = "water", 
      ["mining-liquid-amount"] = 100, 
      ["img"] = "ore", 
      ["patchimg"] = "ore", 
      ["frame"] = 3, 
      ["variation"] = 1,
      ["refineamount"] = 80, 
      ["refineliquid"] = 20, 
      ["probability"] = 0.20,
      ["tint"] = true,
      ["patchtint"] = true
    }
  }
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, SimpleSilicon_ore)
end

-- Angel's ore support
if mods.angelsrefining then
  local angelsores = {
    ["angels-ore1"] = {
      ["result"] = "angels-ore1", 
      ["img"] = "ore", 
      ["patchimg"] = "ore", 
      ["frame"] = 3, 
      ["variation"] = 1,
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
      ["frame"] = 3, 
      ["variation"] = 1,
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
      ["frame"] = 3, 
      ["variation"] = 1,
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
      ["frame"] = 3, 
      ["variation"] = 1,
      ["refineamount"] = 80, 
      ["refineliquid"] = 20, 
      ["probability"] = 0.30,
      ["tint"] = true,
      ["patchtint"] = true
    },
  }
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, angelsores)

  if mods.bobplates then
    local angelsbobores = {
      ["angels-ore5"] = {
        ["result"] = "angels-ore5", 
        ["img"] = "ore", 
        ["patchimg"] = "ore", 
        ["frame"] = 3, 
        ["variation"] = 1,
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
        ["frame"] = 3, 
        ["variation"] = 1,
        ["refineamount"] = 80, 
        ["refineliquid"] = 20, 
        ["probability"] = 0.30,
        ["tint"] = true,
        ["patchtint"] = true
      },
    }
    vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, angelsbobores)
  end

  if mods["Clowns-Extended-Minerals"] then
    local clownsores = {
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
    }
    vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, clownsores)
  end
  
  if mods["bobplates"] then
    local angelbobsclownsores = {
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
      ["clowns-ore8"] = {
        ["result"] = "clowns-ore8", 
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
      ["clowns-ore9"] = {
        ["result"] = "clowns-ore9", 
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
    vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, angelbobsclownsores)
  end
end

-- Bob's ore support
if not mods.angelsrefining and mods.bobores then
  local bobores = {
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
  }
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, bobores)
end

-- Krastorio 2 Rare Metals ore support
if mods["Krastorio2"] then
  local Krastorio2_ore = {
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
    }
  }
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, Krastorio2_ore)
end

-- Omnimatter support
if mods.omnimatter then
  local omnimatter = {
    ["omnite"] = {
      ["result"] = "omnite",
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
  }
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, omnimatter)
end

-- Leighzer's Morphite support
if mods.leighzermorphite then
  local leighzermorphite = {
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
  }
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, leighzermorphite)
end

-- Pyanodons Raw Ores support
if mods.pyrawores then
  local pyrawores = {
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
  }
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, pyrawores)
end

-- Pyanodons Coal Processing support
if mods.pycoalprocessing then
  local pycoalprocessing = {
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
  }
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, pycoalprocessing)
end

-- Brevvens's Titanium support
if mods.bztitanium then
  local bztitanium = {
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
  }
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, bztitanium)
end

-- Brevvens's Lead support
if mods.bzlead and not mods.bobores and not mods.angelsrefining then
  local bzlead = {
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
  }
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, bzlead)
end

-- Brevvens's Tungsten support
if mods.bztungsten and not mods.bobores then
  local bztungsten = {
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
    }
  }
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, bztungsten)
end

-- Brevvens's Zirconium support
if mods.bzzirconium then
  local bzzirconium = {
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
    }
  }
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, bzzirconium)
end

-- Space Exploration's ore support
if mods["space-exploration"] then
  local seores = {
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
  }
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, seores)
end

--Industrial Revolution 2 ore support
if mods.IndustrialRevolution then
  local IndustrialRevolution = {
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
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, IndustrialRevolution)
end

-- somehow table.count doesn't exists in lua and you have to do it yourself
vtk_deepcoremining_supported_ores_count = 0

for k,v in pairs(vtk_deepcoremining_supported_ores) do
  if v['probability'] > 0 then
    vtk_deepcoremining_supported_ores_count = vtk_deepcoremining_supported_ores_count + 1
  end
end
