if not vtk_deepcoremining_supported_ores then vtk_deepcoremining_supported_ores = {} end

vtk_deepcoremining_supported_ores = {
  ["iron-ore"] = {
    ["result"] = "iron-ore",
    ["img"] = "iron-ore", 
    ["frame"] = 3, 
    ["variation"] = 1,
    ["refineamount"] = 200, 
    ["refineliquid"] = 50, 
    ["probability"] = 0.30,
    ["tint"] = false
  },
  ["copper-ore"] = {
    ["result"] = "copper-ore", 
    ["img"] = "copper-ore", 
    ["frame"] = 3,
    ["variation"] = 1,
    ["refineamount"] = 100, 
    ["refineliquid"] = 50, 
    ["probability"] = 0.30,
    ["tint"] = false
  },
  ["coal"] = {
    ["result"] = "coal", 
    ["img"] = "coal", 
    ["frame"] = 3,
    ["variation"] = 1,
    ["refineamount"] = 50, 
    ["refineliquid"] = 10, 
    ["probability"] = 0.15,
    ["tint"] = false
  },
  ["stone"] = {
    ["result"] = "stone", 
    ["img"] = "stone", 
    ["frame"] = 3,
    ["variation"] = 1,
    ["refineamount"] = 50, 
    ["refineliquid"] = 10, 
    ["probability"] = 0.15,
    ["tint"] = false
  },
  ["uranium-ore"] = {
    ["result"] = "uranium-ore", 
    ["mining-liquid"] = "sulfuric-acid", 
    ["mining-liquid-amount"] = 100, 
    ["img"] = "uranium-ore", 
    ["frame"] = 3, 
    ["variation"] = 1,
    ["refineamount"] = 10, 
    ["refineliquid"] = 400, 
    ["probability"] = 0.15,
    ["tint"] = false
  }
}

-- SimpleSilicon's ore support
if mods["SimpleSilicon"] then
  local SimpleSilicon_ore = {
    ["SiSi-quartz-ore"] = {
      ["result"] = "SiSi-quartz", 
      ["mining-liquid"] = "water", 
      ["mining-liquid-amount"] = 400, 
      ["img"] = "ore", 
      ["frame"] = 3, 
      ["variation"] = 1,
      ["refineamount"] = 75, 
      ["refineliquid"] = 20, 
      ["probability"] = 0.20,
      ["tint"] = true
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
      ["frame"] = 3, 
      ["variation"] = 1,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.30,
      ["tint"] = true
    },
    ["angels-ore2"] = {
      ["result"] = "angels-ore2", 
      ["img"] = "ore", 
      ["frame"] = 3, 
      ["variation"] = 1,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.30,
      ["tint"] = true
    },
    ["angels-ore3"] = {
      ["result"] = "angels-ore3", 
      ["img"] = "ore", 
      ["frame"] = 3, 
      ["variation"] = 1,
      ["refineamount"] = 100, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.30,
      ["tint"] = true
    },
    ["angels-ore4"] = {
      ["result"] = "angels-ore4", 
      ["img"] = "ore", 
      ["frame"] = 3, 
      ["variation"] = 1,
      ["refineamount"] = 100, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.30,
      ["tint"] = true
    },
  }

  if mods.bobplates then
    local angelsbobores = {
      ["angels-ore5"] = {
        ["result"] = "angels-ore5", 
        ["img"] = "ore", 
        ["frame"] = 3, 
        ["variation"] = 1,
        ["refineamount"] = 100, 
        ["refineliquid"] = 50, 
        ["probability"] = 0.30,
        ["tint"] = true
      },
      ["angels-ore6"] = {
        ["result"] = "angels-ore6", 
        ["img"] = "ore", 
        ["frame"] = 3, 
        ["variation"] = 1,
        ["refineamount"] = 100, 
        ["refineliquid"] = 50, 
        ["probability"] = 0.30,
        ["tint"] = true
      },
    }
    angelsores = table.merge(angelsores, angelsbobores)
  end

  if mods["Clowns-Extended-Minerals"] then
    local angelbobsclownsores = {
      ["clowns-ore1"] = {
        ["result"] = "clowns-ore1", 
        ["img"] = "ore", 
        ["frame"] = 4,
        ["variation"] = 3,
        ["refineamount"] = 25, 
        ["refineliquid"] = 22, 
        ["probability"] = 0.07,
        ["tint"] = true
      },
      ["clowns-ore2"] = {
        ["result"] = "clowns-ore2", 
        ["img"] = "ore", 
        ["frame"] = 4,
        ["variation"] = 3,
        ["refineamount"] = 75, 
        ["refineliquid"] = 37, 
        ["probability"] = 0.22,
        ["tint"] = true
      },
      ["clowns-ore3"] = {
        ["result"] = "clowns-ore3", 
        ["img"] = "ore", 
        ["frame"] = 4,
        ["variation"] = 3,
        ["refineamount"] = 75, 
        ["refineliquid"] = 37, 
        ["probability"] = 0.22,
        ["tint"] = true
      },
      ["clowns-ore4"] = {
        ["result"] = "clowns-ore4", 
        ["img"] = "ore", 
        ["frame"] = 4,
        ["variation"] = 3,
        ["refineamount"] = 75, 
        ["refineliquid"] = 37, 
        ["probability"] = 0.22,
        ["tint"] = true
      },
      ["clowns-ore5"] = {
        ["result"] = "clowns-ore5", 
        ["img"] = "ore", 
        ["frame"] = 4,
        ["variation"] = 3,
        ["refineamount"] = 75, 
        ["refineliquid"] = 37, 
        ["probability"] = 0.22,
        ["tint"] = true
      },
      ["clowns-ore6"] = {
        ["result"] = "clowns-ore6", 
        ["img"] = "ore", 
        ["frame"] = 4,
        ["variation"] = 3,
        ["refineamount"] = 50, 
        ["refineliquid"] = 25, 
        ["probability"] = 0.15,
        ["tint"] = true
      },
      ["clowns-ore7"] = {
        ["result"] = "clowns-ore7", 
        ["img"] = "ore", 
        ["frame"] = 4,
        ["variation"] = 3,
        ["refineamount"] = 50, 
        ["refineliquid"] = 25, 
        ["probability"] = 0.15,
        ["tint"] = true
      },
    }
    angelsores = table.merge(angelsores, angelbobsclownsores)
  end
  
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, angelsores)
end

