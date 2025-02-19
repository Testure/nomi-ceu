import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.recipe.functions.IRunOverclockingLogicFunction;
import mods.gregtech.recipe.IRecipeLogic;
import mods.gregtech.recipe.IRecipe;

import scripts.common.makeShaped as makeShaped;
import scripts.common.absolute_int as absolute_int;

//val ROCKET_ARROW as ITextureArea = ITextureArea.fullImage("multiblocktweaker:textures/gui/progress_bar/rocket.png");

// multiblock stuctures
// Basic Microverse Projector

val microverse_projector_basic = Builder.start("mbt:microverse_projector_basic") // automatic allocation ID
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
                       return FactoryBlockPattern.start()
                          .aisle("CCC", "CVC", "CCC")
                          .aisle("CCC", "GDG", "CMC")
                          .aisle("CSC", "CGC", "CCC")
                          .where('S', controller.self())
                          .where('G', <blockstate:gregtech:transparent_casing>)
                          .where('V', <metastate:gregtech:multiblock_casing:2>)
                          .where('D', <metastate:chisel:diamond:3>)
                          .where("C", CTPredicate.states(<blockstate:contenttweaker:microverse_casing>) | controller.autoAbilities(true, true, true, true, true, false, false))
                          .where('M', controller.autoAbilities(false, false, false, false, false, false, true)) // same as CTPredicate.abilities(<mte_ability:MUFFLER_HATCH>)
                          .build();
                 } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("microverse_projector_basic") // create a RecipeMap.
            .minInputs(2)
            .maxInputs(4)
            .minOutputs(1)
            .maxOutputs(16)
            .maxFluidInputs(2)
            //.setProgressBar(ROCKET_ARROW, MoveType.HORIZONTAL)
            .build())
    .withBaseTexture(<blockstate:contenttweaker:microverse_casing>) // Looking for existing renderers in CEu. but yeah, you can also use <metastate:gregtech:metal_casing:3> here
    .buildAndRegister();

microverse_projector_basic.hasMufflerMechanics = true;
microverse_projector_basic.hasMaintenanceMechanics = true;

// Advanced Microverse Projector
val microverse_projector_advanced = Builder.start("mbt:microverse_projector_advanced")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                    "CCMCC",
                    "CGGGC",
                    "CGGGC",
                    "CGGGC",
                    "CCCCC")
            .aisle(
                    "CVCVC",
                    "GDDDG",
                    "GDDDG",
                    "GDDDG",
                    "CVCVC")
            .aisle(
                    "CCCCC",
                    "GDDDG",
                    "GD DG",
                    "GDDDG",
                    "CCCCC")
            .aisle(
                    "CVCVC",
                    "GDDDG",
                    "GDDDG",
                    "GDDDG",
                    "CVCVC")
            .aisle(
                    "CCSCC",
                    "CGGGC",
                    "CGGGC",
                    "CGGGC",
                    "CCCCC")
            .where('S', controller.self())
            .where('G', <blockstate:gregtech:transparent_casing>)
            .where('D', <metastate:chisel:diamond:3>)
            .where('V', <metastate:gregtech:multiblock_casing:2>)
            .where(' ', CTPredicate.getAir())
            .where("C", CTPredicate.states(<blockstate:contenttweaker:microverse_casing>) | controller.autoAbilities(true, true, true, true, true, false, false))
            .where('M', controller.autoAbilities(false, false, false, false, false, false, true)) // same as CTPredicate.abilities(<mte_ability:MUFFLER_HATCH>)
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("microverse_projector_advanced") // create a RecipeMap.
            .minInputs(2)
            .maxInputs(4)
            .minOutputs(1)
            .maxOutputs(16)
            .maxFluidInputs(1)
            //.setProgressBar(ROCKET_ARROW, MoveType.HORIZONTAL)
            .build())
    .withBaseTexture(<blockstate:contenttweaker:microverse_casing>) // Looking for existing renderers in CEu. but yeah, you can also use <metastate:gregtech:metal_casing:3> here
    .buildAndRegister();

microverse_projector_advanced.hasMufflerMechanics = true;
microverse_projector_advanced.hasMaintenanceMechanics = true;

