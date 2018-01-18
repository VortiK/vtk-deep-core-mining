local presets = data.raw["map-gen-presets"].default

presets["rich-resources"].basic_settings.autoplace_controls["vtk-deepcore-mining-ore"] = { richness = "very-good"}
presets["rail-world"].basic_settings.autoplace_controls["vtk-deepcore-mining-ore"] = {
  frequency = "very-low",
  size = "high"
}
