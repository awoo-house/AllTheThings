-- Herbalism - Skill ID 182 / Spell ID 2366
profession(HERBALISM, {
	-- #if BEFORE WOD
	recipe(2383),	-- Find Herbs
	recipe(81708, {	-- Lifeblood (Rank 1) [CATA]
		["timeline"] = { "added 4.0.1", "removed 6.0.2" },
		["rank"] = 1,
	}),
	recipe(55428, {	-- Lifeblood (Rank 1) / Rank 2 [CATA]
		["timeline"] = { "added 3.0.2", "removed 6.0.2" },
		-- #if AFTER CATA
		["rank"] = 2,
		-- #else
		["rank"] = 1,
		-- #endif
	}),
	recipe(55480, {	-- Lifeblood (Rank 2) / Rank 3 [CATA]
		["timeline"] = { "added 3.0.2", "removed 6.0.2" },
		-- #if AFTER CATA
		["rank"] = 3,
		-- #else
		["rank"] = 2,
		-- #endif
	}),
	recipe(55500, {	-- Lifeblood (Rank 3) / Rank 4 [CATA]
		["timeline"] = { "added 3.0.2", "removed 6.0.2" },
		-- #if AFTER CATA
		["rank"] = 4,
		-- #else
		["rank"] = 3,
		-- #endif
	}),
	recipe(55501, {	-- Lifeblood (Rank 4) / Rank 5 [CATA]
		["timeline"] = { "added 3.0.2", "removed 6.0.2" },
		-- #if AFTER CATA
		["rank"] = 5,
		-- #else
		["rank"] = 4,
		-- #endif
	}),
	recipe(55502, {	-- Lifeblood (Rank 5) / Rank 6 [CATA]
		["timeline"] = { "added 3.0.2", "removed 6.0.2" },
		-- #if AFTER CATA
		["rank"] = 6,
		-- #else
		["rank"] = 5,
		-- #endif
	}),
	recipe(55503, {	-- Lifeblood (Rank 6) / Rank 7 [CATA]
		["timeline"] = { "added 3.0.2", "removed 6.0.2" },
		-- #if AFTER CATA
		["rank"] = 7,
		-- #else
		["rank"] = 6,
		-- #endif
	}),
	recipe(74497, {	-- Lifeblood (Rank 8) [CATA]
		["timeline"] = { "added 4.0.1", "removed 6.0.2" },
		["rank"] = 8,
	}),
	recipe(121279, {	-- Lifeblood (Rank 9) [MOP]
		["timeline"] = { "added 5.0.4", "removed 6.0.2" },
		["rank"] = 9,
	}),
	-- #else
	tier(WOD_TIER, {
		filter(BATTLE_PETS, {
			i(118595),	-- Nightshade Sproutling (PET!)
		}),
		n(DROPS, {
			i(111350, {		-- A Compendium of the Herbs of Draenor
				["filterID"] = MISC,
				["description"] = "This can drop from any herb gathering node on Draenor.",
			}),
		}),
	}),
	-- #endif
	-- #if AFTER LEGION
	tier(LEGION_TIER, applyclassicphase(LEGION_PHASE_ONE, {
		filter(RECIPES, {
			{
				["name"] = "Aethril",
				["nextRecipeID"] = 193293,
				["recipeID"] = 193292
			},
			{
				["name"] = "Aethril",
				["nextRecipeID"] = 193294,
				["previousRecipeID"] = 193292,
				["recipeID"] = 193293
			},
			{
				["name"] = "Aethril",
				["previousRecipeID"] = 193293,
				["recipeID"] = 193294
			},
			{
				["name"] = "Astral Glory",
				["nextRecipeID"] = 247813,
				["recipeID"] = 247812
			},
			{
				["name"] = "Astral Glory",
				["nextRecipeID"] = 247814,
				["previousRecipeID"] = 247812,
				["recipeID"] = 247813
			},
			{
				["name"] = "Astral Glory",
				["previousRecipeID"] = 247813,
				["recipeID"] = 247814
			},
			{
				["name"] = "Dreamleaf",
				["nextRecipeID"] = 193296,
				["recipeID"] = 193295
			},
			{
				["name"] = "Dreamleaf",
				["nextRecipeID"] = 193297,
				["previousRecipeID"] = 193295,
				["recipeID"] = 193296
			},
			{
				["name"] = "Dreamleaf",
				["previousRecipeID"] = 193296,
				["recipeID"] = 193297
			},
			{
				["name"] = "Felwort",
				["nextRecipeID"] = 193308,
				["recipeID"] = 193307
			},
			{
				["name"] = "Felwort",
				["nextRecipeID"] = 193309,
				["previousRecipeID"] = 193307,
				["recipeID"] = 193308
			},
			{
				["name"] = "Felwort",
				["previousRecipeID"] = 193308,
				["recipeID"] = 193309
			},
			{
				["name"] = "Fjarnskaggl",
				["nextRecipeID"] = 193302,
				["recipeID"] = 193301
			},
			{
				["name"] = "Fjarnskaggl",
				["nextRecipeID"] = 193303,
				["previousRecipeID"] = 193301,
				["recipeID"] = 193302
			},
			{
				["name"] = "Fjarnskaggl",
				["previousRecipeID"] = 193302,
				["recipeID"] = 193303
			},
			{
				["name"] = "Foxflower",
				["nextRecipeID"] = 193299,
				["recipeID"] = 193298
			},
			{
				["name"] = "Foxflower",
				["nextRecipeID"] = 193300,
				["previousRecipeID"] = 193298,
				["recipeID"] = 193299
			},
			{
				["name"] = "Foxflower",
				["previousRecipeID"] = 193299,
				["recipeID"] = 193300
			},
			{
				["name"] = "Starlight Rose",
				["nextRecipeID"] = 193305,
				["recipeID"] = 193304
			},
			{
				["name"] = "Starlight Rose",
				["nextRecipeID"] = 193306,
				["previousRecipeID"] = 193304,
				["recipeID"] = 193305
			},
			{
				["name"] = "Starlight Rose",
				["previousRecipeID"] = 193305,
				["recipeID"] = 193306
			}
		}),
		filter(BATTLE_PETS, {
			i(153045, {	-- Fel Lasher (PET!)
				["description"] = "This can be looted from any herb on Argus.",
				["timeline"] = { ADDED_7_3_0 }
			}),
		}),
		n(QUESTS, {
			-- TODO: map these
			q(40013, {	-- Aethril Sample
				["requireSkill"] = HERBALISM,
				["provider"] = { "i", 129117 },	-- Aethril Sample
				["maps"] = { AZSUNA, },
			}),
			q(40014, {	-- Spayed by the Spade
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40013,	-- Aethril Sample
				["qg"] = 92464,	-- Kuhuine Tenderstride <Herbalism Trainer>
				["coord"] = { 42.9, 33.8, LEGION_DALARAN },
				["groups"] = {
					recipe(193292),	-- Aethril (Rank 1)
				},
			}),
			q(40015, {	-- Ragged Strips of Silk
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40014,	-- Spayed by the Spade
				["provider"] = { "i", 129135 },	-- Ragged Strips of Silk
				["maps"] = { AZSUNA, },
			}),
			q(40016, {	-- Desperation Breeds Ingenuity
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40015,	-- Ragged Strips of Silk
				["qg"] = 92464,	-- Kuhuine Tenderstride <Herbalism Trainer>
				["coord"] = { 42.9, 33.8, LEGION_DALARAN },
				["groups"] = {
					recipe(193293),	-- Aethril (Rank 2)
				},
			}),
			q(40017, {	-- A Slip of the Hand
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40016,	-- Desperation Breeds Ingenuity
				["maps"] = { AZSUNA, },
				["groups"] = {
					recipe(193294),	-- Aethril (Rank 3)
				},
			}),
			q(48027, {	-- The Glory of Argus
				["requireSkill"] = HERBALISM,
				["provider"] = { "i", 151856 },	-- Withered Astral Glory
				["maps"] = {
					ANTORAN_WASTES,
					KROKUUN,
					EREDATH,
				},
				["groups"] = {
					recipe(247812),	-- Astral Glory (Rank 1)
				},
			}),
			q(48028, {	-- Youthful Resistance
				["requireSkill"] = HERBALISM,
				["provider"] = { "i", 151857 },	-- Adolescent Astral Glory
				["sourceQuest"] = 48027,	-- The Glory of Argus
				["maps"] = {
					ANTORAN_WASTES,
					KROKUUN,
					EREDATH,
				},
				["groups"] = {
					recipe(247813),	-- Astral Glory (Rank 2)
				},
			}),
			q(48029, {	-- The Heart of It
				["requireSkill"] = HERBALISM,
				["provider"] = { "i", 151858 },	-- Astral Glory Root Cluster
				["sourceQuest"] = 48028,	-- Youthful Resistance
				["maps"] = {
					ANTORAN_WASTES,
					KROKUUN,
					EREDATH,
				},
				["groups"] = {
					recipe(247814),	-- Astral Glory (Rank 3)
				},
			}),
			q(40018, {	-- Dreamleaf Sample
				["requireSkill"] = HERBALISM,
				["provider"] = { "i", 129118 },	-- Dreamleaf Sample
				["maps"] = { VALSHARAH },
			}),
			q(40019, {	-- An Empathetic Herb
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40018,	-- Dreamleaf Sample
				["qg"] = 92464,	-- Kuhuine Tenderstride <Herbalism Trainer>
				["coord"] = { 42.9, 33.8, LEGION_DALARAN },
				["groups"] = {
					recipe(193295),	-- Dreamleaf [Rank 1]
				},
			}),
			q(40020, {	-- Twisted to Death
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40019,	-- An Empathetic Herb
				["provider"] = { "i", 129136 },	-- Blight-Twisted Herb
				["maps"] = { VALSHARAH },
			}),
			q(40021, {	-- One Dead Plant is One Too Many
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40020,	-- Twisted to Death
				["qg"] = 98135,	-- Wildcrafter Osme <Herbalism Trainer>
				["groups"] = {
					recipe(193296),	-- Dreamleaf [Rank 2]
				},
			}),
			q(40022, {	-- Choked by Nightmare
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40021,	-- One Dead Plant is One Too Many
				["provider"] = { "i", 129141 },	-- Blight-Choked Herb
				["maps"] = { VALSHARAH },
			}),
			q(40023, {	-- The Last Straw
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40022,	-- Choked by Nightmare
				["qg"] = 98135,	-- Wildcrafter Osme <Herbalism Trainer>
				["groups"] = {
					recipe(193297),	-- Dreamleaf [Rank 3]
				},
			}),
			q(40040, {	-- Felwort Sample
				["requireSkill"] = HERBALISM,
				["provider"] = { "i", 129122 },	-- Felwort Sample
				["maps"] = {
					AZSUNA,
					HIGHMOUNTAIN,
					STORMHEIM,
					SURAMAR,
					VALSHARAH,
				},
				["groups"] = {
					recipe(193307),	-- Felwort [Rank 1]
				},
			}),
			q(40041, {	-- Felwort Analysis
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40040,	-- Felwort Sample
				["qg"] = 92464,	-- Kuhuine Tenderstride <Herbalism Trainer>
				["coord"] = { 42.9, 33.8, LEGION_DALARAN },
				["groups"] = {
					recipe(193308),	-- Felwort [Rank 2]
				},
			}),
			q(40042, {	-- The Emerald Nightmare: Felwort Mastery
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40041,	-- Felwort Analysis
				["qg"] = 92464,	-- Kuhuine Tenderstride <Herbalism Trainer>
				["coord"] = { 42.9, 33.8, LEGION_DALARAN },
				["groups"] = {
					recipe(193309),	-- Felwort [Rank 3]
				},
			}),
			q(40029, {	-- Fjarnskaggl Sample
				["requireSkill"] = HERBALISM,
				["provider"] = { "i", 129120 },	-- Fjarnskaggl Sample
				["maps"] = { STORMHEIM },
				["groups"] = {
					recipe(193301),	-- Fjarnskaggl [Rank 1]
				},
			}),
			q(40030, {	-- Ram's-Horn Trowel
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40029,	-- Fjarnskaggl Sample
				["provider"] = { "i", 129138 },	-- Ram's-Horn Trowel
				["maps"] = { STORMHEIM },
			}),
			q(40031, {	-- Vrykul Herblore
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40030,	-- Ram's-Horn Trowel
				["qg"] = 92464,	-- Kuhuine Tenderstride <Herbalism Trainer>
				["coord"] = { 42.9, 33.8, LEGION_DALARAN },
				["groups"] = {
					recipe(193302),	-- Fjarnskaggl [Rank 2]
				},
			}),
			q(40032, {	-- The Missing Page
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40031,	-- Vrykul Herblore
				["provider"] = { "i", 129142 },		-- Runed Journal Page
				["maps"] = { STORMHEIM },
			}),
			q(40033, {	-- Fjarnskaggl
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40032,	-- The Missing Page
				["qg"] = 92464,	-- Kuhuine Tenderstride <Herbalism Trainer>
				["coord"] = { 42.9, 33.8, LEGION_DALARAN },
				["groups"] = {
					recipe(193303),	-- Fjarnskaggl [Rank 3]
				},
			}),
			q(40024, {	-- Foxflower Sample
				["requireSkill"] = HERBALISM,
				["provider"] = { "i", 129119 },	-- Foxflower Sample
				["maps"] = { HIGHMOUNTAIN },
				["groups"] = {
					recipe(193298),	-- Foxflower [Rank 1]
				},
			}),
			q(40025, {	-- Teeny Bite Marks
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40024,	-- Foxflower Sample
				["provider"] = { "i", 129137 },	-- Nibbled Foxflower Stem
				["maps"] = { HIGHMOUNTAIN },
			}),
			q(40026, {	-- Chase the Culprit
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40025,	-- Teeny Bite Marks
				["qg"] = 92464,	-- Kuhuine Tenderstride <Herbalism Trainer>
				["coord"] = { 42.9, 33.8, LEGION_DALARAN },
				["groups"] = {
					recipe(193299),	-- Foxflower [Rank 2]
				},
			}),
			q(40028, {	-- The Pied Picker
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40026,	-- Chase the Culprit
				["provider"] = { "i", 129278 },		-- Foxflower Scent Gland
				["maps"] = { HIGHMOUNTAIN },
				["groups"] = {
					recipe(193300),	-- Foxflower [Rank 3]
				},
			}),
			q(40034, {	-- Starlight Rosedust
				["requireSkill"] = HERBALISM,
				["provider"] = { "i", 129121 },	-- Starlight Rosedust
				["maps"] = { SURAMAR },
			}),
			q(40035, {	-- The Gentlest Touch
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40034,	-- Starlight Rosedust
				["qg"] = 92464,	-- Kuhuine Tenderstride <Herbalism Trainer>
				["coord"] = { 42.9, 33.8, LEGION_DALARAN },
				["groups"] = {
					recipe(193304),	-- Starlight Rose [Rank 1]
				},
			}),
			q(40036, {	-- Jeweled Spade Handle
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40035,	-- The Gentlest Touch
				["provider"] = { "i", 129140 },	-- Jeweled Spade Handle
				["maps"] = { SURAMAR },
			}),
			q(40037, {	-- The Spade's Blade
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40036,	-- Jeweled Spade Handle
				["qg"] = 92464,	-- Kuhuine Tenderstride <Herbalism Trainer>
				["coord"] = { 42.9, 33.8, LEGION_DALARAN },
				["groups"] = {
					recipe(193305),	-- Starlight Rose [Rank 2]
				},
			}),
			q(40038, {	-- Insane Ramblings
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40037,	-- The Spade's Blade
				["provider"] = { "i", 129143 },	-- Scribbled Ramblings
				["maps"] = { SURAMAR },
			}),
			q(40039, {	-- Tharillon's Fall
				["requireSkill"] = HERBALISM,
				["sourceQuest"] = 40038,	-- Insane Ramblings
				["qg"] = 92464,	-- Kuhuine Tenderstride <Herbalism Trainer>
				["coord"] = { 42.9, 33.8, LEGION_DALARAN },
				["cost"] = { { "i", 129158, 20 } },	-- Starlight Rosedust
				["groups"] = {
					recipe(193306),	-- Starlight Rose [Rank 3]
				},
			}),
		}),
	})),
	-- #endif
	-- #if AFTER BFA
	tier(BFA_TIER, applyclassicphase(BFA_PHASE_ONE, {
		filter(RECIPES, {
			{
				["name"] = "Akunda's Bite",
				["nextRecipeID"] = 252412,
				["recipeID"] = 252411
			},
			{
				["name"] = "Akunda's Bite",
				["nextRecipeID"] = 252413,
				["previousRecipeID"] = 252411,
				["recipeID"] = 252412
			},
			{
				["name"] = "Akunda's Bite",
				["previousRecipeID"] = 252412,
				["recipeID"] = 252413
			},
			{
				["name"] = "Anchor Weed",
				["nextRecipeID"] = 252425,
				["recipeID"] = 252424
			},
			{
				["name"] = "Anchor Weed",
				["nextRecipeID"] = 252426,
				["previousRecipeID"] = 252424,
				["recipeID"] = 252425
			},
			{
				["name"] = "Anchor Weed",
				["previousRecipeID"] = 252425,
				["recipeID"] = 252426
			},
			{
				["name"] = "Riverbud",
				["nextRecipeID"] = 252406,
				["recipeID"] = 252405
			},
			{
				["name"] = "Riverbud",
				["nextRecipeID"] = 252407,
				["previousRecipeID"] = 252405,
				["recipeID"] = 252406
			},
			{
				["name"] = "Riverbud",
				["previousRecipeID"] = 252406,
				["recipeID"] = 252407
			},
			{
				["name"] = "Sea Stalk",
				["nextRecipeID"] = 252422,
				["recipeID"] = 252421
			},
			{
				["name"] = "Sea Stalk",
				["nextRecipeID"] = 252423,
				["previousRecipeID"] = 252421,
				["recipeID"] = 252422
			},
			{
				["name"] = "Sea Stalk",
				["previousRecipeID"] = 252422,
				["recipeID"] = 252423
			},
			{
				["name"] = "Siren's Pollen",
				["nextRecipeID"] = 252419,
				["recipeID"] = 252418
			},
			{
				["name"] = "Siren's Pollen",
				["nextRecipeID"] = 252420,
				["previousRecipeID"] = 252418,
				["recipeID"] = 252419
			},
			{
				["name"] = "Siren's Pollen",
				["previousRecipeID"] = 252419,
				["recipeID"] = 252420
			},
			{
				["name"] = "Star Moss",
				["nextRecipeID"] = 252409,
				["recipeID"] = 252408
			},
			{
				["name"] = "Star Moss",
				["nextRecipeID"] = 252410,
				["previousRecipeID"] = 252408,
				["recipeID"] = 252409
			},
			{
				["name"] = "Star Moss",
				["previousRecipeID"] = 252409,
				["recipeID"] = 252410
			},
			{
				["name"] = "Winter's Kiss",
				["nextRecipeID"] = 252416,
				["recipeID"] = 252415
			},
			{
				["name"] = "Winter's Kiss",
				["nextRecipeID"] = 252417,
				["previousRecipeID"] = 252415,
				["recipeID"] = 252416
			},
			{
				["name"] = "Winter's Kiss",
				["previousRecipeID"] = 252416,
				["recipeID"] = 252417
			},
			{
				["name"] = "Zin'anthid",
				["nextRecipeID"] = 298143,
				["recipeID"] = 298142
			},
			{
				["name"] = "Zin'anthid",
				["nextRecipeID"] = 298144,
				["previousRecipeID"] = 298142,
				["recipeID"] = 298143
			},
			{
				["name"] = "Zin'anthid",
				["previousRecipeID"] = 298143,
				["recipeID"] = 298144
			}
		}),
		-- Coordinate Quests
		n(QUESTS, {
			-- Akunda's Bite
			q(51398, {	-- An Unusual Mentor (A)
				["qg"] = 136096,	-- Declan Senal
				["coord"] = { 70.45, 5.13, BORALUS },
				["description"] = "Requires 50 Kul Tiran Herbalism.",
				["isBreadcrumb"] = true,
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
			}),
			q(51432, {	-- An Unusual Mentor (H)
				["qg"] = 122704,	-- Jahden Fla
				["coord"] = { 42.2, 35.6, DAZARALOR },
				["description"] = "Requires 50 Zandalari Herbalism.",
				["isBreadcrumb"] = true,
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
			}),
			q(51399, {	-- Foul Harvest
				["qg"] = 137572,	-- Patu
				["coord"] = { 62.21, 25.81, VOLDUN },
				["sourceQuests"] = {
					51398,	-- An Unusual Mentor (A)
					51432,	-- An Unusual Mentor (H)
				},
				["requireSkill"] = HERBALISM,
				-- TODO: Akunda's Bite Rank 3?
			}),
			q(51408, {	-- Giving Back to Nature
				["qg"] = 137572,	-- Patu
				["coord"] = { 62.21, 25.81, VOLDUN },
				["sourceQuest"] = 51399,	-- Foul Harvest
				["requireSkill"] = HERBALISM,
				["groups"] = {
					recipe(252412),	-- Akunda's Bite Rank 2
				},
			}),
			-- Anchor Weed
			q(51016, {	-- Seeking More Knowledge
				["qg"] = 136096,	-- Declan Senal
				["coord"] = { 70.45, 5.13, BORALUS },
				["races"] = ALLIANCE_ONLY,
				["requireSkill"] = HERBALISM,
				["description"] = "Requires 100 Kul Tiran Herbalism.",
				["groups"] = {
					recipe(252425),	-- Anchor Weed [Rank 2]
				},
			}),
			q(51482, {	-- Seeking More Knowledge (H)
				["qg"] = 122704,	-- Jahden Fla
				["coord"] = { 42.2, 35.6, DAZARALOR },
				["description"] = "Requires 100 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
				["groups"] = {
					recipe(252425),	-- Anchor Weed (Rank 2)
				},
			}),
			q(51361, {	-- More Anchor Pods (A)
				["qg"] = 136096,	-- Declan Senal
				["coord"] = { 70.45, 5.13, BORALUS },
				["description"] = "Requires 150 Kul Tiran Herbalism.",
				["sourceQuest"] = 51360,	-- Enormous Anchor Pod (A)
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
				["lvl"] = 110,
				["groups"] = {
					recipe(252426),	-- Anchor Weed (Rank 3)
				},
			}),
			q(51481, {	-- More Anchor Pods (H)
				["qg"] = 122704,	-- Jahden Fla
				["coord"] = { 42.2, 35.6, DAZARALOR },
				["sourceQuest"] = 51480,	-- Enormous Anchor Pod (H)
				["description"] = "Requires 150 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
				["groups"] = {
					recipe(252426),	-- Anchor Weed (Rank 3)
				},
			}),
			-- Riverbud
			q(48753, {	-- Emergency Transplants (A)
				["qg"] = 136096,	-- Declan Senal
				["coord"] = { 70.45, 5.13, BORALUS },
				["description"] = "Requires 50 Kul Tiran Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
				["groups"] = {
					recipe(252406),	-- Riverbud (Rank 2)
				},
			}),
			q(51230, {	-- Emergency Transplants [H]
				["qg"] = 122704,	-- Jahden Fla
				["coord"] = { 42.2, 35.6, DAZARALOR },
				["description"] = "Requires 50 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
				["groups"] = {
					recipe(252406),	-- Riverbud (Rank 2)
				},
			}),
			q(48754, {	-- Breaking the Food Chain (A)
				["qg"] = 136096,	-- Declan Senal
				["coord"] = { 70.45, 5.13, BORALUS },
				["sourceQuest"] = 48753,	-- Emergency Transplants (A)
				["description"] = "Requires 150 Kul Tiran Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
				["groups"] = {
					recipe(252407),	-- Riverbud (Rank 3)
				},
			}),
			q(51243, {	-- Breaking the Food Chain [H]
				["qg"] = 122704,	-- Jahden Fla
				["coord"] = { 42.2, 35.6, DAZARALOR },
				["sourceQuest"] = 51230,	-- Emergency Transplants
				["description"] = "Requires 150 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
				["groups"] = {
					recipe(252407),	-- Riverbud (Rank 3)
				},
			}),
			-- Sea Stalk
			q(51365, {	-- Cultural Signifcance (A)
				["qg"] = 136096,	-- Declan Senal
				["coord"] = { 70.45, 5.13, BORALUS },
				["description"] = "Requires 50 Kul Tiran Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
				["groups"] = {
					recipe(252422),	-- Sea Stalk (Rank 2)
				},
			}),
			q(51498, {	-- Cultural Signifcance (H)
				["qg"] = 122704,	-- Jahden Fla
				["coord"] = { 42.2, 35.6, DAZARALOR },
				["description"] = "Requires 50 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
				["groups"] = {
					recipe(252422),	-- Sea Stalk (Rank 2)
				},
			}),
			q(48769, {	-- Gathering Mementos (A)
				["qg"] = 136096,	-- Declan Senal
				["coord"] = { 70.45, 5.13, BORALUS },
				["sourceQuest"] = 51365,	-- Cultural Significance (A)
				["description"] = "Requires 150 Kul Tiran Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
				["groups"] = {
					recipe(252423),	-- Sea Stalk (Rank 3)
				},
			}),
			q(51503, {	-- Gathering Mementos (H)
				["qg"] = 122704,	-- Jahden Fla
				["coord"] = { 42.2, 35.6, DAZARALOR },
				["sourceQuest"] = 51498,	-- Cultural Significance (H)
				["description"] = "Requires 150 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
				["groups"] = {
					recipe(252423),	-- Sea Stalk (Rank 3)
				},
			}),
			-- Star Moss
			q(48756, {	-- Here in Spirit (A)
				["qg"] = 136096,	-- Declan Senal
				["coord"] = { 70.45, 5.13, BORALUS },
				["description"] = "Requires 50 Kul Tiran Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
				["groups"] = {
					recipe(252409),	-- Star Moss (Rank 2)
				},
			}),
			q(51464, {	-- Here in Spirit (H)
				["qg"] = 122704,	-- Jahden Fla
				["coord"] = { 42.2, 35.6, DAZARALOR },
				["description"] = "Requires 50 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
				["groups"] = {
					recipe(252409),	-- Star Moss (Rank 2)
				},
			}),
			q(48757, {	-- Ghost Busting (A)
				["qg"] = 136096,	-- Declan Senal
				["coord"] = { 70.45, 5.13, BORALUS },
				["sourceQuest"] = 48756,	-- Here in Spirit (A)
				["description"] = "Requires 150 Kul Tiran Herbalism.",
				["groups"] = {
					recipe(252410),	-- Star Moss (Rank 3)
				},
			}),
			q(51478, {	-- Ghost Busting (H)
				["qg"] = 122704,	-- Jahden Fla
				["coord"] = { 42.2, 35.6, DAZARALOR },
				["sourceQuest"] = 51464,	-- Here in Spirit (H)
				["description"] = "Requires 150 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
				["groups"] = {
					recipe(252410),	-- Star Moss (Rank 3)
				},
			}),
			-- Siren's Pollen
			q(51313, {	-- Learn From the Best (A)
				["qg"] = 136096,	-- Declan Senal
				["coord"] = { 70.45, 5.13, BORALUS },
				["sourceQuest"] = 51312,	-- Aromatic Pollenator (A)
				["description"] = "Requires 50 Kul Tiran Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
				["groups"] = {
					recipe(252419),	-- Siren's Pollen (Rank 2)
				},
			}),
			q(51448, {	-- Learn From the Best (H)
				["qg"] = 122704,	-- Jahden Fla
				["coord"] = { 42.2, 35.6, DAZARALOR },
				["sourceQuest"] = 51447,	-- Aromatic Pollenator (H)
				["description"] = "Requires 50 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
				["groups"] = {
					recipe(252419),	-- Siren's Pollen (Rank 2)
				},
			}),
			q(48755, {	-- Pollen Punching (A)
				["qg"] = 136096,	-- Declan Senal
				["coord"] = { 70.45, 5.13, BORALUS },
				["sourceQuest"] = 48758,	-- Disgustingly Damp Flower (A)
				["description"] = "Requires 150 Kul Tiran Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
				["groups"] = {
					recipe(252420),	-- Siren's Pollen (Rank 3)
				},
			}),
			q(51452, {	-- Pollen Punching (H)
				["qg"] = 122704,	-- Jahden Fla
				["coord"] = { 42.2, 35.6, DAZARALOR },
				["sourceQuest"] = 48758,	-- Disgustingly Damp Flower (H)
				["description"] = "Requires 150 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
				["groups"] = {
					recipe(252420),	-- Siren's Pollen (Rank 3)
				},
			}),
			-- Winter's Kiss
			q(48762, {	-- Meet Sweetflower (A)
				["isBreadcrumb"] = true,
				["qg"] = 136096,	-- Declan Senal
				["coord"] = { 70.45, 5.13, BORALUS },
				["description"] = "Requires 50 Kul Tiran Herbalism.\nMake sure to bring |cFFFFD7007 Lane Snappers|r for the follow-up quest.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
			}),
			q(51446, {	-- Meet Sweetflower (H)
				["isBreadcrumb"] = true,
				["qg"] = 122704,	-- Jahden Fla
				["coord"] = { 42.2, 35.6, DAZARALOR },
				["description"] = "Requires 50 Zandalari Herbalism.\nMake sure to bring |cFFFFD7007 Lane Snappers|r for the follow-up quest.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
			}),
			q(51376, {	-- Can't Teach on an Empty Stomach
				["qg"] = 136141,	-- Xun Xun Sweetflower
				["coord"] = { 20.61, 45.61, DRUSTVAR },
				["sourceQuests"] = {
					48762,	-- Meet Sweetflower (A)
					51446,	-- Meet Sweetflower (H)
				},
				["requireSkill"] = HERBALISM,
				["groups"] = {
					recipe(252416),	-- Winter's Kiss (Rank 2)
				},
			}),
		}),
		-- All BFA Zones Quests
		n(QUESTS, sharedData({["maps"] = {DRUSTVAR, STORMSONG_VALLEY, TIRAGARDE_SOUND, VOLDUN, NAZMIR, ZULDAZAR}}, {
			-- Anchor Weed
			q(51360, {	-- Enormous Anchor Pod (A)
				["provider"] = { "i", 160035 },	-- Enormous Anchor Pod
				["sourceQuest"] = 51016,	-- Seeking More Knowledge (A)
				["description"] = "This can drop from |cFFFFD700Anchor Weed|r at any herbalism level.  You can only turn it in at Level 150 Kul Tiran Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
			}),
			q(51480, {	-- Enormous Anchor Pod (H)
				["provider"] = { "i", 160035 },	-- Enormous Anchor Pod
				["sourceQuest"] = 51482,	-- Seeking More Knowledge (H)
				["description"] = "This can drop from |cFFFFD700Anchor Weed|r at any herbalism level. You can only turn it in at Level 150 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
			}),
		})),
		-- Drustvar Quests
		n(QUESTS, sharedData({["maps"] = {DRUSTVAR}},{
			-- Siren's Pollen
			q(51312, {	-- Aromatic Pollenator (A)
				["qg"] = 159877,	-- Dead Pollen-Covered Bee
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 50 Kul Tiran Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
			}),
			q(51447, {	-- Aromatic Pollenator (H)
				["qg"] = 159877,	-- Dead Pollen-Covered Bee
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 50 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
			}),
			q(48758, {	-- Disgustingly Damp Flower (A)
				["qg"] = 159956,	-- Disgustingly Damp Flower
				["sourceQuest"] = 51313,	-- Learn From the Best
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 150 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
			}),
			q(51451, {	-- Disgustingly Damp Flower (H)
				["qg"] = 159956,	-- Disgustingly Damp Flower
				["sourceQuest"] = 51448,	-- Learn From the Best
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 150 Zandalari Herbalism.",
				["itemID"] = 159956,	-- Disgustingly Damp Flower
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
			}),
			-- Winter's Kiss
			q(48763, {	-- The Frigid Boon
				["provider"] = { "i", 160064 },	-- The Frigid Boon
				["sourceQuest"] = 51376,	-- Can't Teach on an Empty Stomach
				["description"] = "This can drop from |cFFFFD700Winter's Kiss|r at any herbalism level. You can only turn it in at Level 150 Kul Tiran / Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["groups"] = {
					recipe(252417),	-- Winter's Kiss (Rank 3)
				},
			}),
		})),
		-- Stormsong Valley Quests
		n(QUESTS, sharedData({["maps"] = {STORMSONG_VALLEY}}, {
			-- Siren's Pollen
			q(51312, {	-- Aromatic Pollenator (A)
				["qg"] = 159877,	-- Dead Pollen-Covered Bee
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 50 Kul Tiran Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
			}),
			q(51447, {	-- Aromatic Pollenator (H)
				["qg"] = 159877,	-- Dead Pollen-Covered Bee
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 50 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
			}),
			q(48758, {	-- Disgustingly Damp Flower (A)
				["qg"] = 159956,	-- Disgustingly Damp Flower
				["sourceQuest"] = 51313,	-- Learn From the Best
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 150 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
			}),
			q(51451, {	-- Disgustingly Damp Flower (H)
				["qg"] = 159956,	-- Disgustingly Damp Flower
				["sourceQuest"] = 51448,	-- Learn From the Best
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 150 Zandalari Herbalism.",
				["itemID"] = 159956,	-- Disgustingly Damp Flower
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
			}),
		})),
		-- Tiragarde Sound Quests
		n(QUESTS, sharedData({["maps"] = {TIRAGARDE_SOUND}}, {
			-- Siren's Pollen
			q(51312, {	-- Aromatic Pollenator (A)
				["qg"] = 159877,	-- Dead Pollen-Covered Bee
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 50 Kul Tiran Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
			}),
			q(51447, {	-- Aromatic Pollenator (H)
				["qg"] = 159877,	-- Dead Pollen-Covered Bee
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 50 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
			}),
			q(48758, {	-- Disgustingly Damp Flower (A)
				["qg"] = 159956,	-- Disgustingly Damp Flower
				["sourceQuest"] = 51313,	-- Learn From the Best
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 150 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
			}),
			q(51451, {	-- Disgustingly Damp Flower (H)
				["qg"] = 159956,	-- Disgustingly Damp Flower
				["sourceQuest"] = 51448,	-- Learn From the Best
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 150 Zandalari Herbalism.",
				["itemID"] = 159956,	-- Disgustingly Damp Flower
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
			}),
		})),
		-- Nazmir Quests
		n(QUESTS, sharedData({["maps"] = {NAZMIR}}, {
			-- Siren's Pollen
			q(51312, {	-- Aromatic Pollenator (A)
				["qg"] = 159877,	-- Dead Pollen-Covered Bee
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 50 Kul Tiran Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
			}),
			q(51447, {	-- Aromatic Pollenator (H)
				["qg"] = 159877,	-- Dead Pollen-Covered Bee
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 50 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
			}),
			q(48758, {	-- Disgustingly Damp Flower (A)
				["qg"] = 159956,	-- Disgustingly Damp Flower
				["sourceQuest"] = 51313,	-- Learn From the Best
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 150 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
			}),
			q(51451, {	-- Disgustingly Damp Flower (H)
				["qg"] = 159956,	-- Disgustingly Damp Flower
				["sourceQuest"] = 51448,	-- Learn From the Best
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 150 Zandalari Herbalism.",
				["itemID"] = 159956,	-- Disgustingly Damp Flower
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
			}),
		})),
		-- Voldun Quests
		n(QUESTS, sharedData({["maps"] = {VOLDUN}}, {
			q(51404, {	-- What Happens Next
				["provider"] = { "i", 160117 },	-- Fully Charged Lightning Pod
				["description"] = "This can drop from |cFFFFD700Akunda's Bite|r at Level 150 Kul Tiran / Zandalari Herbalism.",
				["sourceQuest"] = 51408,	-- Giving Back to Nature
				["requireSkill"] = HERBALISM,
				["groups"] = {
					recipe(252413),	-- Akunda's Bite (Rank 3)
				},
			}),
		})),
		-- Zuldazar Quests
		n(QUESTS, sharedData({["maps"] = {ZULDAZAR}}, {
			-- Siren's Pollen
			q(51312, {	-- Aromatic Pollenator (A)
				["qg"] = 159877,	-- Dead Pollen-Covered Bee
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 50 Kul Tiran Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
			}),
			q(51447, {	-- Aromatic Pollenator (H)
				["qg"] = 159877,	-- Dead Pollen-Covered Bee
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 50 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
			}),
			q(48758, {	-- Disgustingly Damp Flower (A)
				["qg"] = 159956,	-- Disgustingly Damp Flower
				["sourceQuest"] = 51313,	-- Learn From the Best
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 150 Zandalari Herbalism.",
				["requireSkill"] = HERBALISM,
				["races"] = ALLIANCE_ONLY,
			}),
			q(51451, {	-- Disgustingly Damp Flower (H)
				["qg"] = 159956,	-- Disgustingly Damp Flower
				["sourceQuest"] = 51448,	-- Learn From the Best
				["description"] = "This can drop from |cFFFFD700Siren's Pollen|r at any herbalism level. You can only turn it in at Level 150 Zandalari Herbalism.",
				["itemID"] = 159956,	-- Disgustingly Damp Flower
				["requireSkill"] = HERBALISM,
				["races"] = HORDE_ONLY,
			}),
		})),
		-- Nazjatar Quests
		n(QUESTS, sharedData({["maps"] = { 1355 }}, {
			q(56098, {	-- Defensive in Death (A)
				["provider"] = { "i", 168919 },	-- Zin'anthid Tentacle
				["races"] = ALLIANCE_ONLY,
				["groups"] = {
					recipe(298144),	-- Herbalism Technique: Zin'anthid (Rank 3)
				},
			}),
			q(56430, {	-- Defensive in Death (H)
				["provider"] = { "i", 169596 },	-- Zin'anthid Tentacle
				["races"] = HORDE_ONLY,
				["groups"] = {
					recipe(298144),	-- Herbalism Technique: Zin'anthid (Rank 3)
				},
			}),
		})),
	})),
	-- #endif
});