// Advanced Microverse Projector II
val microverse_projector_advanced_ii = Builder.start("mbt:microverse_projector_advanced_ii")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "         ",
                "         ",
                "  CCCCC  ",
                "  CVCVC  ",
                "  CCMCC  ",
                "  CVCVC  ",
                "  CCCCC  ",
                "         ",
                "         ")
            .aisle(
                "         ",
                "  CGGGC  ",
                " CDDDDDC ",
                " GDDDDDG ",
                " GDDDDDG ",
                " GDDDDDG ",
                " CDDDDDC ",
                "  CGGGC  ",
                "         ")
            .aisle(
                "  CCCCC  ",
                " CDDDDDC ",
                "CDDDDDDDC",
                "CDDDDDDDC",
                "CDDDDDDDC",
                "CDDDDDDDC",
                "CDDDDDDDC",
                " CDDDDDC ",
                "  CCCCC  ")
            .aisle(
                "  CGGGC  ",
                " GDDDDDG ",
                "CDDDDDDDC",
                "GDD   DDG",
                "GDD   DDG",
                "GDD   DDG",
                "CDDDDDDDC",
                " GDDDDDG ",
                "  CGGGC  ").setRepeatable(3)
            .aisle(
                "  CCCCC  ",
                " CDDDDDC ",
                "CDDDDDDDC",
                "CDDDDDDDC",
                "CDDDDDDDC",
                "CDDDDDDDC",
                "CDDDDDDDC",
                " CDDDDDC ",
                "  CCCCC  ")
            .aisle(
                "         ",
                "  CGGGC  ",
                " CDDDDDC ",
                " GDDDDDG ",
                " GDDDDDG ",
                " GDDDDDG ",
                " CDDDDDC ",
                "  CGGGC  ",
                "         ")
            .aisle(
                "         ",
                "         ",
                "  CCSCC  ",
                "  CGGGC  ",
                "  CGGGC  ",
                "  CGGGC  ",
                "  CCCCC  ",
                "         ",
                "         ")
            
            .where('S', controller.self())
            .where('G', <blockstate:gregtech:transparent_casing>)
            .where('V', <blockstate:gregtech:multiblock_casing>)
            .where(' ', CTPredicate.getAir())
            .where('D', <metastate:chisel:diamond:3>)
            .where("C", CTPredicate.states(<blockstate:contenttweaker:microverse_casing>) | controller.autoAbilities(true, true, true, true, true, false, false))
            .where('M', controller.autoAbilities(false, false, false, false, false, false, true)) // same as CTPredicate.abilities(<mte_ability:MUFFLER_HATCH>)
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("microverse_projector_advanced_ii") // create a RecipeMap.
            .minInputs(2)
            .maxInputs(8)
            .minOutputs(1)
            .maxOutputs(16)
            //.setProgressBar(ROCKET_ARROW, MoveType.HORIZONTAL)
            .build())
    .withBaseTexture(<blockstate:contenttweaker:microverse_casing>) // Looking for existing renderers in CEu. but yeah, you can also use <metastate:gregtech:metal_casing:3> here
    .buildAndRegister();

microverse_projector_advanced_ii.hasMufflerMechanics = true;
microverse_projector_advanced_ii.hasMaintenanceMechanics = true;

// Creative Tank Provider
val creative_tank_provider = Builder.start("mbt:creative_tank_provider")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle("CCC", "CCC", "CCC")
            .aisle("CCC", "CFC", "CCC")
            .aisle("CCC", "CSC", "CCC")
            .where('S', controller.self())
            .where('F', <metastate:gregtech:meta_block_frame_24:12>) // Tungstencarbide Frame Box
            .where("C", CTPredicate.states(<metastate:gcym:large_multiblock_casing:11>) | controller.autoAbilities(true, false, true, true, false, false, false))
            .build();
    } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("creative_tank_provider")
            .minInputs(2)
            .maxInputs(2)
            .minOutputs(1)
            .maxOutputs(1)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:11>)
    .buildAndRegister();

creative_tank_provider.hasMufflerMechanics = false;
creative_tank_provider.hasMaintenanceMechanics = false;

// Naquadah Reactor 1
<gcym:large_multiblock_casing:9>.displayName = "Reaction-Safe Casing";
val naquadah_reactor_1 = Builder.start("naquadah_reactor_1")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "CCC",
                "PGP",
                "PGP",
                "PGP",
                "CCC"
            )
            .aisle(
                "CCC",
                "GOG",
                "GOG",
                "GOG",
                "CCC"
            )
            .aisle(
                "CSC",
                "PGP",
                "PGP",
                "PGP",
                "CCC"
            )
            .where('S', controller.self())
            .where('G', <blockstate:nuclearcraft:reactor_casing_transparent>)
            .where('P', <blockstate:appliedenergistics2:spatial_pylon>)
            .where('O', <metastate:extendedcrafting:trimmed:5>)
            .where('C', CTPredicate.states(<metastate:gcym:large_multiblock_casing:9>)
            | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
            | CTPredicate.abilities(<mte_ability:OUTPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(3).setPreviewCount(1)
            )
            .build();
        } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("naquadah_reactor_1")
            .minInputs(1)
            .maxInputs(1)
            .minOutputs(1)
            .maxOutputs(1)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:9>)
    .buildAndRegister();