-- Bob's ore support
if not mods.angelsrefining and mods.bobores then
  local bobores = {
    ["tin-ore"] = {
      ["result"] = "tin-ore", 
      ["img"] = "ore", 
      ["frame"] = 4, 
      ["variation"] = 3,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.10,
      ["tint"] = true
    },
    ["lead-ore"] = {
      ["result"] = "lead-ore", 
      ["img"] = "ore", 
      ["frame"] = 4, 
      ["variation"] = 3,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.10,
      ["tint"] = true
    },
    ["quartz"] =  {
      ["result"] = "quartz", 
      ["img"] = "ore", 
      ["frame"] = 4, 
      ["variation"] = 3,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.10,
      ["tint"] = true
    },
    ["silver-ore"] = {
      ["result"] = "silver-ore", 
      ["img"] = "ore", 
      ["frame"] = 4, 
      ["variation"] = 3,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.10,
      ["tint"] = true
    },
    ["zinc-ore"] = {
      ["result"] = "zinc-ore", 
      ["img"] = "ore", 
      ["frame"] = 4, 
      ["variation"] = 3,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.10,
      ["tint"] = true
    },
    ["gold-ore"] = {
      ["result"] = "gold-ore", 
      ["img"] = "ore", 
      ["frame"] = 4, 
      ["variation"] = 3,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.10,
      ["tint"] = true
    },
    ["bauxite-ore"] = {
      ["result"] = "bauxite-ore", 
      ["img"] = "ore", 
      ["frame"] = 4, 
      ["variation"] = 3,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.10,
      ["tint"] = true
    },
    ["rutile-ore"] = {
      ["result"] = "rutile-ore", 
      ["img"] = "ore", 
      ["frame"] = 4, 
      ["variation"] = 3,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.10,
      ["tint"] = true
    },
    ["tungsten-ore"] = {
      ["result"] = "tungsten-ore", 
      ["img"] = "ore", 
      ["frame"] = 4, 
      ["variation"] = 3,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.10,
      ["tint"] = true
    },
    ["thorium-ore"] = {
      ["result"] = "thorium-ore", 
      ["img"] = "ore", 
      ["frame"] = 4, 
      ["variation"] = 3,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.10,
      ["tint"] = true
    },
    ["nickel-ore"] = {
      ["result"] = "nickel-ore", 
      ["img"] = "ore", 
      ["frame"] = 4, 
      ["variation"] = 3,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.10,
      ["tint"] = true
    },
    ["cobalt-ore"] = {
      ["result"] = "cobalt-ore", 
      ["img"] = "ore", 
      ["frame"] = 4, 
      ["variation"] = 3,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.10,
      ["tint"] = true
    },
    ["sulfur"] = {
      ["result"] = "sulfur", 
      ["img"] = "ore", 
      ["frame"] = 4, 
      ["variation"] = 3,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.10,
      ["tint"] = true
    },
    ["gem-ore"] = {
      ["result"] = "gem-ore", 
      ["img"] = "ore", 
      ["frame"] = 4, 
      ["variation"] = 3,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.10,
      ["tint"] = true
    },
  }
  vtk_deepcoremining_supported_ores = table.merge(vtk_deepcoremining_supported_ores, bobores)
end

-- somehow table.count doesn't exists in lua and you have to do it yourself
vtk_deepcoremining_supported_ores_count = 0
  
for k,v in pairs(vtk_deepcoremining_supported_ores) do
  vtk_deepcoremining_supported_ores_count = vtk_deepcoremining_supported_ores_count + 1
end