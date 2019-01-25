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
    ["img"] = "uranium-ore", 
    ["frame"] = 3, 
    ["variation"] = 1,
    ["refineamount"] = 10, 
    ["refineliquid"] = 100, 
    ["probability"] = 0.15,
    ["tint"] = false
  }
}

-- Angel's ore support
if mods.angelsrefining then
  local angelsores = {
    ["angels-ore1"] = {
      ["result"] = "angels-ore1", 
      ["img"] = "angels-ore1", 
      ["frame"] = 3, 
      ["variation"] = 1,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.30,
      ["tint"] = false
    },
    ["angels-ore2"] = {
      ["result"] = "angels-ore2", 
      ["img"] = "angels-ore2", 
      ["frame"] = 3, 
      ["variation"] = 1,
      ["refineamount"] = 200, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.30,
      ["tint"] = false
    },
    ["angels-ore3"] = {
      ["result"] = "angels-ore3", 
      ["img"] = "angels-ore3", 
      ["frame"] = 3, 
      ["variation"] = 1,
      ["refineamount"] = 100, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.30,
      ["tint"] = false
    },
    ["angels-ore4"] = {
      ["result"] = "angels-ore4", 
      ["img"] = "angels-ore4", 
      ["frame"] = 3, 
      ["variation"] = 1,
      ["refineamount"] = 100, 
      ["refineliquid"] = 50, 
      ["probability"] = 0.30,
      ["tint"] = false
    },
  }

  if mods["Clowns-Extended-Minerals"] then
    local angelsbobores = {
      ["clowns-ore1"] = {
        ["result"] = "clowns-ore1", 
        ["img"] = "ore", 
        ["frame"] = 4,
        ["variation"] = 3,
        ["refineamount"] = 100, 
        ["refineliquid"] = 50, 
        ["probability"] = 0.30,
        ["tint"] = true
      },
      ["clowns-ore2"] = {
        ["result"] = "clowns-ore2", 
        ["img"] = "ore", 
        ["frame"] = 4,
        ["variation"] = 3,
        ["refineamount"] = 100, 
        ["refineliquid"] = 50, 
        ["probability"] = 0.30,
        ["tint"] = true
      },
      ["clowns-ore3"] = {
        ["result"] = "clowns-ore3", 
        ["img"] = "ore", 
        ["frame"] = 4,
        ["variation"] = 3,
        ["refineamount"] = 100, 
        ["refineliquid"] = 50, 
        ["probability"] = 0.30,
        ["tint"] = true
      },
      ["clowns-ore4"] = {
        ["result"] = "clowns-ore4", 
        ["img"] = "ore", 
        ["frame"] = 4,
        ["variation"] = 3,
        ["refineamount"] = 100, 
        ["refineliquid"] = 50, 
        ["probability"] = 0.30,
        ["tint"] = true
      },
      ["clowns-ore5"] = {
        ["result"] = "clowns-ore5", 
        ["img"] = "ore", 
        ["frame"] = 4,
        ["variation"] = 3,
        ["refineamount"] = 100, 
        ["refineliquid"] = 50, 
        ["probability"] = 0.30,
        ["tint"] = true
      },
      ["clowns-ore6"] = {
        ["result"] = "clowns-ore6", 
        ["img"] = "ore", 
        ["frame"] = 4,
        ["variation"] = 3,
        ["refineamount"] = 100, 
        ["refineliquid"] = 50, 
        ["probability"] = 0.30,
        ["tint"] = true
      },
      ["clowns-ore7"] = {
        ["result"] = "clowns-ore7", 
        ["img"] = "ore", 
        ["frame"] = 4,
        ["variation"] = 3,
        ["refineamount"] = 100, 
        ["refineliquid"] = 50, 
        ["probability"] = 0.30,
        ["tint"] = true
      },
    }
    angelsores = table.merge(angelsores, angelsbobores)
  end
  
  if mods.bobplates then
    local angelbobsclownsores = {
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