naquadah_reactor_1.hasMufflerMechanics = false;
naquadah_reactor_1.hasMaintenanceMechanics = false;

naquadah_reactor_1.runOverclockingLogic = function(recipelogic as IRecipeLogic, recipe as IRecipe, negativeEU as bool, maxOverclocks as int) as int[] {
    return [recipe.getEUt(), recipe.getDuration()];
} as IRunOverclockingLogicFunction;

// Naquadah Reactor 2
val naquadah_reactor_2 = Builder.start("naquadah_reactor_2")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "CCC",
                "PGP",
                "PGP",
                "PGP",
                "PGP",
                "CCC"
            )
            .aisle(
                "CCC",
                "GOG",
                "GOG",
                "GOG",
                "GOG",
                "CCC"
            )
            .aisle(
                "CSC",
                "PGP",
                "PGP",
                "PGP",
                "PGP",
                "CCC"
            )
            .where('S', controller.self())
            .where('G', <blockstate:nuclearcraft:reactor_casing_transparent>)
            .where('P', <blockstate:appliedenergistics2:spatial_pylon>)
            .where('O', <metastate:extendedcrafting:storage:4>)
            .where('C', CTPredicate.states(<metastate:gcym:large_multiblock_casing:9>)
            | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
            | CTPredicate.abilities(<mte_ability:OUTPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(3).setPreviewCount(1)
            )
            .build();
        } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("naquadah_reactor_2")
            .minInputs(1)
            .maxInputs(1)
            .minOutputs(1)
            .maxOutputs(1)
            .build())
    .withBaseTexture(<metastate:gcym:large_multiblock_casing:9>)
    .buildAndRegister();

naquadah_reactor_2.hasMufflerMechanics = false;
naquadah_reactor_2.hasMaintenanceMechanics = false;

naquadah_reactor_2.runOverclockingLogic = function(recipelogic as IRecipeLogic, recipe as IRecipe, negativeEU as bool, maxOverclocks as int) as int[] {
    return [recipe.getEUt(), recipe.getDuration()];
} as IRunOverclockingLogicFunction;

// Large Lapidary Dynamo
val LAPIDARY_EUT_FIXED = -4096 as int;

val large_lapidary_dynamo = Builder.start("large_lapidary_dynamo")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle("CCC", "CCC", "CCC")
            .aisle("CCC", "CGC", "CCC")
            .aisle("CCC", "CSC", "CCC")
            .where('S', controller.self())
            .where('G', <blockstate:gregtech:turbine_casing>)
            .where('C', CTPredicate.states(<metastate:gregtech:metal_casing:3>)
            | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)
            | CTPredicate.abilities(<mte_ability:OUTPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(4)
            )
            .build();
        } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("large_lapidary_dynamo")
            .minInputs(1)
            .maxInputs(1)
            .build())
    .withBaseTexture(<metastate:gregtech:metal_casing:3>)
    .buildAndRegister();

large_lapidary_dynamo.hasMufflerMechanics = false;
large_lapidary_dynamo.hasMaintenanceMechanics = false;

//large_lapidary_dynamo.runOverclockingLogic = function(recipelogic as IRecipeLogic, recipe as IRecipe, negativeEU as bool, maxOverclocks as int) as int[] {
//    if (absolute_int(recipe.getEUt()) > absolute_int(LAPIDARY_EUT_FIXED)) {
//        return [recipe.getEUt(), recipe.getDuration()];
//    }
//} as IRunOverclockingLogicFunction;

