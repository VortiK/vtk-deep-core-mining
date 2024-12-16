[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/T6T427A37)

# VortiK's Deep Core Mining

Sad to see your outposts depleted and empty ore trains on your rails ? No more with Deep Core Mining ! Refactor your mining outpost to give them a new longterm breath !

This mod is designed to aleviate the "depleted ore outpost" and "need to keep building new mining outpost forever" problems without a too cheaty infinite ore solution.

- Adds a new type of equivalent ore resources patches that only spawn in place of depleted field to be mined with specific expensive drills.
- Ore Patches can be mined with high tech mining drills.
- Moho Mining Drill will yield ore directly.
- Deep Core Mining Drill will yield ore chunks that must be refined to get useable raw ore, more investments but double the ore output per Ore Patch.
- Also adds rare cracks resources patches in the world that can be mined with an endgame Advanced Deep Core Mining Drill.
- DeepCore ore from cracks require a two steps heavy refining process to get useable raw ore.

The idea is to be able to repurpose depleted mining outpost when normal ore is mined. So the infrastructure can still be useful by investing some resources to replace the old drills, adjust logistics and setting up a refining facility to provid steady infinite source of ore.

## Features
- New resources, ore "patches" have a small chance to spawn under depleted ore fields for Iron, Copper, Uranium, Coal and Stone. Also rare DeepCore Cracks spawn in the world.
- Ore patches and Cracks provide an infinite yield that stays at 100%, however they output Ore Chunks that must be refined in chemical plants to get usable raw ores.
- Ore patches and Cracks can be manually mined to free land and get a burst of resources as the cost of losing the infinite minable spot.
- The Moho Mining Drill (MMD) can mines ore patches and provide raw ore directly, yields as much ore as 10 normal mining drills, not the best but also not much effort to place them in existing outpost as the same logistics can be kept.
- The Deep Core Mining Drill (DCMD) is more powerful, it will mine the ore patches aswell for as much as 20 normal mining drills but it yields ore chunks that require specific logistics and refining that consume sulfuric acid to get ore.
- The Advanced Deep Core Mining Drill (ADCMD) is also animated and has custom sounds. It is used to mine Cracks that yields a specific ore that require a heavy double steps refining to get useable ore. The drill will also consume Deep Core Mining drones to operate.
- ADCMD is designed to provide double the output of a DCMD, however it consumes tons of energy, burns constant intermediate as fuel and needs a dedicated refining facility to process Deep Core Ore chunks.
- Deep Core Ore can yields all supported ores in the game, there are different Focus Refining processes available with differents yields and even a single ore output to choose from (althought it's the least efficent recipe per Deep Core ore chunks).
- Deep Core Mining Drills will output tons of ore to tarnsport and process, often reaching belts throughputs as Mining Productivity increases. Splitters should help at low levels to handle the high output of the drills, however at high productivity levels it may be necessary to get creative with chests & stack inserters or use one of the multiple loaders mods to keep up with the flow : 
  - Deadlock's Compact Loaders : https://mods.factorio.com/mod/DeadlockLoaders (*Featured in screenshots*)
  - Miniloader https://mods.factorio.com/mod/miniloader (*Performant & versatile*)
  - Loader Redux : https://mods.factorio.com/mod/LoaderRedux (*Vanilla flavour*)

## Mod support

Since 2.9.0 automatically support all modded ores with a generic tinted gfx and refining parameters.

Supported mods with tailored configurations and contributions : 

- Angel's Refining mod : https://mods.factorio.com/mod/angelsrefining
- Angel's Petrochem mod compatibility (regarding Sulfuric Acid) : https://mods.factorio.com/mod/angelspetrochem
- Reika's Dirty Mining mod : https://mods.factorio.com/mod/DirtyMining
- Bob's Ores mod : https://mods.factorio.com/mod/bobores
- Clown's Extended Minerals mod : https://mods.factorio.com/mod/Clowns-Extended-Minerals
- Bilka's New Game Plus : https://mods.factorio.com/mod/NewGamePlus
- Arcitos's Simple Silicon : https://mods.factorio.com/mod/SimpleSilicon
- Krastorio 2's Rare Metals : https://mods.factorio.com/mod/Krastorio2

## Compatibility contribution provided by DarkShadow44 https://github.com/DarkShadow44 : 
- Leighzer's Morphite : https://mods.factorio.com/mod/leighzermorphite
- Pyanodons Raw Ores : https://mods.factorio.com/mod/pyrawores
- Pyanodons Coal Processing : https://mods.factorio.com/mod/pycoalprocessing
- Mylon's Prospector : https://mods.factorio.com/mod/Prospector

## Compatibility contribution provided by Brevven https://mods.factorio.com/user/brevven : 
- Titanium https://mods.factorio.com/mod/bztitanium
- Lead https://mods.factorio.com/mod/bzlead
- Tungsten https://mods.factorio.com/mod/bztungsten
- Zirconium https://mods.factorio.com/mod/bzzirconium

## Compatibility contribution provided by Trimethylaluminium https://github.com/Trimethylaluminium : 
- Industrial Revolution 2 https://mods.factorio.com/mod/IndustrialRevolution

## Compatibility contribution provided by codwow https://mods.factorio.com/user/codwow : 
- Omnimatter https://mods.factorio.com/mod/omnimatter

## Blacklist feature to disable Deep Core Mining for specific ores if wanted by other mods
- Simply add the ore name in the global table `vtk_deepcoremining_blacklist_ores` with a random value, like `1` eg : `vtk_deepcoremining_blacklist_ores["iron-ore"] = 1`

Other mods support depending on request !


## Known incompatibility
- Minor incompatibility with Filter Mining Drill mod : https://mods.factorio.com/mod/Cursed-FMD : the DCMDPlanner tool will not work to remove ore patches.
- Although not compatible by default with Space Exploration, it's possible with a manual change described here : https://mods.factorio.com/mod/vtk-deep-core-mining/discussion/603d6b2711e74c915950ba9f

## Credits
- Deep Core Mining is powered by the Factorio Standard Library Project : https://github.com/Afforess/Factorio-Stdlib
- Sementic Versionning provided by semver.lua : https://github.com/kikito/semver.lua
- Graphics for the mining drills are not mine, source : https://www.spriters-resource.com/
- (old) Youtube Spotlight by Xterminator : https://www.youtube.com/watch?v=HtJiC6eGsqI (old version of the mod)
- (old) Youtube Tutorial by Seeeno (German) : https://www.youtube.com/watch?v=WXs94k1FlYM