// Lunar Mining Station>
//val isOnMoon as IBlockMatcher = function (state as IBlockWorldState) as bool {
//    return state.getWorld().getDimension() == 100; // Moon dimension
//};
//val lunar_mining_station = Builder.start("lunar_mining_station")
//    .withPattern(function(controller as IControllerTile) as IBlockPattern {
//        return FactoryBlockPattern.start()
//            .aisle(
//                "    A    ",
//                "         ",
//                "         ",
//                "         ",
//                "         ",
//                "         ",
//                "         ",
//                "         ",
//                "         "
//            )
//            .aisle(
//                "    A    ",
//                "   E E   ",
//                "    E    ",
//                "         ",
//                "         ",
//                "         ",
//                "         ",
//                "         ",
//                "         "
//            )
//            .aisle(
//                "    A    ",
//                "   C C   ",
//                "   CCC   ",
//                "   CCC   ",
//                "   CGC   ",
//                "   CCC   ",
//                "    C    ",
//                "         ",
//                "         "
//            )
//            .aisle(
//                "   CAC   ",
//                "  C   C  ",
//                "  C   C  ",
//                "  C   C  ",
//                "  C   C  ",
//                "  C   C  ",
//                "   C C   ",
//                "   BBB   ",
//                "         "
//            )
//            .aisle(
//                "AAAAAAAAA",
//                "         ",
//                "  E   E  ",
//                "  C   C  ",
//                "  G   G  ",
//                "  C   C  ",
//                "  C   C  ",
//                "   BBB   ",
//                "    M    "
//            )
//            .aisle(
//                "   CAS   ",
//                "  C   C  ",
//                "  C   C  ",
//                "  C   C  ",
//                "  C   C  ",
//                "  C   C  ",
//                "   C C   ",
//                "   BBB   ",
//                "         "
//            )
//            .aisle(
//                "    A    ",
//                "   C C   ",
//                "   CCC   ",
//                "   CCC   ",
//                "   CGC   ",
//                "   CCC   ",
//                "    C    ",
//                "         ",
//                "         "
//            )
//            .aisle(
//                "    A    ",
//                "   E E   ",
//                "    E    ",
//                "         ",
//                "         ",
//                "         ",
//                "         ",
//                "         ",
//                "         "
//            )
//            .aisle(
//                "    A    ",
//                "         ",
//                "         ",
//                "         ",
//                "         ",
//                "         ",
//                "         ",
//                "         ",
//                "         "
//            )
//            .where('S', controller.self())
//            .where('M', <blockstate:minecraft:beacon>)
//            .where('B', <metastate:enderio:block_alloy_endergy:3>)
//            .where('G', <metastate:extrautils2:ineffableglass:3>)
//            .where('E', <metastate:enderio:block_alloy_endergy:5>)
//            .where('A', <metastate:actuallyadditions:block_misc:9>)
//            .where('C', CTPredicate.states(<metastate:gregtech:machine_casing:6>)
//            | controller.autoAbilities(true, false, true, false, false, true, false))
//            .build();
//    } as IPatternBuilderFunction)
//    .withRecipeMap(
//        FactoryRecipeMap.start("lunar_mining_station")
//            .minInputs(1)
//            .maxInputs(1)
//            .minFluidOutputs(1)
//            .minFluidOutputs(1)
//            .build())
//    .withBaseTexture(<metastate:gregtech:machine_casing:6>)
//    .buildAndRegister();


// multiblock controller recipes
recipes.addShaped("microverse_projector_basic", <metaitem:mbt:microverse_projector_basic>, [
    [<ore:circuitAdvanced>, <contenttweaker:microverse_casing>, <ore:circuitAdvanced>],
    [<contenttweaker:microverse_casing>, <metaitem:cover.screen>, <contenttweaker:microverse_casing>],
    [<ore:circuitAdvanced>, <contenttweaker:microverse_casing>, <ore:circuitAdvanced>]
]);

recipes.addShaped("microverse_projector_advanced", <metaitem:mbt:microverse_projector_advanced>, [
    [<ore:circuitExtreme>, <contenttweaker:microverse_casing>, <ore:circuitExtreme>],
    [<contenttweaker:microverse_casing>, <metaitem:cover.screen>, <contenttweaker:microverse_casing>],
    [<ore:circuitExtreme>, <contenttweaker:microverse_casing>, <ore:circuitExtreme>]
]);

recipes.addShaped("microverse_projector_advanced_ii", <metaitem:mbt:microverse_projector_advanced_ii>, [
    [<ore:circuitElite>, <contenttweaker:microverse_casing>, <ore:circuitElite>],
    [<contenttweaker:microverse_casing>, <metaitem:cover.screen>, <contenttweaker:microverse_casing>],
    [<ore:circuitElite>, <contenttweaker:microverse_casing>, <ore:circuitElite>]
]);

makeShaped("naquadah_reactor_1", <metaitem:multiblocktweaker:naquadah_reactor_1>,
    ["NCN",
     "GSG",
     "PPP"],
    { C : <ore:circuitElite>, //T5
      G : <nuclearcraft:reactor_casing_transparent>,
      S : <metaitem:cover.screen>,
      P : <appliedenergistics2:spatial_pylon>,
      N : <extendedcrafting:material:33>}); //Omnium Nugget

makeShaped("naquadah_reactor_2", <metaitem:multiblocktweaker:naquadah_reactor_2>,
    ["NCN",
     "GSG",
     "PPP"],
    { C : <ore:circuitMaster>, //T6
      G : <nuclearcraft:reactor_casing_transparent>,
      S : <metaitem:cover.screen>,
      P : <appliedenergistics2:spatial_pylon>,
      N : <extendedcrafting:material:32>}); //Omnium Ingot

//makeShaped("lunar_mining_station", <gregtech:machine:3007>,
//    ["CLC",
//     "LSL",
//     "CLC"],
//    { C : <ore:circuitExtreme>, //T4
//      L : <gregtech:machine_casing:6>, //LuV Machine Casing
//      S : <metaitem:cover.screen>});

var dynamo5 = <thermalexpansion:dynamo:5>.withTag({RSControl: 0 as byte, Creative: 0 as byte, Energy: 0, Level: 1 as byte, Augments: []}, false); // Numismatic Dynamo (Hardened)
makeShaped("large_lapidary_dynamo", <metaitem:multiblocktweaker:large_lapidary_dynamo>,
    ["CAC",
     "ANA",
     "XAX"],
    { C : <ore:circuitBasic>,
      A : <gregtech:metal_casing:3>, // Aluminium Casing
      X : <metaitem:gemExquisiteDiamond>,
      N : dynamo5 });

// multiblock recipemap recipes
// basic projector
// t1 ores
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(500)
    .EUt(500)
    .inputs(<contenttweaker:tieroneship>,
            <contenttweaker:quantumflux>,
            <minecraft:chest>)
    .fluidInputs(<liquid:rocket_fuel> * 8000)
    .outputs(<densemetals:dense_iron_ore> * 64,
             <gregtech:ore_cassiterite_0> * 64,
             <gregtech:ore_redstone_0> * 64,
             <gregtech:ore_nickel_0> * 64,
             <gregtech:ore_bauxite_0> * 64,
             <gregtech:ore_bauxite_0> * 64,
             <gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_galena_0> * 64,
             <gregtech:ore_galena_0> * 64,
             <advancedrocketry:moonturf> * 64,
             <libvulpes:ore0> * 64,
             <gregtech:ore_salt_0> * 64)
    .buildAndRegister();

// t1 gems
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(500)
    .EUt(500)
    .inputs(<contenttweaker:tieroneship>,
            <contenttweaker:quantumflux>,
            <contenttweaker:gemsensor>)
    .fluidInputs(<liquid:rocket_fuel> * 8000)
    .outputs(<metaitem:gemPerfectDiamond> * 64,
             <gregtech:ore_apatite_0> * 64,
             <gregtech:ore_tricalcium_phosphate_0> * 64,
             <gregtech:ore_quartzite_0> * 64)
    .buildAndRegister();

// t1 stellar creation data 1
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(100)
    .EUt(500)
    .inputs(<contenttweaker:tieroneship>,
            <contenttweaker:ultradensehydrogen>)
    .fluidInputs(<liquid:rocket_fuel> * 2000)
    .outputs(<contenttweaker:stellarcreationdata>)
    .buildAndRegister();

// t1 stellar creation data 2
//microverse_projector_basic.recipeMap
//    .recipeBuilder()
//    .duration(100)
//    .EUt(500)
//    .inputs(<contenttweaker:tieroneship>)
//    .fluidInputs(<liquid:rocket_fuel> * 2000, <liquid:hydrogen> * 80000)
//    .outputs(<contenttweaker:stellarcreationdata>)
//    .buildAndRegister();

// t2 radium + ores
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(600)
    .EUt(1000)
    .inputs(<contenttweaker:tiertwoship>,
            <contenttweaker:quantumflux> * 2)
    .fluidInputs(<liquid:rocket_fuel> * 12000)
    .outputs(<gregtech:ore_bauxite_0:2> * 64,
             <gregtech:ore_pyrochlore_0:2> * 64,
             <gregtech:ore_pyrochlore_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_sphalerite_0:2> * 64,
             <gregtech:ore_cassiterite_0> * 64,
             <gregtech:ore_scheelite_0> * 64,
             <gregtech:ore_scheelite_0> * 64,
             <gregtech:ore_scheelite_0> * 64,
             <gregtech:ore_tungstate_0> * 64,
             <gregtech:ore_tungstate_0> * 64,
             <gregtech:ore_tungstate_0> * 64,
             <contenttweaker:radiumsalt> * 64,
             <contenttweaker:radiumsalt> * 64)
    .buildAndRegister();

// t2 stellar creation data
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(120)
    .EUt(1000)
    .inputs(<contenttweaker:tiertwoship>,
            <contenttweaker:ultradensehydrogen> * 4)
    .fluidInputs(<liquid:rocket_fuel> * 3000)
    .outputs(<contenttweaker:stellarcreationdata> * 4)
    .buildAndRegister();

// t3 gems
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(700)
    .EUt(2000)
    .inputs(<contenttweaker:tierthreeship>,
            <contenttweaker:quantumflux> * 4,
            <contenttweaker:gemsensor>)
    .fluidInputs(<liquid:rocket_fuel> * 20000)
    .outputs(<metaitem:gemPerfectDiamond> * 64,
             <metaitem:gemPerfectDiamond> * 32,
             <metaitem:gemPerfectEmerald> * 32,
             <metaitem:gemPerfectRuby> * 64,
             <gregtech:ore_sapphire_0:1> * 64,
             <gregtech:ore_gold_0:1> * 64,
             <gregtech:ore_silver_0:1> * 64,
             <gregtech:ore_topaz_0:1> * 64)
    .buildAndRegister();

// t3 ores
microverse_projector_basic.recipeMap
    .recipeBuilder()
    .duration(700)
    .EUt(2000)
    .inputs(<contenttweaker:tierthreeship>,
            <contenttweaker:quantumflux> * 4,
            <meta_tile_entity:super_chest.mv>)
    .fluidInputs(<liquid:rocket_fuel> * 20000)
    .outputs(<gregtech:ore_scheelite_0> * 64,
             <gregtech:ore_scheelite_0> * 64,
             <gregtech:ore_scheelite_0> * 64,
             <gregtech:ore_tungstate_0> * 64,
             <gregtech:ore_tungstate_0> * 64,
             <gregtech:ore_tungstate_0> * 64,
             <gregtech:ore_ilmenite_0> * 64,
             <gregtech:ore_vanadium_magnetite_0> * 64,
             <gregtech:ore_tetrahedrite_0> * 64,
             <gregtech:ore_cassiterite_0> * 64,
             <gregtech:ore_tin_0> * 64,
             <gregtech:ore_redstone_0> * 64,
             <gregtech:ore_certus_quartz_0> * 64,
             <gregtech:ore_almandine_0> * 64)
    .buildAndRegister();

// advanced projector
// t4 oil and infinity
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(800)
    .EUt(3750)
    .inputs(<contenttweaker:tierfourship>,
            <contenttweaker:quantumflux> * 8,
            <advancedrocketry:satelliteprimaryfunction:1>,
            <ore:dustPetrotheum> * 64)
    .outputs(<contenttweaker:denseoilshale> * 64,
             <contenttweaker:denseoilshale> * 64,
             <ore:compressed2xDustBedrock>.firstItem * 16)
    .buildAndRegister();

// t4 dense gem ores
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(800)
    .EUt(3750)
    .inputs(<contenttweaker:tierfourship>,
            <contenttweaker:quantumflux> * 8,
            <contenttweaker:gemsensor>,
            <ore:dustPetrotheum> * 64) 
    .outputs(<densemetals:dense_lapis_ore> * 64,
             <densemetals:dense_diamond_ore> * 64,
             <densemetals:dense_diamond_ore> * 64,
             <densemetals:dense_coal_ore>  * 64,
             <densemetals:dense_emerald_ore> * 32,
             <densemetals:dense_redstone_ore> * 16)
    .buildAndRegister();

// t4 osmium iridium
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(800)
    .EUt(3750)
    .inputs(<contenttweaker:tierfourship>,
            <contenttweaker:quantumflux> * 8,
            <contenttweaker:witherrealmdata> * 4,
            <ore:dustPetrotheum> * 64) 
    .outputs(<gregtech:ore_iridosmine_8020_0> * 64,
             <gregtech:ore_iridosmine_8020_0> * 64,
             <gregtech:ore_osmiridium_8020_0> * 16)
    .buildAndRegister();

// t5 ores
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(1000)
    .EUt(7500)
    .inputs(<contenttweaker:tierfiveship>,
            <contenttweaker:quantumflux> * 16,
            <contenttweaker:stabilizeduranium> * 32)
    .outputs(<gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_palladium_0> * 64,
             <gregtech:ore_realgar_0> * 64,
             <gregtech:ore_bastnasite_0> * 64,
             <gregtech:ore_sphalerite_0> * 64,
             <gregtech:ore_monazite_0> * 64,
             <gregtech:meta_block_compressed_26> * 64, //Ender Pearl Block
             <gregtech:ore_osmiridium_8020_0> * 16,
             <metaitem:dustBoron> * 64,
             <gregtech:ore_molybdenite_0> * 64,
             <gregtech:ore_beryllium_0> * 64,
             <gregtech:ore_beryllium_0> * 64)
    .buildAndRegister();

// t5 naquadah sheldonite
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(1000)
    .EUt(7500)
    .inputs(<contenttweaker:tierfiveship>,
            <contenttweaker:quantumflux> * 16,
            <contenttweaker:stabilizedplutonium> * 32)
    .outputs(<gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_naquadah_0:2> * 64,
             <gregtech:ore_naquadah_0:2> * 64,
             <gregtech:ore_naquadah_0:2> * 32)
             
    .buildAndRegister();

// t6 u/os/ir
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(1250)
    .EUt(18750)
    .inputs(<contenttweaker:tiersixship>,
            <contenttweaker:quantumflux> * 16,
            <contenttweaker:stabilizeduranium> * 32,
            <contenttweaker:witherrealmdata> * 16)
    .outputs(<gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_osmiridium_8020_0> * 64,
             <gregtech:ore_osmiridium_8020_0> * 64,
             <gregtech:ore_osmiridium_8020_0> * 64,
             <gregtech:ore_iridosmine_8020_0> * 64,
             <gregtech:ore_iridosmine_8020_0> * 64)
    .buildAndRegister();

// t6 einsteinium
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(1250)
    .EUt(18750)
    .inputs(<contenttweaker:tiersixship>,
            <contenttweaker:quantumflux> * 16,
            <contenttweaker:stabilizedplutonium> * 32,
            <contenttweaker:witherrealmdata> * 64)
    .outputs(<contenttweaker:stabilizedeinsteinium> * 32)
    .buildAndRegister();

// t6 eggs
microverse_projector_advanced.recipeMap
    .recipeBuilder()
    .duration(1250)
    .EUt(18750)
    .inputs(<contenttweaker:tiersixship>,
            <contenttweaker:quantumflux> * 16,
            <contenttweaker:stabilizedplutonium> * 32,
            <contenttweaker:dragonlairdata> * 16)
    .outputs(<minecraft:dragon_egg> * 32)
    .buildAndRegister();

// advanced projector 2
// t7 hearts
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(1500)
    .EUt(31250)
    .inputs(<contenttweaker:tiersevenship>,
            <contenttweaker:quantumflux> * 32,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <contenttweaker:dragonlairdata> * 32)
    .outputs(<draconicevolution:dragon_heart> * 32,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_breath> * 64,
             <armorplus:material:3> * 64, 
             <armorplus:material:3> * 64,
             <armorplus:material:3> * 64,
             <minecraft:gold_block> * 64,
             <minecraft:gold_block> * 64,
             <minecraft:gold_block> * 64,
             <metaitem:blockSilver> * 64, //Silver block
             <metaitem:blockSilver> * 64, //Silver Block
             <minecraft:diamond_block> * 64,
             <minecraft:diamond_block> * 64,
             <metaitem:blockPlatinum> * 64, //Platinum Block
             <metaitem:blockAmericium> * 16) 
    .buildAndRegister();

// t7 chaos lair data
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(1500)
    .EUt(31250)
    .inputs(<contenttweaker:tiersevenship>,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <contenttweaker:gemsensor>,
            <contenttweaker:dragonlairdata> * 64,
            <contenttweaker:dragonlairdata> * 64,
            <contenttweaker:dragonlairdata> * 64,
            <contenttweaker:dragonlairdata> * 64)
    .outputs(<contenttweaker:lairofthechaosguardiandata>)
    .buildAndRegister();

// t8 gravistar nt
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(2000)
    .EUt(62500)
    .inputs(<contenttweaker:tiereightship>,
            <contenttweaker:quantumflux> * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <contenttweaker:witherrealmdata> * 64,
            <contenttweaker:witherrealmdata> * 64)
    .outputs(<metaitem:quantumstar> * 32,
             <metaitem:quantumeye> * 64,
             <ore:ingotNeutronium>.firstItem * 16,
             <metaitem:gravistar>)
    .buildAndRegister();

// t8 shards eggs
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(1500)
    .EUt(62500)
    .inputs(<contenttweaker:tiereightship>,
            <contenttweaker:quantumflux> * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <contenttweaker:lairofthechaosguardiandata>)
    .outputs(<draconicevolution:chaos_shard> * 4,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64)
    .buildAndRegister();

// t9 nt
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(3000)
    .EUt(250000)
    .inputs(<contenttweaker:tiernineship>,
            <metaitem:neutron_reflector> * 8,
            <metaitem:blockAwakenedDraconium> * 4,
            <contenttweaker:stellarcreationdata>)
    .outputs(<ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64)
    .buildAndRegister();

// t9 universe creation data
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(3000)
    .EUt(250000)
    .inputs(<contenttweaker:tiernineship>,
            <metaitem:blockAwakenedDraconium> * 4,
            <contenttweaker:stellarcreationdata> * 64,
            <contenttweaker:stellarcreationdata> * 64,
            <contenttweaker:stellarcreationdata> * 64,
            <contenttweaker:stellarcreationdata> * 64)
    .outputs(<contenttweaker:universecreationdata>)
    .buildAndRegister();

// t10 hotu
microverse_projector_advanced_ii.recipeMap
    .recipeBuilder()
    .duration(6000)
    .EUt(1000000)
    .inputs(<contenttweaker:tiertenship>,
            <contenttweaker:universecreationdata>,
            <ore:blockTritanium> * 8)
    .outputs(<contenttweaker:heartofauniverse>)
    .buildAndRegister();

// t10 tank data
//microverse_projector_advanced_ii.recipeMap
//    .recipeBuilder()
//    .duration(6000)
//    .EUt(1000000)
//    .inputs(<contenttweaker:tiertenship>,
//            <contenttweaker:universecreationdata>,
//            <ore:blockNaquadria> * 36)
//    .outputs(<contenttweaker:creativeportabletankmold>)
//    .buildAndRegister();

// creative tank provider
// creative tank
creative_tank_provider.recipeMap
    .recipeBuilder()
    .notConsumable(<contenttweaker:creativeportabletankmold>)
    .inputs(<minecraft:bucket>)
    .outputs(<metaitem:creative_tank>)
    .duration(500)
    .EUt(100000)
    .buildAndRegister();

// Naquadah Reactor Mk1 Recipes
naquadah_reactor_1.recipeMap
    .recipeBuilder()
    .duration(938)
    .EUt(-262144)
    .inputs(<metaitem:boltNaquadahEnriched>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();

naquadah_reactor_1.recipeMap
    .recipeBuilder()
    .duration(3750)
    .EUt(-262144)
    .inputs(<metaitem:boltNaquadria>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();

// Naquadah Reactor Mk2 Recipes
naquadah_reactor_2.recipeMap
    .recipeBuilder()
    .duration(1875)
    .EUt(-1048576)
    .inputs(<metaitem:boltNaquadahEnriched>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();

naquadah_reactor_2.recipeMap
    .recipeBuilder()
    .duration(7500)
    .EUt(-1048576)
    .inputs(<metaitem:boltNaquadria>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();

// lapidary dynamo
large_lapidary_dynamo.recipeMap
    .recipeBuilder()
    .duration(150)
    .EUt(-4096)
    .inputs(<ore:gemDiamond>)
    .buildAndRegister();

// Lunar Mining Station Rover Missions
//lunar_mining_station.recipeMap
//    .recipeBuilder()
//    .duration(120000)
//    .EUt(125)
//    .inputs(<contenttweaker:deuteriumrover>)
//    .fluidOutputs(<liquid:deuterium> * 480000)
//    .property("dimension", 100)
//    .buildAndRegister();
//
//lunar_mining_station.recipeMap
//    .recipeBuilder()
//    .duration(120000)
//    .EUt(125)
//    .inputs(<contenttweaker:helium3rover>)
//    .fluidOutputs(<liquid:helium3> * 480000)
//    .property("dimension", 100)
//    .buildAndRegister();


//game.setLocalization("mbt.machine.microverse_projector_basic.name", "Basic Microverse Projector");
//game.setLocalization("recipemap.microverse_projector_basic.name", "Basic Microverse");