--------------------------------------------
--     H O L I D A Y S  M O D U L E       --
--------------------------------------------
DARKMOON_FAIRE_HEADER = createHeader({
	readable = "Darkmoon Faire",
	constant = "DARKMOON_FAIRE_HEADER",
	icon = [[~_.asset("Event_dmf")]],
	eventID = EVENTS.DARKMOON_FAIRE,
	-- #if BEFORE 4.3.0
	eventIDs = {
		-- #if AFTER TBC
		376,	-- Terrokar Forest
		-- #endif
		374,	-- Elwynn Forest
		375,	-- Thunder Bluff
	},
	-- #if BEFORE WRATH
	-- We have a calendar to pull from in Wrath Classic. :)
	eventSchedule = {
		2, -- Active First Sunday of Every Month until following Saturday at Midnight(DMF)
		2023, 5	-- May 2022 in Terrokar Forest (TBC) / Elwynn Forest (ERA) (active 05/07 at 00:00, end 05/14 at 00:00)
	},
	-- #endif
	-- #endif
	text = {
		en = "Darkmoon Faire",
		es = "Feria de la Luna Negra",
		de = "Dunkelmond-Jahrmarkt",
		fr = "Foire de Sombrelune",
		it = "Fiera di Lunacupa",
		pt = "Feira de Negraluna",
		ru = "Ярмарка Новолуния",
		ko = "다크문 유랑단",
		cn = "暗月马戏团",
	},
});

-- Note: This is up here to prevent the unobtainable flag from getting put on the following items:
local HEAVY_LEATHER_BALL = i(18662);
local DENSE_SHORTBOW = i(11305);
local DARING_DIRK = i(12248);
local BIG_STICK = i(12251);
local SLYVAN_SHORTBOW = i(11308);
local STURDY_RECURVE = i(11306);
local FINE_SHORTBOW = i(11303);
local STEAM_TONK_CONTROLLER = i(22729);
local TIER_ONE_MAX_REPUTATION = { 909, NEUTRAL + 500 };	-- Darkmoon Faire, must be less than 500 over Neutral
local TIER_TWO_MAX_REPUTATION = { 909, NEUTRAL + 1050 };	-- Darkmoon Faire, must be less than 1050 over Neutral
local TIER_THREE_MAX_REPUTATION = { 909, NEUTRAL + 1700 };	-- Darkmoon Faire, must be less than 1700 over Neutral
local TIER_FOUR_MAX_REPUTATION = { 909, NEUTRAL + 2500 };	-- Darkmoon Faire, must be less than 2500 over Neutral
local TIER_FIVE_MAX_REPUTATION = { 909, FRIENDLY + 2001 };	-- Darkmoon Faire, must be less than 2001 over Friendly
local DECK_MAX_REPUTATION = { 909, EXALTED };	-- Darkmoon Faire, must be less than Exalted 999/1000.
local DARKMOON_PRIZE_TICKET = currency(515);	-- Darkmoon Prize Ticket [Cataclysm Version]

-- This is what every online guide ever says, but they're incorrect.
-- The "More" quests appear to be infinitely repeatable, with 0 reputation gains.
-- local TIER_FIVE_MAX_REPUTATION = { 909, HONORED - 1 };	-- Darkmoon Faire, must be less than Honored

local OnTooltipForDarkmoonFaire = [[function(t)
	local reputation = t.reputation;
	if reputation < 42000 then
		local isHuman = _.RaceIndex == 1;
-- #if AFTER TBC
		local repPerDeckTurnIn = isHuman and 385 or 350;
		local repPerTierTurnIn = isHuman and 275 or 250;
-- #else
		local repPerDeckTurnIn = isHuman and 165 or 150;
		local repPerTierTurnIn = isHuman and 110 or 100;
-- #endif
		local tierOneMaxRep = ]] .. TIER_ONE_MAX_REPUTATION[2] .. [[;
		if reputation < tierOneMaxRep then
			local x, n = math.ceil((tierOneMaxRep - reputation) / repPerDeckTurnIn), math.ceil(tierOneMaxRep / repPerDeckTurnIn);
			GameTooltip:AddDoubleLine("Complete Tier 1 Quests", (n - x) .. " / " .. n .. " (" .. x .. ")", 1, 1, 1);
		end
		local tierTwoMaxRep = ]] .. TIER_TWO_MAX_REPUTATION[2] .. [[;
		if reputation >= tierOneMaxRep and reputation < tierTwoMaxRep then
			local x, n = math.ceil((tierTwoMaxRep - reputation) / repPerDeckTurnIn), math.ceil(tierTwoMaxRep / repPerDeckTurnIn);
			GameTooltip:AddDoubleLine("Complete Tier 2 Quests", (n - x) .. " / " .. n .. " (" .. x .. ")", 1, 1, 1);
		end
		local tierThreeMaxRep = ]] .. TIER_THREE_MAX_REPUTATION[2] .. [[;
		if reputation >= tierTwoMaxRep and reputation < tierThreeMaxRep then
			local x, n = math.ceil((tierThreeMaxRep - reputation) / repPerDeckTurnIn), math.ceil(tierThreeMaxRep / repPerDeckTurnIn);
			GameTooltip:AddDoubleLine("Complete Tier 3 Quests", (n - x) .. " / " .. n .. " (" .. x .. ")", 1, 1, 1);
		end
		local tierFourMaxRep = ]] .. TIER_FOUR_MAX_REPUTATION[2] .. [[;
		if reputation >= tierThreeMaxRep and reputation < tierFourMaxRep then
			local x, n = math.ceil((tierFourMaxRep - reputation) / repPerDeckTurnIn), math.ceil(tierFourMaxRep / repPerDeckTurnIn);
			GameTooltip:AddDoubleLine("Complete Tier 4 Quests", (n - x) .. " / " .. n .. " (" .. x .. ")", 1, 1, 1);
		end
		local tierFiveMaxRep = ]] .. TIER_FIVE_MAX_REPUTATION[2] .. [[;
		if reputation >= tierFourMaxRep and reputation < tierFiveMaxRep then
			local x, n = math.ceil((tierFiveMaxRep - reputation) / repPerDeckTurnIn), math.ceil(tierFiveMaxRep / repPerDeckTurnIn);
			GameTooltip:AddDoubleLine("Complete Tier 5 Quests", (n - x) .. " / " .. n .. " (" .. x .. ")", 1, 1, 1);
		end
		local x, n = math.ceil((42000 - reputation) / repPerDeckTurnIn), math.ceil(42000 / repPerDeckTurnIn);
		GameTooltip:AddDoubleLine("Turn in Decks.", (n - x) .. " / " .. n .. " (" .. x .. ")", 1, 1, 1);
	end
end]];

root(ROOTS.Holidays, applyevent(EVENTS.DARKMOON_FAIRE, n(DARKMOON_FAIRE_HEADER, {
	["maps"] = {
		-- #if AFTER 4.3.0
		DARKMOON_ISLAND,
		408,	-- Cauldron of Rock
		-- #else
		ELWYNN_FOREST,
		MULGORE,
		-- #if AFTER TBC
		TEROKKAR_FOREST,
		-- #endif
		-- #endif
	},
	["groups"] = {
		n(ACHIEVEMENTS, {
			petbattle(ach(9069, {	-- An Awfully Big Adventure
				["timeline"] = { "added 6.0.2" },
				["collectible"] = false,
				["filterID"] = BATTLE_PETS,
				["groups"] = {
					crit(10, {	-- Christoph VonFeasel
						["coord"] = { 47.4, 62.2, DARKMOON_ISLAND },
						["cr"] = 85519,	-- Christoph VonFeasel <Grand Master Pet Tamer>
					}),
					crit(20, {	-- Jeremy Feasel
						["coord"] = { 47.8, 62.6, DARKMOON_ISLAND },
						["cr"] = 67370,	-- Jeremy Feasel <Master Pet Tamer>
					}),
				},
			})),
			ach(15215,	-- Can't Stop the Feeling
			bubbleDownSelf({ ["timeline"] = { "added 9.2.0" } }, {
				ach(15214),	-- What a Feeling
			})),
			ach(6019),	-- Come One, Come All!
			ach(15221,	-- Dancing Machine
			bubbleDownSelf({ ["timeline"] = { "added 9.2.0" } }, {
				-- Meta Achievement
				["sym"] = {{"meta_achievement",
					15215,	-- Can't Stop the Feeling
					15223,	-- Feeling It
					15217,	-- Maniac on the Dance Floor
				}},
				["groups"] = {
					i(187689),	-- Dance Dance Darkmoon (TOY!)
				},
			})),
			ach(6028, {	-- Darkmoon Defender
				crit(1, {	-- Adventurer's Journal
					["_quests"] = { 29458 },	-- The Captured Journal
				}),
				crit(2, {	-- Banner of the Fallen
					["_quests"] = { 29456 },	-- A Captured Banner
				}),
				crit(3, {	-- Captured Insignia
					["_quests"] = { 29457 },	-- The Enemy's Insignia
				}),
			}),
			ach(6029, {	-- Darkmoon Despoiler
				crit(1, {	-- Adventurer's Journal
					["_quests"] = { 29458 },	-- The Captured Journal
				}),
				crit(2, {	-- A Treatise on Strategy
					["_quests"] = { 29451 },	-- The Master Strategist
				}),
				crit(3, {	-- Mysterious Grimoire
					["_quests"] = { 29445 },	-- An Intriguing Grimoire
				}),
				crit(4, {	-- Ornate Weapon
					["_quests"] = { 29446 },	-- A Wondrous Weapon
				}),
				crit(5, {	-- Banner of the Fallen
					["_quests"] = { 29456 },	-- A Captured Banner
				}),
				crit(6, {	-- Soothsayer's Runes
					["_quests"] = { 29464 },	-- Tools of Divination
				}),
				crit(7, {	-- Captured Insignia
					["_quests"] = { 29457 },	-- The Enemy's Insignia
				}),
				crit(8, {	-- Imbued Crystal
					["_quests"] = { 29443 },	-- A Curious Crystal
				}),
				crit(9, {	-- Monstrous Egg
					["_quests"] = { 29444 },	-- An Exotic Egg
				}),
			}),
			ach(6027, {	-- Darkmoon Dungeoneer
				crit(1, {	-- A Treatise on Strategy
					["_quests"] = { 29451 },	-- The Master Strategist
				}),
				crit(2, {	-- Imbued Crystal
					["_quests"] = { 29443 },	-- A Curious Crystal
				}),
				crit(3, {	-- Monstrous Egg
					["_quests"] = { 29444 },	-- An Exotic Egg
				}),
				crit(4, {	-- Mysterious Grimoire
					["_quests"] = { 29445 },	-- An Intriguing Grimoire
				}),
				crit(5, {	-- Ornate Weapon
					["_quests"] = { 29446 },	-- A Wondrous Weapon
				}),
			}),
			ach(15213,	-- Don't Stop Dancing
			bubbleDownSelf({ ["timeline"] = { "added 9.2.0" } }, {
				ach(15212),	-- First Dance
			})),
			ach(6032, {	-- Faire Favors
				crit(1, {	-- Alchemy
					["_quests"] = { 29506 },	-- A Fizzy Fusion
				}),
				crit(2, {	-- Archaeology
					["_quests"] = { 29507 },	-- Fun for the Little Ones
				}),
				crit(3, {	-- Blacksmithing
					["_quests"] = { 29508 },	-- Baby Needs Two Pair of Shoes
				}),
				crit(4, {	-- Cooking
					["_quests"] = { 29509 },	-- Putting the Crunch in the Frog
				}),
				crit(5, {	-- Enchanting
					["_quests"] = { 29510 },	-- Putting Trash to Good Use
				}),
				crit(6, {	-- Engineering
					["_quests"] = { 29511 },	-- Talking' Tonks
				}),
				crit(7, {	-- Fishing
					["_quests"] = { 29513 },	-- Spoilin' for Salty Sea Dogs
				}),
				crit(8, {	-- Herbalism
					["_quests"] = { 29514 },	-- Herbs for Healing
				}),
				crit(9, {	-- Inscription
					["_quests"] = { 29515 },	-- Writing the Future
				}),
				crit(10, {	-- Jewelcrafting
					["_quests"] = { 29516 },	-- Keeping the Faire Sparkling
				}),
				crit(11, {	-- Leatherworking
					["_quests"] = { 29517 },	-- Eyes on the Prizes
				}),
				crit(12, {	-- Mining
					["_quests"] = { 29518 },	-- Rearm, Reuse, Recycle
				}),
				crit(13, {	-- Skinning
					["_quests"] = { 29519 },	-- Tan My Hide
				}),
				crit(14, {	-- Tailoring
					["_quests"] = { 29520 },	-- Banners, Banners Everywhere!
				}),
			}),
			ach(6026, {	-- Fairegoer's Feast
				crit(1, {	-- Corn-Breaded Sausage
					["provider"] = { "i", 44940 },
				}),
				crit(2, {	-- Crunchy Frog
					["provider"] = { "i", 19306 },
				}),
				crit(3, {	-- Darkmoon Dog
					["provider"] = { "i", 19223 },
				}),
				crit(4, {	-- Deep Fried Candybar
					["provider"] = { "i", 19225 },
				}),
				crit(5, {	-- Forest Strider Drumstick
					["provider"] = { "i", 33254 },
				}),
				crit(6, {	-- Funnel Cake
					["provider"] = { "i", 33246 },
				}),
				crit(7, {	-- Pickled Kodo Foot
					["provider"] = { "i", 19305 },
				}),
				crit(8, {	-- Red Hot Wings
					["provider"] = { "i", 19224 },
				}),
				crit(9, {	-- Salty Sea Dog
					["provider"] = { "i", 73260 },
				}),
				crit(10, {	-- Spiced Beef Jerky
					["provider"] = { "i", 19304 },
				}),
				crit(11, {	-- Bottled Winterspring Water
					["provider"] = { "i", 19300 },
				}),
				crit(12, {	-- Cheap Beer
					["provider"] = { "i", 19222 },
				}),
				crit(13, {	-- Darkmoon Special Reserve
					["provider"] = { "i", 19221 },
				}),
				crit(14, {	-- Fizzy Faire Drink
					["provider"] = { "i", 19299 },
				}),
				crit(15, {	-- Fizzy Faire Drink "Classic"
					["provider"] = { "i", 33236 },
				}),
				crit(16, {	-- Fresh-Squeezed Limeade
					["provider"] = { "i", 44941 },
				}),
				crit(17, {	-- Iced Berry Slush
					["provider"] = { "i", 33234 },
				}),
				crit(18, {	-- Sasparilla Sinker
					["provider"] = { "i", 74822 },
				}),
			}),
			ach(15223,	-- Feeling It
			bubbleDownSelf({ ["timeline"] = { "added 9.2.0" } }, {
				ach(15222),	-- You Got the Beat
			})),
			ach(6025),	-- I Was Promised a Pony
			ach(15217,	-- Maniac on the Dance Floor
			bubbleDownSelf({ ["timeline"] = { "added 9.2.0" } }, {
				ach(15216),	-- Make You Sweat
			})),
			ach(6020, {	-- Step Right Up
				crit(1, {	-- Cannon Blast
					["_quests"] = { 29436 },	-- The Humanoid Cannonball
				}),
				crit(2, {	-- Shooting Gallery
					["_quests"] = { 29438 },	-- He Shoots, He Scores!
				}),
				crit(3, {	-- Ring Toss
					["_quests"] = { 29455 },	-- Target: Turtle
				}),
				crit(4, {	-- Tonk Battle
					["_quests"] = { 29434 },	-- Tonk Commander
				}),
				crit(5, {	-- Whack-A-Gnoll
					["_quests"] = { 29463 },	-- It's Hammer Time
				}),
			}),
			a(ach(6030, {	-- Taking the Show on the Road (A)
				crit(1, {	-- Dalaran
					["maps"] = { NORTHREND_DALARAN },
				}),
				crit(2, {	-- Darnassus
					["maps"] = { DARNASSUS },
				}),
				crit(3, {	-- The Exodar
					["maps"] = { THE_EXODAR },
				}),
				crit(4, {	-- Ironforge
					["maps"] = { IRONFORGE },
				}),
				crit(5, {	-- Shattrath City
					["maps"] = { SHATTRATH_CITY },
				}),
				crit(6, {	-- Stormwind City
					["maps"] = { STORMWIND_CITY },
				}),
			})),
			h(ach(6031, {	-- Taking the Show on the Road (H)
				crit(1, {	-- Dalaran
					["maps"] = { NORTHREND_DALARAN },
				}),
				crit(2, {	-- Orgrimmar
					["maps"] = { ORGRIMMAR },
				}),
				crit(3, {	-- Shattrath City
					["maps"] = { SHATTRATH_CITY },
				}),
				crit(4, {	-- Silvermoon City
					["maps"] = { SILVERMOON_CITY },
				}),
				crit(5, {	-- Thunder Bluff
					["maps"] = { THUNDER_BLUFF },
				}),
				crit(6, {	-- Undercity
					["maps"] = { UNDERCITY },
				}),
			})),
		}),
		-- #if AFTER 5.1.0
		battlepets({
			pet(1068, {	-- Crow (PET!)
				["timeline"] = { ADDED_5_1_0 },
			}),
			pet(1062, {	-- Darkmoon Glowfly (PET!)
				["timeline"] = { ADDED_5_1_0 },
			}),
		}),
		-- #endif
		n(DROPS, {
			["description"] = "The following can drop from instanced content when a Darkmoon Adventurer's Guide is in your bags.",
			["provider"] = { "i", 71634 },	-- Darkmoon Adventurer's Guide
			["timeline"] = { "added 4.3.0.14899" },
			["groups"] = {
				-- PvE
				i(71715, {	-- A Treatise on Strategy
					["description"] = "Can drop from instanced PvE content when a Darkmoon Adventurer's Guide is in your bags.",
				}),
				i(71635, {	-- Imbued Crystal
					["description"] = "Can drop from instanced PvE content when a Darkmoon Adventurer's Guide is in your bags.",
				}),
				i(71636, {	-- Monstrous Egg
					["description"] = "Can drop from instanced PvE content when a Darkmoon Adventurer's Guide is in your bags.",
				}),
				i(71637, {	-- Mysterious Grimoire
					["description"] = "Can drop from instanced PvE content when a Darkmoon Adventurer's Guide is in your bags.",
				}),
				i(71638, {	-- Ornate Weapon
					["description"] = "Can drop from instanced PvE content when a Darkmoon Adventurer's Guide is in your bags.",
				}),
				i(71716, {	-- Soothsayer's Runes
					["description"] = "Can drop from instanced PvE content when a Darkmoon Adventurer's Guide is in your bags.",
				}),

				-- PvP
				pvp(i(71951, {	-- Banner of the Fallen
					["description"] = "Can drop from instanced PvP content when a Darkmoon Adventurer's Guide is in your bags.",
				})),
				pvp(i(71952, {	-- Captured Insignia
					["description"] = "Can drop from instanced PvP content when a Darkmoon Adventurer's Guide is in your bags.",
				})),
				pvp(i(71953, {	-- Fallen Adventurer's Journal
					["description"] = "Can drop from instanced PvP content when a Darkmoon Adventurer's Guide is in your bags.",
				})),
			},
		}),
		n(FACTIONS, {
			faction(909, {	-- Darkmoon Faire
				["icon"] = [[~_.asset("Event_dmf")]],
				-- #if BEFOR 4.3.0
				["OnTooltip"] = OnTooltipForDarkmoonFaire,
				-- #endif
			}),
		}),
		-- #if AFTER 4.3.0
		prof(FISHING, {
			i(35286),	-- Bloated Giant Sunfish
			i(127141, {	-- Bloated Thresher
				["timeline"] = { ADDED_6_2_0 },
				["groups"] = {
					i(124669, {	-- Darkmoon Daggermaw
						["timeline"] = { ADDED_6_2_0 },
					}),
				},
			}),
			i(124669, {	-- Darkmoon Daggermaw
				["timeline"] = { ADDED_6_2_0 },
			}),
			i(93732, {	-- Darkmoon Fishing Cap
				["timeline"] = { "added 5.2.0.16408" },
			}),
			i(73953, {	-- Sea Pony (PET!)
				["timeline"] = { "added 4.3.0.15005" },
			}),
		}),
		-- #endif
		n(QUESTS, {	-- TODO: Finish merging this into the section below, this section is from Classic.
			q(7930, {	-- 5 Tickets - Darkmoon Flower
				["qg"] = 14828,  -- Gelvas Grimegate <Darkmoon Faire Ticket Redemption>
				["coords"] = {
					{ 37.3, 37.7, MULGORE },
					{ 41.6, 68.8, ELWYNN_FOREST },
					-- #if AFTER TBC
					{ 34.7, 34.4, TEROKKAR_FOREST },
					-- #endif
				},
				["repeatable"] = true,
				["cost"] = {
					{ "i", 19182, 5 },	-- Darkmoon Faire Prize Ticket
				},
				["lvl"] = 6,
				["groups"] = {
					i(19295),	-- Darkmoon Flower
				},
			}),
			q(7931, {	-- 5 Tickets - Minor Darkmoon Prize
				["qg"] = 14828,  -- Gelvas Grimegate <Darkmoon Faire Ticket Redemption>
				["coords"] = {
					{ 37.3, 37.7, MULGORE },
					{ 41.6, 68.8, ELWYNN_FOREST },
					-- #if AFTER TBC
					{ 34.7, 34.4, TEROKKAR_FOREST },
					-- #endif
				},
				["repeatable"] = true,
				["cost"] = {
					{ "i", 19182, 5 },	-- Darkmoon Faire Prize Ticket
				},
				["lvl"] = 15,
				["groups"] = {
					i(19298),	-- Minor Darkmoon Prize
				},
			}),
			q(7935, {	-- 10 Tickets - Last Month's Mutton
				["qg"] = 14828,  -- Gelvas Grimegate <Darkmoon Faire Ticket Redemption>
				["coords"] = {
					{ 37.3, 37.7, MULGORE },
					{ 41.6, 68.8, ELWYNN_FOREST },
					-- #if AFTER TBC
					{ 34.7, 34.4, TEROKKAR_FOREST },
					-- #endif
				},
				["repeatable"] = true,
				["cost"] = {
					{ "i", 19182, 10 },	-- Darkmoon Faire Prize Ticket
				},
				["groups"] = {
					i(19292),	-- Last Month's Mutton
				},
			}),
			q(7932, {	-- 12 Tickets - Lesser Darkmoon Prize
				["qg"] = 14828,  -- Gelvas Grimegate <Darkmoon Faire Ticket Redemption>
				["coords"] = {
					{ 37.3, 37.7, MULGORE },
					{ 41.6, 68.8, ELWYNN_FOREST },
					-- #if AFTER TBC
					{ 34.7, 34.4, TEROKKAR_FOREST },
					-- #endif
				},
				["repeatable"] = true,
				["cost"] = {
					{ "i", 19182, 12 },	-- Darkmoon Faire Prize Ticket
				},
				["groups"] = {
					i(19297),	-- Lesser Darkmoon Prize
				},
			}),
			q(7933, {	-- 40 Tickets - Greater Darkmoon Prize
				["qg"] = 14828,  -- Gelvas Grimegate <Darkmoon Faire Ticket Redemption>
				["coords"] = {
					{ 37.3, 37.7, MULGORE },
					{ 41.6, 68.8, ELWYNN_FOREST },
					-- #if AFTER TBC
					{ 34.7, 34.4, TEROKKAR_FOREST },
					-- #endif
				},
				["repeatable"] = true,
				["cost"] = {
					{ "i", 19182, 40 },	-- Darkmoon Faire Prize Ticket
				},
				["groups"] = {
					i(19296),	-- Greater Darkmoon Prize
				},
			}),
			applyclassicphase(TBC_PHASE_ONE, q(9249, {	-- 40 Tickets - Schematic: Steam Tonk Controller
				["qg"] = 14828,  -- Gelvas Grimegate <Darkmoon Faire Ticket Redemption>
				["coords"] = {
					{ 37.3, 37.7, MULGORE },
					{ 41.6, 68.8, ELWYNN_FOREST },
					-- #if AFTER TBC
					{ 34.7, 34.4, TEROKKAR_FOREST },
					-- #endif
				},
				["repeatable"] = true,
				["cost"] = {
					{ "i", 19182, 40 },	-- Darkmoon Faire Prize Ticket
				},
				["groups"] = {
					STEAM_TONK_CONTROLLER,
				},
			})),
			q(7934, {	-- 50 Tickets - Darkmoon Storage Box
				["qg"] = 14828,  -- Gelvas Grimegate <Darkmoon Faire Ticket Redemption>
				["coords"] = {
					{ 37.3, 37.7, MULGORE },
					{ 41.6, 68.8, ELWYNN_FOREST },
					-- #if AFTER TBC
					{ 34.7, 34.4, TEROKKAR_FOREST },
					-- #endif
				},
				["repeatable"] = true,
				["cost"] = {
					{ "i", 19182, 50 },	-- Darkmoon Faire Prize Ticket
				},
				["groups"] = {
					i(19291),	-- Darkmoon Storage Box
				},
			}),
			q(7936, {	-- 50 Tickets - Last Year's Mutton
				["qg"] = 14828,  -- Gelvas Grimegate <Darkmoon Faire Ticket Redemption>
				["coords"] = {
					{ 37.3, 37.7, MULGORE },
					{ 41.6, 68.8, ELWYNN_FOREST },
					-- #if AFTER TBC
					{ 34.7, 34.4, TEROKKAR_FOREST },
					-- #endif
				},
				["repeatable"] = true,
				["cost"] = {
					{ "i", 19182, 50 },	-- Darkmoon Faire Prize Ticket
				},
				["groups"] = {
					i(19293),	-- Last Year's Mutton
				},
			}),
			q(7981, {	-- 1200 Tickets - Amulet of the Darkmoon
				["qg"] = 14828,  -- Gelvas Grimegate <Darkmoon Faire Ticket Redemption>
				["coords"] = {
					{ 37.3, 37.7, MULGORE },
					{ 41.6, 68.8, ELWYNN_FOREST },
					-- #if AFTER TBC
					{ 34.7, 34.4, TEROKKAR_FOREST },
					-- #endif
				},
				["repeatable"] = true,
				["cost"] = {
					{ "i", 19182, 1200 },	-- Darkmoon Faire Prize Ticket
				},
				["groups"] = {
					i(19491),	-- Amulet of the Darkmoon
				},
			}),
			q(7940, {	-- 1200 Tickets - Orb of the Darkmoon
				["qg"] = 14828,  -- Gelvas Grimegate <Darkmoon Faire Ticket Redemption>
				["coords"] = {
					{ 37.3, 37.7, MULGORE },
					{ 41.6, 68.8, ELWYNN_FOREST },
					-- #if AFTER TBC
					{ 34.7, 34.4, TEROKKAR_FOREST },
					-- #endif
				},
				["repeatable"] = true,
				["cost"] = {
					{ "i", 19182, 1200 },	-- Darkmoon Faire Prize Ticket
				},
				["groups"] = {
					i(19426),	-- Orb of the Darkmoon
				},
			}),
			q(7885, {	-- Armor Kits [Tier 5]
				["qg"] = 14833,  -- Chronos <He Who Never Forgets!>
				["coords"] = {
					{ 43.5, 71.1, ELWYNN_FOREST },
					{ 36.2, 35.2, MULGORE },
					-- #if AFTER TBC
					{ 33.8, 36.0, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_FIVE_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 15564, 8 },	-- Rugged Armor Kit
				},
				["lvl"] = 40,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7892, {	-- Big Black Mace [Tier 4]
				["qg"] = 14832,  -- Kerri Hicks <The Strongest Woman Alive!>
				["coords"] = {
					{ 40.5, 69.9, ELWYNN_FOREST },
					{ 37.8, 39.8, MULGORE },
					-- #if AFTER TBC
					{ 34.8, 35.1, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_FOUR_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 7945, 1 },	-- Big Black Mace
				},
				["lvl"] = 30,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7881, {	-- Carnival Boots [Tier 1]
				["qg"] = 14833,  -- Chronos <He Who Never Forgets!>
				["coords"] = {
					{ 43.5, 71.1, ELWYNN_FOREST },
					{ 36.2, 35.2, MULGORE },
					-- #if AFTER TBC
					{ 33.8, 36.0, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_ONE_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 2309, 3 },	-- Embossed Leather Boots
				},
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7882, {	-- Carnival Jerkins [Tier 2]
				["qg"] = 14833,  -- Chronos <He Who Never Forgets!>
				["coords"] = {
					{ 43.5, 71.1, ELWYNN_FOREST },
					{ 36.2, 35.2, MULGORE },
					-- #if AFTER TBC
					{ 33.8, 36.0, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_TWO_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 2314, 3 },	-- Toughened Leather Armor
				},
				["lvl"] = 10,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7889, {	-- Coarse Weightstone [Tier 1]
				["qg"] = 14832,  -- Kerri Hicks <The Strongest Woman Alive!>
				["coords"] = {
					{ 40.5, 69.9, ELWYNN_FOREST },
					{ 37.8, 39.8, MULGORE },
					-- #if AFTER TBC
					{ 34.8, 35.1, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_ONE_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 3240, 10 },	-- Coarse Weightstone
				},
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7894, {	-- Copper Modulator [Tier 1]
				["qg"] = 14841,  -- Rinling
				["coords"] = {
					{ 41.7, 70.7, ELWYNN_FOREST },
					{ 37.1, 37.2, MULGORE },
					-- #if AFTER TBC
					{ 34.0, 34.8, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_ONE_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 4363, 5 },	-- Copper Modulator
				},
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7884, {	-- Crocolisk Boy and the Bearded Murloc [Tier 4]
				["qg"] = 14833,  -- Chronos <He Who Never Forgets!>
				["coords"] = {
					{ 43.5, 71.1, ELWYNN_FOREST },
					{ 36.2, 35.2, MULGORE },
					-- #if AFTER TBC
					{ 33.8, 36.0, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_FOUR_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 8185, 1 },	-- Turtle Scale Leggings
				},
				["lvl"] = 30,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			applyclassicphase(PHASE_THREE, q(7907, {	-- Darkmoon Beast Deck
				["provider"] = { "i", 19228 },  -- Beasts Deck
				["maxReputation"] = DECK_MAX_REPUTATION,
				["repeatable"] = true,
				["groups"] = {
					i(19288),	-- Darkmoon Card: Blue Dragon
				},
			})),
			applyclassicphase(TBC_PHASE_THREE, q(10938, {	-- Darkmoon Blessings Deck
				["provider"] = { "i", 31890 },  -- Blessings Deck
				["maxReputation"] = DECK_MAX_REPUTATION,
				["repeatable"] = true,
				["groups"] = {
					i(31856),	-- Darkmoon Card: Crusade
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, q(13325, {	-- Darkmoon Chaos Deck
				["provider"] = { "i", 44276 },	-- Chaos Deck
				["maxReputation"] = DECK_MAX_REPUTATION,
				["repeatable"] = true,
				["groups"] = {
					i(42989),	-- Darkmoon Card: Berserker!
				},
			})),
			applyclassicphase(PHASE_THREE, q(7929, {	-- Darkmoon Elementals Deck
				["provider"] = { "i", 19267 },  -- Elementals Deck
				["maxReputation"] = DECK_MAX_REPUTATION,
				["repeatable"] = true,
				["groups"] = {
					i(19289),	-- Darkmoon Card: Maelstrom
				},
			})),
			applyclassicphase(TBC_PHASE_THREE, q(10940, {	-- Darkmoon Furies Deck
				["provider"] = { "i", 31907 },  -- Furies Deck
				["maxReputation"] = DECK_MAX_REPUTATION,
				["repeatable"] = true,
				["groups"] = {
					i(31858),	-- Darkmoon Card: Vengeance
				},
			})),
			applyclassicphase(TBC_PHASE_THREE, q(10941, {	-- Darkmoon Lunacy Deck
				["provider"] = { "i", 31914 },  -- Lunacy Deck
				["maxReputation"] = DECK_MAX_REPUTATION,
				["repeatable"] = true,
				["groups"] = {
					i(31859),	-- Darkmoon Card: Madness
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, q(13326, {	-- Darkmoon Nobles Deck
				["provider"] = { "i", 44326 },	-- Nobles Deck
				["maxReputation"] = DECK_MAX_REPUTATION,
				["repeatable"] = true,
				["groups"] = {
					i(44253),	-- Darkmoon Card: Greatness
					i(44255),	-- Darkmoon Card: Greatness
					i(42987),	-- Darkmoon Card: Greatness
					i(44254),	-- Darkmoon Card: Greatness
				},
			})),
			applyclassicphase(PHASE_THREE, q(7927, {	-- Darkmoon Portals Deck
				["provider"] = { "i", 19277 },  -- Portals Deck
				["maxReputation"] = DECK_MAX_REPUTATION,
				["repeatable"] = true,
				["groups"] = {
					i(19290),	-- Darkmoon Card: Twisting Nether
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, q(13324, {	-- Darkmoon Prisms Deck
				["provider"] = { "i", 44259 },	-- Prisms Deck
				["maxReputation"] = DECK_MAX_REPUTATION,
				["repeatable"] = true,
				["groups"] = {
					i(42988),	-- Darkmoon Card: Illusion
				},
			})),
			applyclassicphase(TBC_PHASE_THREE, q(10939, {	-- Darkmoon Storms Deck
				["provider"] = { "i", 31891 },  -- Storms Deck
				["maxReputation"] = DECK_MAX_REPUTATION,
				["repeatable"] = true,
				["groups"] = {
					i(31857),	-- Darkmoon Card: Wrath
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, q(13327, {	-- Darkmoon Undeath Deck
				["provider"] = { "i", 44294 },	-- Undeath Deck
				["maxReputation"] = DECK_MAX_REPUTATION,
				["repeatable"] = true,
				["groups"] = {
					i(42990),	-- Darkmoon Card: Death
				},
			})),
			applyclassicphase(PHASE_THREE, q(7928, {	-- Darkmoon Warlords Deck
				["provider"] = { "i", 19257 },  -- Warlords Deck
				["maxReputation"] = DECK_MAX_REPUTATION,
				["repeatable"] = true,
				["groups"] = {
					i(19287),	-- Darkmoon Card: Heroism
				},
			})),
			q(7903, {	-- Evil Bat Eyes [Tier 5]
				["qg"] = 14829,  -- Yebb Neblegear
				["coords"] = {
					{ 40.2, 69.7, ELWYNN_FOREST },
					{ 37.5, 39.6, MULGORE },
					-- #if AFTER TBC
					{ 34.3, 35.7, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_FIVE_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 11404, 10 },	-- Evil Bat Eye
				},
				["lvl"] = 40,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(8222, {	-- Glowing Scorpid Blood [Tier 5]
				["qg"] = 14829,  -- Yebb Neblegear
				["coords"] = {
					{ 40.2, 69.7, ELWYNN_FOREST },
					{ 37.5, 39.6, MULGORE },
					-- #if AFTER TBC
					{ 34.3, 35.7, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_FIVE_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 19933, 10 },	-- Glowing Scorpid Blood
				},
				["lvl"] = 40,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7896, {	-- Green Fireworks [Tier 3]
				["qg"] = 14841,  -- Rinling
				["coords"] = {
					{ 41.7, 70.7, ELWYNN_FOREST },
					{ 37.1, 37.2, MULGORE },
					-- #if AFTER TBC
					{ 34.0, 34.8, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_THREE_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 9313, 36 },	-- Green Firework
				},
				["lvl"] = 20,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7891, {	-- Green Iron Bracers [Tier 3]
				["qg"] = 14832,  -- Kerri Hicks <The Strongest Woman Alive!>
				["coords"] = {
					{ 40.5, 69.9, ELWYNN_FOREST },
					{ 37.8, 39.8, MULGORE },
					-- #if AFTER TBC
					{ 34.8, 35.1, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_THREE_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 3835, 3 },	-- Green Iron Bracers
				},
				["lvl"] = 20,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7890, {	-- Heavy Grinding Stone [Tier 2]
				["qg"] = 14832,  -- Kerri Hicks <The Strongest Woman Alive!>
				["coords"] = {
					{ 40.5, 69.9, ELWYNN_FOREST },
					{ 37.8, 39.8, MULGORE },
					-- #if AFTER TBC
					{ 34.8, 35.1, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_TWO_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 3486, 7 },	-- Heavy Grinding Stone
				},
				["lvl"] = 10,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7897, {	-- Mechanical Repair Kits [Tier 4]
				["qg"] = 14841,  -- Rinling
				["coords"] = {
					{ 41.7, 70.7, ELWYNN_FOREST },
					{ 37.1, 37.2, MULGORE },
					-- #if AFTER TBC
					{ 34.0, 34.8, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_FOUR_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 11590, 6 },	-- Mechanical Repair Kit
				},
				["lvl"] = 30,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7941, {	-- More Armor Kits [Tier 5] (Not Really)
				["qg"] = 14833,  -- Chronos <He Who Never Forgets!>
				["coords"] = {
					{ 43.5, 71.1, ELWYNN_FOREST },
					{ 36.2, 35.2, MULGORE },
					-- #if AFTER TBC
					{ 33.8, 36.0, TEROKKAR_FOREST },
					-- #endif
				},
				["sourceQuest"] = 7885,	-- Armor Kits
				["repeatable"] = true,
				["cost"] = {
					{ "i", 15564, 8 },	-- Rugged Armor Kit
				},
				["lvl"] = 40,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7943, {	-- More Bat Eyes [Tier 5] (Not Really)
				["qg"] = 14829,  -- Yebb Neblegear
				["sourceQuest"] = 7903,	-- Evil Bat Eyes
				["coords"] = {
					{ 40.2, 69.7, ELWYNN_FOREST },
					{ 37.5, 39.6, MULGORE },
					-- #if AFTER TBC
					{ 34.3, 35.7, TEROKKAR_FOREST },
					-- #endif
				},
				["repeatable"] = true,
				["cost"] = {
					{ "i", 11404, 10 },	-- Evil Bat Eye
				},
				["lvl"] = 40,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7939, {	-- More Dense Grinding Stones [Tier 5] (Not Really)
				["qg"] = 14832,  -- Kerri Hicks <The Strongest Woman Alive!>
				["sourceQuest"] = 7893,	-- Rituals of Strength
				["coords"] = {
					{ 40.5, 69.9, ELWYNN_FOREST },
					{ 37.8, 39.8, MULGORE },
					-- #if AFTER TBC
					{ 34.8, 35.1, TEROKKAR_FOREST },
					-- #endif
				},
				["repeatable"] = true,
				["cost"] = {
					{ "i", 12644, 8 },	-- Dense Grinding Stone
				},
				["lvl"] = 40,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(8223, {	-- More Glowing Scorpid Blood [Tier 5] (Not Really)
				["qg"] = 14829,  -- Yebb Neblegear
				["sourceQuest"] = 8222,	-- Glowing Scorpid Blood
				["coords"] = {
					{ 40.2, 69.7, ELWYNN_FOREST },
					{ 37.5, 39.6, MULGORE },
					-- #if AFTER TBC
					{ 34.3, 35.7, TEROKKAR_FOREST },
					-- #endif
				},
				["repeatable"] = true,
				["cost"] = {
					{ "i", 19933, 10 },	-- Glowing Scorpid Blood
				},
				["lvl"] = 40,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7942, {	-- More Thorium Widgets [Tier 5] (Not Really)
				["qg"] = 14841,  -- Rinling
				["sourceQuest"] = 7898,	-- Thorium Widget
				["coords"] = {
					{ 41.7, 70.7, ELWYNN_FOREST },
					{ 37.1, 37.2, MULGORE },
					-- #if AFTER TBC
					{ 34.0, 34.8, TEROKKAR_FOREST },
					-- #endif
				},
				["repeatable"] = true,
				["cost"] = {
					{ "i", 15994, 6 },	-- Thorium Widget
				},
				["lvl"] = 40,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7893, {	-- Rituals of Strength [Tier 5]
				["qg"] = 14832,  -- Kerri Hicks <The Strongest Woman Alive!>
				["coords"] = {
					{ 40.5, 69.9, ELWYNN_FOREST },
					{ 37.8, 39.8, MULGORE },
					-- #if AFTER TBC
					{ 34.8, 35.1, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_FIVE_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 12644, 8 },	-- Dense Grinding Stone
				},
				["lvl"] = 40,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7899, {	-- Small Furry Paws [Tier 1]
				["qg"] = 14829,  -- Yebb Neblegear
				["coords"] = {
					{ 40.2, 69.7, ELWYNN_FOREST },
					{ 37.5, 39.6, MULGORE },
					-- #if AFTER TBC
					{ 34.3, 35.7, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_ONE_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 5134, 5 },	-- Small Furry Paw
				},
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7901, {	-- Soft Bushy Tails [Tier 3]
				["qg"] = 14829,  -- Yebb Neblegear
				["coords"] = {
					{ 40.2, 69.7, ELWYNN_FOREST },
					{ 37.5, 39.6, MULGORE },
					-- #if AFTER TBC
					{ 34.3, 35.7, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_THREE_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 4582, 5 },	-- Soft Bushy Tail
				},
				["lvl"] = 20,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7946, {	-- Spawn of Jubjub
				["qg"] = 14871,  -- Morja
				["coords"] = {
					{ 43.3, 70.3, ELWYNN_FOREST },
					{ 35.9, 35.3, MULGORE },
					-- #if AFTER TBC
					{ 33.7, 35.9, TEROKKAR_FOREST },
					-- #endif
				},
				["description"] = "You need to throw down a Dark Iron Ale mug near her (hence why you need 2 of them) and wait for the jubling to come hopping to it, then she'll offer this quest.",
				["cost"] = {
					{ "i", 11325, 2 },	-- Dark Iron Ale Mug
				},
				["isMonthly"] = true,
				["lvl"] = 10,
				["groups"] = {
					i(19462, {	-- Unhatched Jubling Egg
						i(19450),	-- A Jubling's Tiny Home
					}),
				},
			}),
			q(7905, {	-- The Darkmoon Faire
				["providers"] = {
					{ "n", 14842 },	-- Melnan Darkstone <Darkmoon Faire Barker>
					{ "i", 19338 },	-- Free Ticket Voucher
				},
				["coord"] = { 29.2, 68.4, IRONFORGE },
				["races"] = ALLIANCE_ONLY,
				["lvl"] = 6,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7926, {	-- The Darkmoon Faire
				["qg"] = 14843,	-- Kruban Darkblade
				["coord"] = { 52.2, 66, ORGRIMMAR },
				["races"] = HORDE_ONLY,
				["cost"] = {
					{ "i", 19338, 1 },	-- Free Ticket Voucher
				},
				["lvl"] = 6,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7883, {	-- The World's Largest Gnome! [Tier 3]
				["qg"] = 14833,  -- Chronos <He Who Never Forgets!>
				["coords"] = {
					{ 43.5, 71.1, ELWYNN_FOREST },
					{ 36.2, 35.2, MULGORE },
					-- #if AFTER TBC
					{ 33.8, 36.0, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_THREE_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 5739, 3 },	-- Barbaric Harness
				},
				["lvl"] = 20,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7898, {	-- Thorium Widgets [Tier 5]
				["qg"] = 14841,  -- Rinling
				["coords"] = {
					{ 41.7, 70.7, ELWYNN_FOREST },
					{ 37.1, 37.2, MULGORE },
					-- #if AFTER TBC
					{ 34.0, 34.8, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_FIVE_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 15994, 6 },	-- Thorium Widget
				},
				["lvl"] = 40,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7900, {	-- Torn Bear Pelts [Tier 2]
				["qg"] = 14829,  -- Yebb Neblegear
				["coords"] = {
					{ 40.2, 69.7, ELWYNN_FOREST },
					{ 37.5, 39.6, MULGORE },
					-- #if AFTER TBC
					{ 34.3, 35.7, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_TWO_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 11407, 5 },	-- Torn Bear Pelt
				},
				["lvl"] = 10,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7902, {	-- Vibrant Plumes [Tier 4]
				["qg"] = 14829,  -- Yebb Neblegear
				["coords"] = {
					{ 40.2, 69.7, ELWYNN_FOREST },
					{ 37.5, 39.6, MULGORE },
					-- #if AFTER TBC
					{ 34.3, 35.7, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_FOUR_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 5117, 5 },	-- Vibrant Plume
				},
				["lvl"] = 30,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7895, {	-- Whirring Bronze Gizmo [Tier 2]
				["qg"] = 14829,  -- Yebb Neblegear
				["coords"] = {
					{ 40.2, 69.7, ELWYNN_FOREST },
					{ 37.5, 39.6, MULGORE },
					-- #if AFTER TBC
					{ 34.3, 35.7, TEROKKAR_FOREST },
					-- #endif
				},
				["maxReputation"] = TIER_TWO_MAX_REPUTATION,
				["repeatable"] = true,
				["cost"] = {
					{ "i", 4375, 7 },	-- Whirring Bronze Gizmo
				},
				["lvl"] = 10,
				["groups"] = {
					i(19182),	-- Darkmoon Faire Prize Ticket
				},
			}),
			q(7938, {	-- Your Fortune Awaits You... [Deadmines]
				["provider"] = { "i", 19424 },	-- Sayge's Fortune #24
				["maps"] = { DEADMINES },
				["cr"] = 14822,	-- Sayge
				["repeatable"] = true,
				["lvl"] = 10,
				["groups"] = {
					i(19425),	-- Mysterious Lockbox
				},
			}),
			q(7937, {	-- Your Fortune Awaits You... [Elwynn Forest]
				["provider"] = { "i", 19423 },	-- Sayge's Fortune #23
				["coord"] = { 84.7, 64.4, ELWYNN_FOREST },
				["cr"] = 14822,	-- Sayge
				["repeatable"] = true,
				["lvl"] = 10,
				["groups"] = {
					i(19425),	-- Mysterious Lockbox
				},
			}),
			q(7945, {	-- Your Fortune Awaits You... [Mulgore]
				["provider"] = { "i", 19452 },	-- Sayge's Fortune #27
				["coord"] = { 35, 61.5, MULGORE },
				["cr"] = 14822,	-- Sayge
				["repeatable"] = true,
				["lvl"] = 10,
				["groups"] = {
					i(19425),	-- Mysterious Lockbox
				},
			}),
			q(7944, {	-- Your Fortune Awaits You... [Wailing Caverns]
				["provider"] = { "i", 19443 },	-- Sayge's Fortune #25
				["maps"] = { WAILING_CAVERNS },
				["cr"] = 14822,	-- Sayge
				["repeatable"] = true,
				["lvl"] = 10,
				["groups"] = {
					i(19425),	-- Mysterious Lockbox
				},
			}),
		}),
		n(QUESTS, {	-- TODO: Finish timelining this section.
			i(71083, {	-- Darkmoon Game Token
				i(93724, {	-- Darkmoon Game Prize
					i(78340),	-- Cloak of the Darkmoon Faire
					i(73762),	-- Darkmoon Balloon (PET!)
					i(74981),	-- Darkmoon Cub (PET!)
					i(91003),	-- Darkmoon Hatchling (PET!)
					i(73764),	-- Darkmoon Monkey (PET!)
					i(73903),	-- Darkmoon Tonk (PET!)
					i(73765),	-- Darkmoon Turtle (PET!)
					i(90899),	-- Darkmoon Whistle (TOY!)
					i(73905),	-- Darkmoon Zeppelin (PET!)
				}),
			}),
			q(7930, {	-- 5 Tickets - Darkmoon Flower
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14828 },	-- Gelvas Grimegate
				["coord"] = { 48.0, 64.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19295),	-- Darkmoon Flower
				},
			}),
			q(7931, {	-- 5 Tickets - Minor Darkmoon Prize
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14828 },	-- Gelvas Grimegate
				["coord"] = { 48.0, 64.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19298),	-- Minor Darkmoon Prize
				},
			}),
			q(7935, {	-- 10 Tickets - Last Month's Mutton
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14828 },	-- Gelvas Grimegate
				["coord"] = { 48.0, 64.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19292),	-- Last Month's Mutton
				},
			}),
			q(7932, {	-- 12 Tickets - Lesser Darkmoon Prize
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14828 },	-- Gelvas Grimegate
				["coord"] = { 48.0, 64.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19297),	-- Lesser Darkmoon Prize
				},
			}),
			q(7933, {	-- 40 Tickets - Greater Darkmoon Prize
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14828 },	-- Gelvas Grimegate
				["coord"] = { 48.0, 64.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19296),	-- Greater Darkmoon Prize
				},
			}),
			q(9249, {	-- 40 Tickets - Schematic: Steam Tonk Controller
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14828 },	-- Gelvas Grimegate
				["coord"] = { 48.0, 64.8, DARKMOON_ISLAND },
				["groups"] = {
					i(22729),	-- Schematic: Steam Tonk Controller
				},
			}),
			q(7934, {	-- 50 Tickets - Darkmoon Storage Box
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14828 },	-- Gelvas Grimegate
				["coord"] = { 48.0, 64.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19291),	-- Darkmoon Storage Box
				},
			}),
			q(7936, {	-- 50 Tickets - Last Year's Mutton
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14828 },	-- Gelvas Grimegate
				["coord"] = { 48.0, 64.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19293),	-- Last Year's Mutton
				},
			}),
			q(7981, {	-- 1200 Tickets - Amulet of the Darkmoon
				["provider"] = { "n", 14828 },	-- Gelvas Grimegate <Souvenir & Toy Prizes>
				["u"] = REMOVED_FROM_GAME,
				["groups"] = {
					un(REMOVED_FROM_GAME, i(19491)),	-- Amulet of the Darkmoon
				},
			}),
			q(7940, {	-- 1200 Tickets - Orb of the Darkmoon
				["u"] = REMOVED_FROM_GAME,
				["provider"] = { "n", 14828 },	-- Gelvas Grimegate <Souvenir & Toy Prizes>
				["groups"] = {
					un(REMOVED_FROM_GAME, i(19426)),	-- Orb of the Darkmoon
				},
			}),
			q(29456, {	-- A Captured Banner
				["isMonthly"] = true,
				["provider"] = { "i", 71951 },	-- Banner of the Fallen
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["lvl"] = 10,
				["groups"] = {
					DARKMOON_PRIZE_TICKET,
				},
			}),
			q(29447, {	-- A Curious Crystal
				["u"] = REMOVED_FROM_GAME,
			}),
			q(29443, {	-- A Curious Crystal
				["isMonthly"] = true,
				["provider"] = { "i", 71635 },	-- Imbued Crystal
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["lvl"] = 10,
				["groups"] = {
					DARKMOON_PRIZE_TICKET,
				},
			}),
			q(29506, {	-- A Fizzy Fusion
				["requireSkill"] = ALCHEMY,
				["isMonthly"] = true,
				["provider"] = { "n", 14844 },	-- Sylvannia
				["coord"] = { 50.5, 69.5, DARKMOON_ISLAND },
				["cost"] = {
					{ "i", 19299, 5 },	-- x5 Fizzy Faire Drink
					{ "i", 1645, 5 },	-- x5 Moonberry Juice
				},
			}),
			q(29478, {	-- A Fizzy Fusion
				["requireSkill"] = ALCHEMY,
				["u"] = REMOVED_FROM_GAME,
			}),
			petbattle(q(36471, {	-- A New Darkmoon Challenger!
				["qg"] = 85519,	-- Christoph VonFeasel
				["coord"] = { 47.4, 62.2, DARKMOON_ISLAND },
				["isDaily"] = true,
				["groups"] = {
					i(116062, {	-- Greater Darkmoon Pet Supplies
						["sym"] = {{"select","itemID",
							89139,	-- Chain Pet Leash
							44820,	-- Red Ribbon Pet Leash
							37460,	-- Rope Pet Leash
						}},
						["groups"] = {
							DARKMOON_PRIZE_TICKET,
							i(116064, {	-- Syd the Squid (PET!)
								["timeline"] = { "added 6.0.1.18566" },
							}),
						},
					}),
				},
			})),
			q(29444, {	-- An Exotic Egg
				["isMonthly"] = true,
				["provider"] = { "i", 71636 },	-- Monstrous Egg
				["coord"] = { 51.1, 82.0, DARKMOON_ISLAND },
				["lvl"] = 10,
				["groups"] = {
					DARKMOON_PRIZE_TICKET,
				},
			}),
			q(29449, {	-- An Intriguing Grimoire
				["u"] = REMOVED_FROM_GAME,
			}),
			q(29445, {	-- An Intriguing Grimoire
				["isMonthly"] = true,
				["provider"] = { "i", 71637 },	-- Mysterious Grimoire
				["coord"] = { 53.2, 75.8, DARKMOON_ISLAND },
				["lvl"] = 10,
				["groups"] = {
					DARKMOON_PRIZE_TICKET,
				},
			}),
			q(29450, {	-- A Wondrous Weapon
				["u"] = REMOVED_FROM_GAME,
			}),
			q(29446, {	-- A Wondrous Weapon
				["isMonthly"] = true,
				["provider"] = { "i", 71638 },	-- Ornate Weapon
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["lvl"] = 10,
				["groups"] = {
					DARKMOON_PRIZE_TICKET,
				},
			}),
			q(7885, {	-- Armor Kits
				["requireSkill"] = LEATHERWORKING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14833 },	-- Chronos
				["coord"] = { 55.0, 71.6, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(29508, {	-- Baby Needs Two Pair of Shoes
				["requireSkill"] = BLACKSMITHING,
				["isMonthly"] = true,
				["provider"] = { "n", 14829 },	-- Yebb Neblegear
				["coord"] = { 51.1, 82.0, DARKMOON_ISLAND },
			}),
			q(29520, {	-- Banners, Banners Everywhere!
				["requireSkill"] = TAILORING,
				["isMonthly"] = true,
				["provider"] = { "n", 10445 },	-- Selina Dourman
				["coord"] = { 55.56, 55.03, DARKMOON_ISLAND },
				["cost"] = {
					{ "i", 2320, 1 },	-- Coarse Thread
					{ "i", 2604, 1 },	-- Red Dye
					{ "i", 6260, 1 },	-- Blue Dye
				},
			}),
			q(29480, {	-- Banners, Banners Everywhere!
				["u"] = REMOVED_FROM_GAME,
			}),
			q(7892, {	-- Big Black Mace
				["requireSkill"] = BLACKSMITHING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14832 },	-- Kerri Hicks
				["coord"] = { 48.2, 67.6, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(7881, {	-- Carnival Boots
				["requireSkill"] = LEATHERWORKING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14833 },	-- Chronos
				["coord"] = { 55.0, 71.6, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(7882, {	-- Carnival Jerkins
				["requireSkill"] = LEATHERWORKING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14833 },	-- Chronos
				["coord"] = { 55.0, 71.6, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(7889, {	-- Coarse Weightstone
				["requireSkill"] = BLACKSMITHING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14832 },	-- Kerri Hicks
				["coord"] = { 48.2, 67.6, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(7894, {	-- Copper Modulator
				["requireSkill"] = ENGINEERING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14841 },	-- Rinling
				["coord"] = { 49.6, 60.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(7884, {	-- Crocolisk Boy and the Bearded Murloc
				["requireSkill"] = LEATHERWORKING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14833 },	-- Chronos
				["coord"] = { 55.0, 71.6, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(64783, {	-- Dance Dance Darkmoon
				["provider"] = { "n", 181097 },	-- Simon Sezdans <Dance Master>
				--["coord"]
				["timeline"] = { "added 9.2.0" },
				["repeatable"] = true,
			}),
			applyclassicphase(PHASE_THREE, q(7907, {	-- Darkmoon Beast Deck
				["providers"] = {
					{ "i", 19228 },	-- Beasts Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 60,
				["groups"] = {
					i(19288),	-- Darkmoon Card: Blue Dragon
				},
			})),
			applyclassicphase(TBC_PHASE_THREE, q(10938, {	-- Darkmoon Blessings Deck
				["providers"] = {
					{ "i", 31890 },	-- Blessings Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 70,
				["groups"] = {
					i(31856),	-- Darkmoon Card: Crusade
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, q(13325, {	-- Darkmoon Chaos Deck
				["providers"] = {
					{ "i", 44276 },	-- Chaos Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 80,
				["groups"] = {
					i(42989),	-- Darkmoon Card: Berserker!
				},
			})),
			q(30449, {	-- Darkmoon Crane Deck
				["providers"] = {
					{ "i", 79325 },	-- Crane Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 90,
				["groups"] = {
					i(79330),	-- Relic of Chi-Ji
				},
			}),
			q(27667, {	-- Darkmoon Earthquake Deck
				["providers"] = {
					{ "i", 62046 },	-- Earthquake Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 85,
				["groups"] = {
					i(62048),	-- Darkmoon Card: Earthquake
				},
			}),
			applyclassicphase(PHASE_THREE, q(7929, {	-- Darkmoon Elementals Deck
				["providers"] = {
					{ "i", 19267 },	-- Elementals Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 60,
				["groups"] = {
					i(19289),	-- Darkmoon Card: Maelstrom
				},
			})),
			applyclassicphase(TBC_PHASE_THREE, q(10940, {	-- Darkmoon Furies Deck
				["providers"] = {
					{ "i", 31907 },	-- Furies Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 70,
				["groups"] = {
					i(31858),	-- Darkmoon Card: Vengeance
				},
			})),
			q(27665, {	-- Darkmoon Hurricane Deck
				["providers"] = {
					{ "i", 62045 },	-- Hurricane Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 85,
				["groups"] = {
					i(62051),	-- Darkmoon Card: Hurricane
					i(62049),	-- Darkmoon Card: Hurricane
				},
			}),
			applyclassicphase(TBC_PHASE_THREE, q(10941, {	-- Darkmoon Lunacy Deck
				["providers"] = {
					{ "i", 31914 },	-- Lunacy Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 70,
				["groups"] = {
					i(31859),	-- Darkmoon Card: Madness
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, q(13326, {	-- Darkmoon Nobles Deck
				["providers"] = {
					{ "i", 44326 },	-- Nobles Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 80,
				["groups"] = {
					i(44253),	-- Darkmoon Card: Greatness
					i(44255),	-- Darkmoon Card: Greatness
					i(42987),	-- Darkmoon Card: Greatness
					i(44254),	-- Darkmoon Card: Greatness
				},
			})),
			q(30450, {	-- Darkmoon Ox Deck
				["providers"] = {
					{ "i", 79324 },	-- Ox Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 90,
				["groups"] = {
					i(79329),	-- Relic of Niuzao
				},
			}),
			petbattle(q(32175, {	-- Darkmoon Pet Battle!
				["qg"] = 67370,	-- Jeremy Feasel
				["coord"] = { 47.8, 62.6, DARKMOON_ISLAND },
				["isDaily"] = true,
				["groups"] = {
					i(91086, {	-- Darkmoon Pet Supplies
						["sym"] = {{"select","itemID",
							89139,	-- Chain Pet Leash
							44820,	-- Red Ribbon Pet Leash
							37460,	-- Rope Pet Leash
						}},
						["groups"] = {
							DARKMOON_PRIZE_TICKET,
							i(91040),	-- Darkmoon Eye (PET!)
						},
					}),
				},
			})),
			applyclassicphase(PHASE_THREE, q(7927, {	-- Darkmoon Portals Deck
				["providers"] = {
					{ "i", 19277 },	-- Portals Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 60,
				["groups"] = {
					i(19290),	-- Darkmoon Card: Twisting Nether
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, q(13324, {	-- Darkmoon Prisms Deck
				["providers"] = {
					{ "i", 44259 },	-- Prisms Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 80,
				["groups"] = {
					i(42988),	-- Darkmoon Card: Illusion
				},
			})),
			q(30451, {	-- Darkmoon Serpent Deck
				["providers"] = {
					{ "i", 79326 },	-- Serpent Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 90,
				["groups"] = {
					i(79331),	-- Relic of Yu'lon
				},
			}),
			applyclassicphase(TBC_PHASE_THREE, q(10939, {	-- Darkmoon Storms Deck
				["providers"] = {
					{ "i", 31891 },	-- Storms Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 70,
				["groups"] = {
					i(31857),	-- Darkmoon Card: Wrath
				},
			})),
			q(30452, {	-- Darkmoon Tiger Deck
				["providers"] = {
					{ "i", 79323 },	-- Tiger Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 90,
				["groups"] = {
					i(79328),	-- Relic of Xuen (Agility)
					i(79327),	-- Relic of Xuen (Strength)
				},
			}),
			q(27666, {	-- Darkmoon Tsunami Deck
				["providers"] = {
					{ "i", 62044 },	-- Tsunami Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 85,
				["groups"] = {
					i(62050),	-- Darkmoon Card: Tsunami
				},
			}),
			applyclassicphase(WRATH_PHASE_ONE, q(13327, {	-- Darkmoon Undeath Deck
				["providers"] = {
					{ "i", 44294 },	-- Undeath Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 80,
				["groups"] = {
					i(42990),	-- Darkmoon Card: Death
				},
			})),
			q(27664, {	-- Darkmoon Volcanic Deck
				["providers"] = {
					{ "i", 62021 },	-- Volcanic Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 85,
				["groups"] = {
					i(62047),	-- Darkmoon Card: Volcano
				},
			}),
			applyclassicphase(PHASE_THREE, q(7928, {	-- Darkmoon Warlords Deck
				["providers"] = {
					{ "i", 19257 },	-- Warlords Deck
					{ "n", 14847 },	-- Professor Thaddeus
				},
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["repeatable"] = true,
				["lvl"] = 60,
				["groups"] = {
					i(19287),	-- Darkmoon Card: Heroism
				},
			})),
			q(13311, {	-- Demons Deck
				["provider"] = { "i", 44158 },	-- Demons Deck
				["repeatable"] = true,
				["groups"] = {
					i(44217),	-- Darkmoon Dirk
					i(44218),	-- Darkmoon Executioner
					i(44219),	-- Darkmoon Magestaff
				},
			}),
			q(33354, {	-- Den Mother's Demise
				["creatureID"] = 71992,	-- Moonfang
				["isMonthly"] = true,
				["provider"] = { "i", 105891 },	-- Moonfang's Pelt
				["coord"] = { 39.3, 43.6, DARKMOON_ISLAND },
				["groups"] = {
					DARKMOON_PRIZE_TICKET,
				},
			}),
			q(7903, {	-- Evil Bat Eyes
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14829 },	-- Yebb Neblegear
				["coord"] = { 51.6, 81.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(29517, {	-- Eyes on the Prizes
				["requireSkill"] = LEATHERWORKING,
				["isMonthly"] = true,
				["provider"] = { "n", 14841 },	-- Rinling
				["coord"] = { 49.2, 60.7, DARKMOON_ISLAND },
				["cost"] = {
					{ "i", 6529, 10 },	-- Shiny Bauble
					{ "i", 2320, 5 },	-- Coarse Thread
					{ "i", 6260, 5 },	-- Blue Dye
				},
			}),
			q(29472, {	-- Eyes on the Prizes
				["requireSkill"] = TAILORING,
				["u"] = REMOVED_FROM_GAME,
			}),
			q(36481, {	-- Firebird's Challenge
				["provider"] = { "n", 85546 },	-- Ziggie Sparks
				["isMonthly"] = true,
				["coord"] = { 48.3, 71.3, DARKMOON_ISLAND },
				["groups"] = {
					ach(9250),	-- Flying High
					ach(9251),	-- Ringmaster
					ach(9252, {	-- Brood of Alysrazor
						i(116115),	-- Blazing Wings (TOY!)
					}),
					i(93724),	-- Darkmoon Game Prize
				},
			}),
			q(29485, {	-- Fun for the Little Ones
				["u"] = REMOVED_FROM_GAME,
			}),
			q(29507, {	-- Fun for the Little Ones
				["requireSkill"] = ARCHAEOLOGY,
				["isMonthly"] = true,
				["provider"] = { "n", 14847 },	-- Professor Thaddeus
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["cost"] = { { "c", 393, 15 } },	-- x15 Fossil Archaeology Fragments
			}),
			q(8222, {	-- Glowing Scorpid Blood
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14829 },	-- Yebb Neblegear
				["coord"] = { 51.6, 81.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(7896, {	-- Green Fireworks
				["requireSkill"] = ENGINEERING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14841 },	-- Rinling
				["coord"] = { 49.6, 60.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(7891, {	-- Green Iron Bracers
				["requireSkill"] = BLACKSMITHING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14832 },	-- Kerri Hicks
				["coord"] = { 48.2, 67.6, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(7890, {	-- Heavy Grinding Stone
				["requireSkill"] = BLACKSMITHING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14832 },	-- Kerri Hicks
				["coord"] = { 48.2, 67.6, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(29479, {	-- Herbs for Healing
				["u"] = REMOVED_FROM_GAME,
			}),
			q(29514, {	-- Herbs for Healing
				["requireSkill"] = HERBALISM,
				["isMonthly"] = true,
				["provider"] = { "n", 14833 },	-- Chronos
				["coord"] = { 54.9, 70.7, DARKMOON_ISLAND },
			}),
			q(29438, {	-- He Shoots, He Scores!
				["isDaily"] = true,
				["provider"] = { "n", 14841 },	-- Rinling
				["coord"] = { 49.2, 60.7, DARKMOON_ISLAND },
				["groups"] = {
					ach(6022),	-- Quick Shot
					i(93724),	-- Darkmoon Game Prize
				},
			}),
			q(35504, {	-- Iron Joker
				["repeatable"] = true,
				["provider"] = { "i", 113135 },
			}),
			q(29463, {	-- It's Hammer Time
				["provider"] = { "n", 54601 },	-- Mola
				["isDaily"] = true,
				["coord"] = { 53.2, 54.3, DARKMOON_ISLAND },
				["groups"] = {
					ach(9983, {	-- That's Whack!
						i(123862),	-- Hogs (PET!)
					}),
					i(93724),	-- Darkmoon Game Prize
				},
			}),
			q(29516, {	-- Keeping the Faire Sparkling
				["requireSkill"] = JEWELCRAFTING,
				["isMonthly"] = true,
				["provider"] = { "n", 14833 },	-- Chronos
				["coord"] = { 54.9, 70.7, DARKMOON_ISLAND },
			}),
			q(29483, {	-- Keeping the Faire Sparkling
				["requireSkill"] = JEWELCRAFTING,
				["u"] = REMOVED_FROM_GAME,
			}),
			q(33756, {	-- Let's Keep Racing
				["sourceQuests"] = { 37910 },	-- Welcome to the Darkmoon Races
				["provider"] = { "n", 74056 },	-- Malle Earnhard
				["isDaily"] = true,
				["coord"] = { 48.9, 88.3, DARKMOON_ISLAND },
			}),
			q(12518, {	-- Mages Deck
				["provider"] = { "i", 44148 },	-- Mages Deck
				["repeatable"] = true,
				["groups"] = {
					i(44215),	-- Darkmoon Necklace
					i(44213),	-- Darkmoon Pendant
				},
			}),
			pvp(q(29761, {	-- Master Pit Fighter
				["qg"] = 55402,	-- Korgol Crushskull
				["sourceQuest"] = 29760,	-- Pit Fighter
				["coord"] = { 47.3, 78.9, DARKMOON_ISLAND },
				["cost"] = { { "i", 74034, 12 } },	-- Pit Fighter
				["groups"] = {
					ach(6024),	-- Darkmoon Dominator
					i(74035),	-- Master Pit Fighter
				},
			})),
			q(7897, {	-- Mechanical Repair Kits
				["requireSkill"] = ENGINEERING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14841 },	-- Rinling
				["coord"] = { 49.6, 60.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(7941, {	-- More Armor Kits
				["u"] = REMOVED_FROM_GAME,
			}),
			q(7943, {	-- More Bat Eyes
				["u"] = REMOVED_FROM_GAME,
			}),
			q(7939, {	-- More Dense Grinding Stones
				["u"] = REMOVED_FROM_GAME,
			}),
			q(8223, {	-- More Glowing Scorpid Blood
				["u"] = REMOVED_FROM_GAME,
			}),
			q(7942, {	-- More Thorium Widgets
				["u"] = REMOVED_FROM_GAME,
			}),
			q(37868, {	-- More Big Racing!
				["sourceQuests"] = { 37911 },	-- The Real Big Race
				["provider"] = { "n", 90473 },	-- Patti Earnhard
				["isDaily"] = true,
				["coord"] = { 53.2, 87.6, DARKMOON_ISLAND },
			}),
			pvp(q(29760, {	-- Pit Fighter
				["providers"] = {
					{ "i", 74034 },	-- Pit Fighter
					{ "n", 55402 },	-- Korgol Crushskull
				},
				["coord"] = { 47.3, 78.9, DARKMOON_ISLAND },
				["groups"] = {
					ach(6023),	-- Darkmoon Duelist
				},
			})),
			q(29466, {	-- Plenty of Plump Frogs
				["u"] = REMOVED_FROM_GAME,
			}),
			q(29512, {	-- Putting the Carnies Back Together Again
				["requireSkill"] = FIRST_AID,
				["isMonthly"] = true,
				["provider"] = { "n", 14833 },	-- Chronos
				["coord"] = { 54.9, 70.7, DARKMOON_ISLAND },
				["u"] = REMOVED_FROM_GAME,	-- First Aid removed in 8.0.1 BfA Prepatch
			}),
			q(29509, {	-- Putting the Crunch in the Frog
				["requireSkill"] = COOKING,
				["isMonthly"] = true,
				["provider"] = { "n", 14845 },	-- Stamp Thunderhorn
				["coord"] = { 52.8, 67.9, DARKMOON_ISLAND },
				["cost"] = { { "i", 30817, 5 } },	-- x5 Simple Flour
			}),
			q(29484, {	-- Putting the Crunch in the Frog
				["u"] = REMOVED_FROM_GAME,
			}),
			q(29474, {	-- Putting Trash to Good Use
				["requireSkill"] = ENCHANTING,
				["u"] = REMOVED_FROM_GAME,
			}),
			q(29510, {	-- Putting Trash to Good Use
				["requireSkill"] = ENCHANTING,
				["isMonthly"] = true,
				["provider"] = { "n", 14822 },	-- Sayge
				["coord"] = { 53.2, 75.8, DARKMOON_ISLAND },
			}),
			q(29469, {	-- Rearm, Reuse, Recycle
				["u"] = REMOVED_FROM_GAME,
			}),
			q(29518, {	-- Rearm, Reuse, Recycle
				["requireSkill"] = MINING,
				["isMonthly"] = true,
				["provider"] = { "n", 14841 },	-- Rinling
				["coord"] = { 49.2, 60.7, DARKMOON_ISLAND },
			}),
			q(36477, {	-- Ring of Promises
				["provider"] = { "i", 116068 },	-- Erinys
				["coord"] = { 74.8, 33.4, DARKMOON_ISLAND },	-- Entrance
				["groups"] = {
					i(116067),	-- Ring of Broken Promises (TOY!)
				},
			}),
			q(7893, {	-- Rituals of Strength
				["requireSkill"] = BLACKSMITHING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14832 },	-- Kerri Hicks
				["coord"] = { 48.2, 67.6, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(12517, {	-- Rogues Deck
				["repeatable"] = true,
				["provider"] = { "i", 37163 },	-- Rogues Deck
				["groups"] = {
					i(39507),	-- Darkmoon Breastplate
					i(131276),	-- Darkmoon Chainmail
					i(38318),	-- Darkmoon Robe
					i(39509),	-- Darkmoon Vest
				},
			}),
			q(38934, {	-- Sila's Secret Stash
				["providers"] = {
					{ "i", 126930 },	-- Faded Treasure Map
					{ "n", 55103 },		-- Galissa Sundew
				},
				["coord"] = { 52.5, 88.7, DARKMOON_ISLAND },
				["groups"] = {
					i(127148, {	-- Sila's Secret Stash
						["description"] = "This item contains 100 Darkmoon Faire Tickets.",
					}),
				},
			}),
			q(7899, {	-- Small Furry Paws
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14829 },	-- Yebb Neblegear
				["coord"] = { 51.6, 81.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(7901, {	-- Soft Bushy Tails
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14829 },	-- Yebb Neblegear
				["coord"] = { 51.6, 81.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(7946, {	-- Spawn of Jubjub
				["provider"] = { "n", 14871 },	-- Morja
				["coord"] = { 55.9, 70.7, DARKMOON_ISLAND },
				["groups"] = {
					i(19462, {		--	Unhatched Jubling Egg
						i(19450, {	-- Jubling (PET!)
							["timeline"] = { "added 1.11.1.5462" },
						}),
					}),
				},
			}),
			q(29513, {	-- Spoilin' for Salty Sea Dogs
				["requireSkill"] = FISHING,
				["isMonthly"] = true,
				["provider"] = { "n", 14845 },	-- Stamp Thunderhorn
				["coord"] = { 52.8, 67.9, DARKMOON_ISLAND },
			}),
			q(12798, {	-- Swords Deck
				["repeatable"] = true,
				["provider"] = { "i", 37164 },	-- Swords Deck
				["groups"] = {
					i(39897),	-- Azure Shoulderguards
					i(39895),	-- Cloaked Shoulderpads
					i(39894),	-- Darkcloth Shoulders
					i(131277),	-- Veiled Pauldrons
				},
			}),
			q(29467, {	-- Talkin' Tonks
				["u"] = REMOVED_FROM_GAME,
			}),
			q(29511, {	-- Talking' Tonks
				["requireSkill"] = ENGINEERING,
				["isMonthly"] = true,
				["provider"] = { "n", 14841 },	-- Rinling
				["coord"] = { 49.2, 60.7, DARKMOON_ISLAND },
			}),
			q(29519, {	-- Tan My Hide
				["qg"] = 14833,	-- Chronos
				["coord"] = { 54.9, 70.7, DARKMOON_ISLAND },
				["requireSkill"] = SKINNING,
				["isMonthly"] = true,
			}),
			q(29470, {	-- Tan My Hide
				["requireSkill"] = SKINNING,
				["u"] = REMOVED_FROM_GAME,
			}),
			q(29455, {	-- Target: Turtle
				["qg"] = 54485,	-- Jessica Rogers
				["coord"] = { 51.5, 77.1, DARKMOON_ISLAND },
				["isDaily"] = true,
				["groups"] = {
					ach(9894, {	-- Triumphant Turtle Tossing
						i(122123),	-- Darkmoon Ring-Flinger (TOY!)
					}),
					i(93724),	-- Darkmoon Game Prize
				},
			}),
			q(29433, {	-- Test Your Strength
				["qg"] = 14832,	-- Kerri Hicks
				["coord"] = { 47.9, 67.1, DARKMOON_ISLAND },
				["isMonthly"] = true,
				["groups"] = {
					DARKMOON_PRIZE_TICKET,
				},
			}),
			q(29458, {	-- The Captured Journal
				["provider"] = { "i", 71953 },	-- Fallen Adventurer's Journal
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["isMonthly"] = true,
				["lvl"] = 10,
				["groups"] = {
					DARKMOON_PRIZE_TICKET,
				},
			}),
			q(7905, {	-- The Darkmoon Faire [A]
				["qg"] = 54334,	-- Darkmoon Faire Mystic Mage
				["coord"] = { 62.2, 73.0, STORMWIND_CITY },
				["races"] = ALLIANCE_ONLY,
				["groups"] = {
					DARKMOON_PRIZE_TICKET,
					i(71634, {	-- Darkmoon Adventurer's Guide
						["timeline"] = { "added 4.3.0.14899" },
					}),
				},
			}),
			q(7926, {	-- The Darkmoon Faire [H]
				["qg"] = 55382,	-- Darkmoon Faire Mystic Mage
				["coord"] = { 48.0, 62.0, ORGRIMMAR },
				["races"] = HORDE_ONLY,
				["groups"] = {
					DARKMOON_PRIZE_TICKET,
					i(71634, {	-- Darkmoon Adventurer's Guide
						["timeline"] = { "added 4.3.0.14899" },
					}),
				},
			}),
			q(29457, {	-- The Enemy's Insignia
				["provider"] = { "i", 71952 },	-- Captured Insignia
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["isMonthly"] = true,
				["lvl"] = 10,
				["groups"] = {
					DARKMOON_PRIZE_TICKET,
				},
			}),
			q(29436, {	-- The Humanoid Cannonball
				["qg"] = 15303,	-- Maxima Blastenheimer
				["coord"] = { 52.4, 56.1, DARKMOON_ISLAND },
				["isDaily"] = true,
				["groups"] = {
					ach(6021),	-- Blastenheimer Bullseye
					i(93724),	-- Darkmoon Game Prize
				},
			}),
			q(29454, {	-- The Master Strategist
				["provider"] = { "i", 71715 },	-- A Treatise on Strategy
				["isMonthly"] = true,
				["u"] = REMOVED_FROM_GAME,
			}),
			q(29451, {	-- The Master Strategist
				["qg"] = 71715,	-- A Treatise on Strategy
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["isMonthly"] = true,
				["lvl"] = 10,
				["groups"] = {
					DARKMOON_PRIZE_TICKET,
				},
			}),
			q(37911, {	-- The Real Big Race
				["qg"] = 90473,	-- Patti Earnhard
				["sourceQuest"] = 37819,	-- Welcome to the Darkmoon Races
				["coord"] = { 53.2, 87.6, DARKMOON_ISLAND },
				["isDaily"] = true,
				["groups"] = {
					ach(9817, {	-- Big Powermonger: Gold
						["crs"] = { 89732 },	-- Powermonger
						["groups"] = {
							i(122124),	-- Darkmoon Cannon
							ach(9815),	-- Big Powermonger: Gold
							ach(9813),	-- Big Powermonger: Gold
							ach(9812),	-- Big Powermonger: Gold
						},
					}),
					ach(9799, {	-- Big Race Roadhog
						["crs"] = { 90148 },	-- Racing Strider
						["groups"] = {
							i(122128),	-- Checkered Flag
							ach(9797),	-- Big Race Leadfoot
							ach(9795),	-- Big Race Jockey
							ach(9794),	-- Big Race Novice
							ach(9793),	-- Big Race Enthusiast
						},
					}),
					ach(9805, {	-- Big Rocketeer: Gold
						["crs"] = { 89734 },	-- Rocketeer
						["groups"] = {
							i(122125),	-- Race MiniZep (PET!)
							ach(9803),	-- Big Rocketeer: Gold
							ach(9801),	-- Big Rocketeer: Gold
							ach(9800),	-- Rocket Man
						},
					}),
					ach(9811, {	-- Big Wanderluster: Gold
						["crs"] = { 89736 },	-- Wanderluster
						["groups"] = {
							i(122121),	-- Darkmoon Gazer (TOY!)
							ach(9809),	-- Big Wanderluster: Gold [Real Big Race -- R25]
							ach(9807),	-- Big Wanderluster: Gold [Real Big Race -- R40]
							ach(9806),	-- Big Wanderluster: Gold [Real Big Race -- R30]
							ach(9819),	-- Darkmoon Like the Wind
						},
					}),
					i(93724),	-- Darkmoon Game Prize
				},
			}),
			q(37910, {	-- The Real Race
				["sourceQuests"] = { 37819 },	-- Welcome to the Darkmoon Races
				["provider"] = { "n", 74056 },	-- Malle Earnhard
				["isDaily"] = true,
				["coord"] = { 48.9, 88.3, DARKMOON_ISLAND },
				["groups"] = {
					ach(9761, {	-- Darkmoon Racer Roadhog
						["crs"] = { 90148 },	-- Racing Strider
						["groups"] = {
							i(122129),	-- Fire-Eater Vial (TOY!)
							ach(9760),	-- Darkmoon Racer Leadfoot
							ach(9759),	-- Darkmoon Racer Jockey
							ach(9756),	-- Darkmoon Racer Novice
						},
					}),
					ach(9785, {	-- Powermonger: Gold
						["crs"] = { 89732 },	-- Powermonger
						["groups"] = {
							i(122120),	-- Gaze of the Darkmoon (TOY!)
							ach(9783),	-- Powermonger: Silver
							ach(9781),	-- Powermonger: Bronze
							ach(9780),	-- Go-Getter
						},
					}),
					ach(9764, {	-- Rocketeer: Gold
						["crs"] = { 89734 },	-- Rocketeer
						["groups"] = {
							i(122119),	-- Everlasting Darkmoon Firework (TOY!)
							ach(9766),	-- Rocketeer: Silver
							ach(9769),	-- Rocketeer: Bronze
							ach(9770),	-- Blast Off!
						},
					}),
					ach(9792, {	-- Wanderluster: Gold
						["crs"] = { 89736 },	-- Wanderluster
						["groups"] = {
							i(122126),	-- Attraction Sign (TOY!)
							ach(9819),	-- Darkmoon Like the Wind
							ach(9790),	-- Wanderluster: Silver
							ach(9787),	-- Wanderluster: Bronze
							ach(9786),	-- Wayfarer
						},
					}),
					i(93724),	-- Darkmoon Game Prize
				},
			}),
			q(7883, {	-- The World's Largest Gnome!
				["requireSkill"] = LEATHERWORKING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14833 },	-- Chronos
				["coord"] = { 55.0, 71.6, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(7898, {	-- Thorium Widget
				["requireSkill"] = ENGINEERING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14841 },	-- Rinling
				["coord"] = { 49.6, 60.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(29434, {	-- Tonk Commander
				["provider"] = { "n", 54605 },	-- Finaly Coolshot
				["isDaily"] = true,
				["coord"] = { 50.7, 65.1, DARKMOON_ISLAND },
				["groups"] = {
					ach(9885, {	-- Ace Tonk Commander
						i(122122),	-- Darkmoon Tonk Controller (TOY!)
					}),
					i(93724),	-- Darkmoon Game Prize
				},
			}),
			q(29464, {	-- Tools of Divination
				["isMonthly"] = true,
				["provider"] = { "i", 71716 },	-- Soothsayer's Runes
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["lvl"] = 60,
				["groups"] = {
					DARKMOON_PRIZE_TICKET,
				},
			}),
			q(29465, {	-- Tools of Divination
				["u"] = REMOVED_FROM_GAME,
			}),
			q(7900, {	-- Torn Bear Pelts
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14829 },	-- Yebb Neblegear
				["coord"] = { 51.6, 81.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(7902, {	-- Vibrant Plumes
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14829 },	-- Yebb Neblegear
				["coord"] = { 51.6, 81.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(37819, {	-- Welcome to the Darkmoon Races
				["provider"] = { "n", 74056 },	-- Malle Earnhard
				["coord"] = { 48.9, 88.3, DARKMOON_ISLAND },
				["groups"] = {
					ach(9755),	-- Darkmoon Race Enthusiast
					i(93724),	-- Darkmoon Game Prize
				},
			}),
			q(7895, {	-- Whirring Bronze Gizmo
				["requireSkill"] = ENGINEERING,
				["u"] = REMOVED_FROM_GAME,
				["repeatable"] = true,
				["provider"] = { "n", 14841 },	-- Rinling
				["coord"] = { 49.6, 60.8, DARKMOON_ISLAND },
				["groups"] = {
					i(19182),	-- Tattered Darkmoon Faire Prize Ticket
				},
			}),
			q(29515, {	-- Writing the Future
				["requireSkill"] = INSCRIPTION,
				["isMonthly"] = true,
				["provider"] = { "n", 14822 },	-- Sayge
				["coord"] = { 53.2, 75.8, DARKMOON_ISLAND },
				["cost"] = { { "i", 39354, 5 } },	-- x5 Light Parchment
			}),
			q(29471, {	-- Writing the Future
				["u"] = REMOVED_FROM_GAME,
				["requireSkill"] = INSCRIPTION,
			}),
			q(7937, {	-- Your Fortune Awaits You...
				["provider"] = { "i", 19423 },	-- Sayge's Fortune #23
				["u"] = REMOVED_FROM_GAME,
			}),
			q(7944, {	-- Your Fortune Awaits You...
				["provider"] = { "i", 19443 },	-- Sayge's Fortune #25
				["u"] = REMOVED_FROM_GAME,
			}),
			q(7945, {	-- Your Fortune Awaits You...
				["provider"] = { "i", 19452 },	-- Sayge's Fortune #27
				["u"] = REMOVED_FROM_GAME,
			}),
		}),
		-- #if AFTER 4.3.0.14732
		pvp(n(PVP, {
			o(209620, {	-- Darkmoon Treasure Chest
				["coord"] = { 44.6, 78.9, DARKMOON_ISLAND },	-- Chest
				["groups"] = {
					i(74034, {	-- Pit Fighter
						["timeline"] = { "added 4.3.0.14732" },
					}),
					i(126949, {	-- Returning Champion
						["description"] = "You need to have completed the Master Pit Fighter quest to loot this from the chest.",
						["sourceQuest"] = 29761,	-- Master Pit Fighter
						["timeline"] = { "added 6.2.0.19890" },
					}),
				},
			}),
		})),
		-- #endif
		-- #if AFTER 5.0.1.15799
		n(RARES, {
			n(58336, bubbleDownSelf({ ["timeline"] = { "added 5.0.1.15799" }, }, {	-- Darkmoon Rabbit
				["coord"] = { 75.69, 78.17, DARKMOON_ISLAND },
				["timeline"] = { "added 5.0.1.15799" },
				-- #if BEFORE 6.0.1
				["isRaid"] = true,	-- This originally required a raid group. lol
				-- #endif
				["groups"] = {
					ach(6332),	-- That Rabbit's Dynamite!
					i(80008),	-- Darkmoon Rabbit (PET!)
				},
			})),
			n(122899, bubbleDownSelf({ ["timeline"] = { "added 7.2.5.24026" }, }, {	-- Death Metal Knight
				["questID"] = 47767,
				["description"] = "Death Metal Knight can be killed every hour on the half-hour, but he will only drop his rare loot once per month per character.",
				["coords"] = {
					{ 65.54, 68.29, DARKMOON_ISLAND },	-- Cave Entrance [Allows it to be shown on meta DMF map]
					{ 41.43, 42.19, 408 },	-- Fight becomes active
				},
				["isWeekly"] = true,
				["groups"] = {
					ach(11918),	-- Hey, You're a Rockstar!
					ach(11921),	-- Mosh Pit
					ach(11920, {	-- Perfect Performance
						["description"] = "Four people fighting the Death Metal Knight will need to successfully perform the roles from Taking this Show on the Road.  This achievement technically does not require a group, but it would be easier to coordinate roles with one!",
					}),
					ach(11919, {	-- Taking this Show on the Road
						crit(1, {	-- Guitarist
							["description"] = "Get hit by one banshee wave; miss one bolt of light.",
						}),
						crit(2, {	-- Bassist
							["description"] = "Do not get hit by any banshee waves; miss one bolt of light.",
						}),
						crit(3, {	-- Drummer
							["description"] = "Do not get hit by any banshee waves; catch every bolt of light.",
						}),
						crit(4, {	-- Vocals
							["description"] = "Get hit by one banshee wave; catch every bolt of light.",
						}),
					}),
					i(151265),	-- Blight Boar Microphone (TOY!)
					i(151255),	-- Necromedes, the Death Resonator
					i(151253),	-- Lightly-Padded Cage Helm
					i(151252),	-- Leather-Lined Cage Helm
					i(151254),	-- Chain-Linked Cage Helm
					i(151251),	-- Steel-Reinforced Cage Helm
					i(151397),	-- Sweaty Wristbands
				},
			})),
			n(71992, bubbleDownSelf({ ["timeline"] = { "added 5.4.0.17345" }, }, {	-- Moonfang <Darkmoon Den Mother>
				["coord"] = { 39.65, 44.07, DARKMOON_ISLAND },
				["groups"] = {
					i(101570),	-- Moon Moon (PET!)
					i(101571),	-- Moonfang Shroud (TOY!)
					i(105898),	-- Moonfang's Paw (TOY!)
					i(101675),	-- Shimmering Moonstone
				},
			})),
			n(204964, bubbleDownSelf({ ["timeline"] = { ADDED_10_1_5 } }, {	-- Twinkle <Madam Shadow's Minion>
				["questID"] = 77158,
				["sourceQuest"] = 75539,	-- Some Wicked Things This Way Come
				["description"] = "Question Madam Shadow until you get punished.\n 1) Cast Corruption.\n 2) Cast Curse of Exhaustion\n 3) Cast Agony\n 4) Oh yeah, don't forget to RUN!",
				["classes"] = { WARLOCK },
				["groups"] = {
					i(207294),	-- Grimoire of the Felfrost Imp (CI!)
				},
			})),
		}),
		-- #endif
		n(REWARDS, {
			i(19422, {	-- Darkmoon Faire Fortune
				["description"] = "This is a reward from completing the Sayge's Fortune. The answers you select to get your buff do not affect the contents of this container.\n\nSayge offers a buff if you answer his questions correctly.\n\n1:1 +10% Damage\n1:2  +25 Magical Resistance\n1:3 +10% Armor\n2:1 +10% Spirit\n2:2 +10% Int\n2:3  +25 Magical Resistance\n3:1 +10% Stamina\n3:2 +10% Strength\n3:3 +10% Agility\n4:1 +10% Int\n4:2 +10% Spirit\n4:3 +10% Armor",
				["cr"] = 14822,	-- Sayge
				-- #if AFTER 4.3.0
				["coord"] = { 53.6, 75.6, DARKMOON_ISLAND },
				-- #else
				["coords"] = {
					{ 36.8, 38.2, MULGORE },
					{ 42.0, 69.0, ELWYNN_FOREST },
					-- #if AFTER TBC
					{ 34.9, 35.0, TEROKKAR_FOREST },
					-- #endif
				},
				-- #endif
				["repeatable"] = true,
				["groups"] = {
					i(19229),	-- Sayge's Fortune #1
					i(19256),	-- Sayge's Fortune #2
					i(19238),	-- Sayge's Fortune #3
					i(19239),	-- Sayge's Fortune #4
					i(19240),	-- Sayge's Fortune #5
					i(19241),	-- Sayge's Fortune #6
					i(19242),	-- Sayge's Fortune #7
					i(19243),	-- Sayge's Fortune #8
					i(19244),	-- Sayge's Fortune #9
					i(19245),	-- Sayge's Fortune #10
					i(19246),	-- Sayge's Fortune #11
					i(19247),	-- Sayge's Fortune #12
					i(19248),	-- Sayge's Fortune #13
					i(19249),	-- Sayge's Fortune #14
					i(19250),	-- Sayge's Fortune #15
					i(19251),	-- Sayge's Fortune #16
					i(19253),	-- Sayge's Fortune #17
					i(19252),	-- Sayge's Fortune #18
					i(19237),	-- Sayge's Fortune #19
					i(19266),	-- Sayge's Fortune #20
					i(19254),	-- Sayge's Fortune #21
					i(19255),	-- Sayge's Fortune #22
					i(19423),	-- Sayge's Fortune #23
					i(19424),	-- Sayge's Fortune #24
					i(19443),	-- Sayge's Fortune #25
					i(19451),	-- Sayge's Fortune #26
					i(19452),	-- Sayge's Fortune #27
					i(19453),	-- Sayge's Fortune #28
					i(19454),	-- Sayge's Fortune #29
				},
			}),
		}),
		n(VENDORS, {
			n(55072, bubbleDownSelf({ ["timeline"] = { "added 4.3.0.14942" }, }, {	-- Barum <Replica Armor Prizes>
				["coord"] = { 47.5, 66.3, DARKMOON_ISLAND },
				["groups"] = {
					gs(1431, {	-- Battlegear of Valor
						darkmoonprizeticket(55, i(78319)),	-- Replica Belt of Valor
						darkmoonprizeticket(55, i(78318)),	-- Replica Boots of Valor
						darkmoonprizeticket(55, i(78321)),	-- Replica Bracers of Valor
						darkmoonprizeticket(75, i(78323)),	-- Replica Breastplate of Valor
						darkmoonprizeticket(55, i(78320)),	-- Replica Gauntlets of Valor
						darkmoonprizeticket(75, i(78322)),	-- Replica Helm of Valor
						darkmoonprizeticket(75, i(78324)),	-- Replica Legplates of Valor
						darkmoonprizeticket(75, i(78325)),	-- Replica Shoulders of Valor
					}),
					gs(1428, {	-- Beaststalker Armor
						darkmoonprizeticket(55, i(78274)),	-- Replica Beaststalker's Belt
						darkmoonprizeticket(55, i(78277)),	-- Replica Beaststalker's Bindings
						darkmoonprizeticket(55, i(78272)),	-- Replica Beaststalker's Boots
						darkmoonprizeticket(75, i(78275)),	-- Replica Beaststalker's Cap
						darkmoonprizeticket(55, i(78271)),	-- Replica Beaststalker's Gloves
						darkmoonprizeticket(75, i(78273)),	-- Replica Beaststalker's Mantle
						darkmoonprizeticket(75, i(78276)),	-- Replica Beaststalker's Pants
						darkmoonprizeticket(75, i(78270)),	-- Replica Beaststalker's Tunic
					}),
					gs(1424, {	-- Dreadmist Raiment
						darkmoonprizeticket(55, i(78222)),	-- Replica Dreadmist Belt
						darkmoonprizeticket(55, i(78229)),	-- Replica Dreadmist Bracers
						darkmoonprizeticket(75, i(78228)),	-- Replica Dreadmist Leggings
						darkmoonprizeticket(75, i(78226)),	-- Replica Dreadmist Mantle
						darkmoonprizeticket(75, i(78227)),	-- Replica Dreadmist Mask
						darkmoonprizeticket(75, i(78225)),	-- Replica Dreadmist Robe
						darkmoonprizeticket(55, i(78224)),	-- Replica Dreadmist Sandals
						darkmoonprizeticket(55, i(78223)),	-- Replica Dreadmist Wraps
					}),
					gs(1430, {	-- Lightforge Armor
						darkmoonprizeticket(55, i(78302)),	-- Replica Lightforge Belt
						darkmoonprizeticket(55, i(78309)),	-- Replica Lightforge Boots
						darkmoonprizeticket(55, i(78304)),	-- Replica Lightforge Bracers
						darkmoonprizeticket(75, i(78306)),	-- Replica Lightforge Breastplate
						darkmoonprizeticket(55, i(78303)),	-- Replica Lightforge Gauntlets
						darkmoonprizeticket(75, i(78307)),	-- Replica Lightforge Helm
						darkmoonprizeticket(75, i(78305)),	-- Replica Lightforge Legplates
						darkmoonprizeticket(75, i(78308)),	-- Replica Lightforge Spaulders
					}),
					gs(1425, {	-- Magister's Regalia
						darkmoonprizeticket(55, i(78192)),	-- Replica Magister's Belt
						darkmoonprizeticket(55, i(78193)),	-- Replica Magister's Bindings
						darkmoonprizeticket(55, i(78186)),	-- Replica Magister's Boots
						darkmoonprizeticket(75, i(78188)),	-- Replica Magister's Crown
						darkmoonprizeticket(55, i(78187)),	-- Replica Magister's Gloves
						darkmoonprizeticket(75, i(78189)),	-- Replica Magister's Leggings
						darkmoonprizeticket(75, i(78191)),	-- Replica Magister's Mantle
						darkmoonprizeticket(75, i(78190)),	-- Replica Magister's Robes
					}),
					gs(1427, {	-- Shadowcraft Armor
						darkmoonprizeticket(55, i(78259)),	-- Replica Shadowcraft Belt
						darkmoonprizeticket(55, i(78256)),	-- Replica Shadowcraft Boots
						darkmoonprizeticket(55, i(78255)),	-- Replica Shadowcraft Bracers
						darkmoonprizeticket(75, i(78260)),	-- Replica Shadowcraft Cap
						darkmoonprizeticket(55, i(78257)),	-- Replica Shadowcraft Gloves
						darkmoonprizeticket(75, i(78258)),	-- Replica Shadowcraft Pants
						darkmoonprizeticket(75, i(78261)),	-- Replica Shadowcraft Spaulders
						darkmoonprizeticket(75, i(78254)),	-- Replica Shadowcraft Tunic
					}),
					gs(1429, {	-- The Elements
						darkmoonprizeticket(55, i(78289)),	-- Replica Bindings of Elements
						darkmoonprizeticket(55, i(78292)),	-- Replica Boots of Elements
						darkmoonprizeticket(75, i(78286)),	-- Replica Coif of Elements
						darkmoonprizeticket(55, i(78293)),	-- Replica Cord of Elements
						darkmoonprizeticket(55, i(78291)),	-- Replica Gauntlets of Elements
						darkmoonprizeticket(75, i(78287)),	-- Replica Kilt of Elements
						darkmoonprizeticket(75, i(78288)),	-- Replica Pauldrons of Elements
						darkmoonprizeticket(75, i(78290)),	-- Replica Vest of Elements
					}),
					gs(359, {	-- Vestments of the Devout
						darkmoonprizeticket(55, i(78207)),	-- Replica Devout Belt
						darkmoonprizeticket(55, i(78211)),	-- Replica Devout Bracers
						darkmoonprizeticket(75, i(78205)),	-- Replica Devout Crown
						darkmoonprizeticket(55, i(78208)),	-- Replica Devout Gloves
						darkmoonprizeticket(75, i(78204)),	-- Replica Devout Mantle
						darkmoonprizeticket(75, i(78209)),	-- Replica Devout Robe
						darkmoonprizeticket(55, i(78210)),	-- Replica Devout Sandals
						darkmoonprizeticket(75, i(78206)),	-- Replica Devout Skirt
					}),
					gs(1426, {	-- Wildheart Raiment
						darkmoonprizeticket(55, i(78244)),	-- Replica Wildheart Belt
						darkmoonprizeticket(55, i(78243)),	-- Replica Wildheart Boots
						darkmoonprizeticket(55, i(78240)),	-- Replica Wildheart Bracers
						darkmoonprizeticket(75, i(78238)),	-- Replica Wildheart Cowl
						darkmoonprizeticket(55, i(78241)),	-- Replica Wildheart Gloves
						darkmoonprizeticket(75, i(78245)),	-- Replica Wildheart Kilt
						darkmoonprizeticket(75, i(78239)),	-- Replica Wildheart Spaulders
						darkmoonprizeticket(75, i(78242)),	-- Replica Wildheart Vest
					}),
				},
			})),
			n(57983, bubbleDownSelf({ ["timeline"] = { "added 4.3.0.14942" }, }, {	-- Baruma <Replica Armor Prizes>
				["coord"] = { 47.6, 66.0, DARKMOON_ISLAND },
				["groups"] = {
					gs(861, {	-- Battlegear of Heroism
						darkmoonprizeticket(55, i(78333)),	-- Replica Belt of Heroism
						darkmoonprizeticket(55, i(78326)),	-- Replica Boots of Heroism
						darkmoonprizeticket(55, i(78327)),	-- Replica Bracers of Heroism
						darkmoonprizeticket(75, i(78328)),	-- Replica Breastplate of Heroism
						darkmoonprizeticket(55, i(78329)),	-- Replica Gauntlets of Heroism
						darkmoonprizeticket(75, i(78330)),	-- Replica Helm of Heroism
						darkmoonprizeticket(75, i(78331)),	-- Replica Legplates of Heroism
						darkmoonprizeticket(75, i(78332)),	-- Replica Spaulders of Heroism
					}),
					gs(856, {	-- Beastmaster Armor
						darkmoonprizeticket(55, i(78285)),	-- Replica Beastmaster's Belt
						darkmoonprizeticket(55, i(78283)),	-- Replica Beastmaster's Bindings
						darkmoonprizeticket(55, i(78279)),	-- Replica Beastmaster's Boots
						darkmoonprizeticket(75, i(78284)),	-- Replica Beastmaster's Cap
						darkmoonprizeticket(55, i(78278)),	-- Replica Beastmaster's Gloves
						darkmoonprizeticket(75, i(78281)),	-- Replica Beastmaster's Mantle
						darkmoonprizeticket(75, i(78280)),	-- Replica Beastmaster's Pants
						darkmoonprizeticket(75, i(78282)),	-- Replica Beastmaster's Tunic
					}),
					gs(857, {	-- Darkmantle Armor
						darkmoonprizeticket(55, i(78265)),	-- Replica Darkmantle Belt
						darkmoonprizeticket(55, i(78262)),	-- Replica Darkmantle Boots
						darkmoonprizeticket(55, i(78264)),	-- Replica Darkmantle Bracers
						darkmoonprizeticket(75, i(78263)),	-- Replica Darkmantle Cap
						darkmoonprizeticket(55, i(78266)),	-- Replica Darkmantle Gloves
						darkmoonprizeticket(75, i(78268)),	-- Replica Darkmantle Pants
						darkmoonprizeticket(75, i(78267)),	-- Replica Darkmantle Spaulders
						darkmoonprizeticket(75, i(78269)),	-- Replica Darkmantle Tunic
					}),
					gs(854, {	-- Deathmist Rainment
						darkmoonprizeticket(55, i(78233)),	-- Replica Deathmist Belt
						darkmoonprizeticket(55, i(78232)),	-- Replica Deathmist Bracers
						darkmoonprizeticket(75, i(78231)),	-- Replica Deathmist Leggings
						darkmoonprizeticket(75, i(78234)),	-- Replica Deathmist Mantle
						darkmoonprizeticket(75, i(78230)),	-- Replica Deathmist Mask
						darkmoonprizeticket(75, i(78237)),	-- Replica Deathmist Robe
						darkmoonprizeticket(55, i(78235)),	-- Replica Deathmist Sandals
						darkmoonprizeticket(55, i(78236)),	-- Replica Deathmist Wraps
					}),
					gs(858, {	-- Feralheart Rainment
						darkmoonprizeticket(55, i(78246)),	-- Replica Feralheart Belt
						darkmoonprizeticket(55, i(78251)),	-- Replica Feralheart Boots
						darkmoonprizeticket(55, i(78253)),	-- Replica Feralheart Bracers
						darkmoonprizeticket(75, i(78249)),	-- Replica Feralheart Cowl
						darkmoonprizeticket(55, i(78248)),	-- Replica Feralheart Gloves
						darkmoonprizeticket(75, i(78250)),	-- Replica Feralheart Kilt
						darkmoonprizeticket(75, i(78247)),	-- Replica Feralheart Spaulders
						darkmoonprizeticket(75, i(78252)),	-- Replica Feralheart Vest
					}),
					gs(855, {	-- Sorcerer's Regalia
						darkmoonprizeticket(55, i(78202)),	-- Replica Sorcerer's Belt
						darkmoonprizeticket(55, i(78203)),	-- Replica Sorcerer's Bindings
						darkmoonprizeticket(55, i(78196)),	-- Replica Sorcerer's Boots
						darkmoonprizeticket(75, i(78198)),	-- Replica Sorcerer's Crown
						darkmoonprizeticket(55, i(78197)),	-- Replica Sorcerer's Gloves
						darkmoonprizeticket(75, i(78199)),	-- Replica Sorcerer's Leggings
						darkmoonprizeticket(75, i(78201)),	-- Replica Sorcerer's Mantle
						darkmoonprizeticket(75, i(78200)),	-- Replica Sorcerer's Robes
					}),
					gs(859, {	-- Soulforge Armor
						darkmoonprizeticket(55, i(78311)),	-- Replica Soulforge Belt
						darkmoonprizeticket(55, i(78310)),	-- Replica Soulforge Boots
						darkmoonprizeticket(55, i(78317)),	-- Replica Soulforge Bracers
						darkmoonprizeticket(75, i(78313)),	-- Replica Soulforge Breastplate
						darkmoonprizeticket(55, i(78314)),	-- Replica Soulforge Gauntlets
						darkmoonprizeticket(75, i(78312)),	-- Replica Soulforge Helm
						darkmoonprizeticket(75, i(78315)),	-- Replica Soulforge Legplates
						darkmoonprizeticket(75, i(78316)),	-- Replica Soulforge Spaulders
					}),
					gs(860, {	-- The Five Thunders
						darkmoonprizeticket(55, i(78296)),	-- Replica Bindings of The Five Thunders
						darkmoonprizeticket(55, i(78298)),	-- Replica Boots of The Five Thunders
						darkmoonprizeticket(75, i(78294)),	-- Replica Coif of The Five Thunders
						darkmoonprizeticket(55, i(78297)),	-- Replica Cord of The Five Thunders
						darkmoonprizeticket(55, i(78295)),	-- Replica Gauntlets of The Five Thunders
						darkmoonprizeticket(75, i(78301)),	-- Replica Kilt of The Five Thunders
						darkmoonprizeticket(75, i(78299)),	-- Replica Pauldrons of The Five Thunders
						darkmoonprizeticket(75, i(78300)),	-- Replica Vest of The Five Thunders
					}),
					gs(360, {	-- Vestments of the Virtuous
						darkmoonprizeticket(55, i(78218)),	-- Replica Virtuous Belt
						darkmoonprizeticket(55, i(78215)),	-- Replica Virtuous Bracers
						darkmoonprizeticket(75, i(78216)),	-- Replica Virtuous Crown
						darkmoonprizeticket(55, i(78217)),	-- Replica Virtuous Gloves
						darkmoonprizeticket(75, i(78213)),	-- Replica Virtuous Mantle
						darkmoonprizeticket(75, i(78212)),	-- Replica Virtuous Robe
						darkmoonprizeticket(55, i(78219)),	-- Replica Virtuous Sandals
						darkmoonprizeticket(75, i(78214)),	-- Replica Virtuous Skirt
					}),
				},
			})),
			n(55278, {	-- Boomie Sparks <Fireworks>
				["coord"] = { 48.2, 71.9, DARKMOON_ISLAND },
				["timeline"] = { "added 4.3.0.14942" },
				["groups"] = {
					darkmoonprizeticket(10, i(74142, {	-- Darkmoon Firework
						["timeline"] = { "added 4.3.0.14942" },
					})),
					darkmoonprizeticket(150, i(138202, {	-- Sparklepony XL (TOY!)
						["timeline"] = { "added 7.0.3.22248" },
					})),
				},
			}),
			n(55305, {	-- Carl Goodup <Balloon Vendor>
				["coord"] = { 49.3, 78.4, DARKMOON_ISLAND },
				["timeline"] = { "added 4.3.0.14942" },
				["groups"] = {
					darkmoonprizeticket(90, i(73762, {	-- Darkmoon Balloon (PET!)
						["timeline"] = { "added 4.3.0.15005" },
					})),
					i(75040, {	-- Flimsy Darkmoon Balloon
						["timeline"] = { "added 4.3.0.14942" },
					}),
					i(75041, {	-- Flimsy Green Balloon
						["timeline"] = { "added 4.3.0.14942" },
					}),
					i(75042, {	-- Flimsy Yellow Balloon (TOY!)
						["timeline"] = { "added 4.3.0.14942" },
					}),
					darkmoonprizeticket(90, i(164969, {	-- Horse Balloon (PET!)
						["timeline"] = { ADDED_8_1_5 },
					})),
					darkmoonprizeticket(90, i(164971, {	-- Murloc Balloon (PET!)
						["timeline"] = { ADDED_8_1_5 },
					})),
					darkmoonprizeticket(90, i(164970, {	-- Wolf Balloon (PET!)
						["timeline"] = { ADDED_8_1_5 },
					})),
				},
			}),
			n(85484, {	-- Chester <Vestments and Oddities>
				["coord"] = { 51.4, 75.0, DARKMOON_ISLAND },
				["timeline"] = { "added 6.0.1.18566" },
				["groups"] = {
					darkmoonprizeticket(90, i(116139, {	-- Haunting Memento (TOY!)
						["timeline"] = { "added 6.0.1.18566" },
					})),
					darkmoonprizeticket(130, i(116138, {	-- Last Deck of Nemelex Xobeh
						["timeline"] = { "added 6.0.1.18566" },
					})),
					darkmoonprizeticket(90, i(122238, {	-- Music Roll: Darkmoon Carousel
						["timeline"] = { "added 6.1.0.19480" },
					})),
					darkmoonprizeticket(55, i(116134, {	-- Noble's Fancy Boots
						["timeline"] = { "added 6.0.1.18566" },
					})),
					darkmoonprizeticket(75, i(116052, {	-- Nobleman's Coat
						["timeline"] = { "added 6.0.1.18566" },
					})),
					darkmoonprizeticket(75, i(116133, {	-- Nobleman's Pantaloons
						["timeline"] = { "added 6.0.1.18566" },
					})),
					darkmoonprizeticket(75, i(116137, {	-- Noblewoman's Finery
						["timeline"] = { "added 6.0.1.18566" },
					})),
					darkmoonprizeticket(75, i(116136, {	-- Noblewoman's Skirt
						["timeline"] = { "added 6.0.1.18566" },
					})),
				},
			}),
			n(56335, {	-- Daenrand Dawncrest <Heirloom Prizes>
				["coord"] = { 47.6, 66.7, DARKMOON_ISLAND },
				["timeline"] = { "added 4.3.0.14942" },
				["groups"] = {
					darkmoonprizeticket(100, i(122338, {	-- Ancient Heirloom Armor Casing
						["sym"] = { { "fill" } },	-- simply fill this item
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(120, i(122339, {	-- Ancient Heirloom Scabbard
						["sym"] = { { "fill" } },	-- simply fill this item
						["timeline"] = { "added 6.1.0.19445" },
					})),
					
					-- Old Heirlooms
					darkmoonprizeticket(50, i(42944, {	-- Balanced Heartseeker
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(75, i(42943, {	-- Bloodied Arcanite Reaper
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(69893, {	-- Bloodsoaked Skullforge Reaver
						["timeline"] = { "added 4.1.0.13812", "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(69889, {	-- Burnished Breastplate of Might
						["timeline"] = { "added 4.1.0.13812", "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(69890, {	-- Burnished Pauldrons of Might
						["timeline"] = { "added 4.1.0.13812", "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(75, i(79131, {	-- Burnished Warden Staff
						["timeline"] = { "added 5.0.1.15464", "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(42950, {	-- Champion Herod's Shoulders
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(48677, {	-- Champion's Deathdealer Breastplate
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(75, i(42946, {	-- Charmed Ancient Bone Bow
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(42948, {	-- Devout Aurastone Hammer
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(75, i(42947, {	-- Dignified Headmaster's Charge
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(70, i(42992, {	-- Discerning Eye of the Beast
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(93902, {	-- Flamescarred Draconian Deflector
						["timeline"] = { "added 5.2.0.16408", "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(93904, {	-- Musty Tome of the Lost
						["timeline"] = { "added 5.2.0.16408", "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(42951, {	-- Mystical Pauldrons of Elements
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(48683, {	-- Mystical Vest of Elements
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(48685, {	-- Polished Breastplate of Valor
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(42949, {	-- Polished Spaulders of Valor
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(48687, {	-- Preened Ironfeather Breastplate
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(42984, {	-- Preened Ironfeather Shoulders
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(75, i(48718, {	-- Repurposed Lava Dredger
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(42952, {	-- Stained Shadowcraft Spaulders
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(48689, {	-- Stained Shadowcraft Tunic
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(70, i(42991, {	-- Swift Hand of Justice
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(42985, {	-- Tattered Dreadmist Mantle
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(48691, {	-- Tattered Dreadmist Robe
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(42945, {	-- Venerable Dal'Rend's Sacred Charge
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(48716, {	-- Venerable Mass of McGowan
						["timeline"] = { "removed 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(93903, {	-- Weathered Observer's Shield
						["timeline"] = { "added 5.2.0.16408", "removed 6.1.0.19445" },
					})),
					
					-- New Heirlooms
					darkmoonprizeticket(50, i(122350, {	-- Balanced Heartseeker
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(75, i(122349, {	-- Bloodied Arcanite Reaper
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122389, {	-- Bloodsoaked Skullforge Reaver
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122387, {	-- Burnished Breastplate of Might
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122388, {	-- Burnished Pauldrons of Might
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(75, i(122363, {	-- Burnished Warden Staff
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122356, {	-- Champion Herod's Shoulders
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122379, {	-- Champion's Deathdealer Breastplate
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(75, i(122352, {	-- Charmed Ancient Bone Bow
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122354, {	-- Devout Aurastone Hammer
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(75, i(122353, {	-- Dignified Headmaster's Charge
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(70, i(122362, {	-- Discerning Eye of the Beast
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122391, {	-- Flamescarred Draconian Deflector
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122390, {	-- Musty Tome of the Lost
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122357, {	-- Mystical Pauldrons of Elements
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122380, {	-- Mystical Vest of Elements
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122381, {	-- Polished Breastplate of Valor
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122355, {	-- Polished Spaulders of Valor
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122382, {	-- Preened Ironfeather Breastplate
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122359, {	-- Preened Ironfeather Shoulders
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(75, i(122386, {	-- Repurposed Lava Dredger
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122358, {	-- Stained Shadowcraft Spaulders
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122383, {	-- Stained Shadowcraft Tunic
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(70, i(122361, {	-- Swift Hand of Justice
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122360, {	-- Tattered Dreadmist Mantle
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122384, {	-- Tattered Dreadmist Robe
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122351, {	-- Venerable Dal'Rend's Sacred Charge
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122385, {	-- Venerable Mass of McGowan
						["timeline"] = { "added 6.1.0.19445" },
					})),
					darkmoonprizeticket(50, i(122392, {	-- Weathered Observer's Shield
						["timeline"] = { "added 6.1.0.19445" },
					})),
				},
			}),
			n(14860, {	-- Flik
				-- #if AFTER 4.3.0
				["coord"] = { 55.4, 70.1, DARKMOON_ISLAND },
				-- #else
				["coords"] = {
					{ 36.4, 36.0, MULGORE },
					{ 37.6, 39.6, MULGORE },
					{ 42.8, 66.6, ELWYNN_FOREST },
					{ 41.4, 69.8, ELWYNN_FOREST },
					{ 43.6, 71.0, ELWYNN_FOREST },
					-- #if AFTER TBC
					{ 34.3, 35.1, TEROKKAR_FOREST },
					{ 35.8, 33.8, TEROKKAR_FOREST },
					-- #endif
				},
				-- #endif
				["groups"] = {
					HEAVY_LEATHER_BALL,
					i(11026),	-- Tree Frog (PET!)
					i(11027, {	-- Wood Frog (PET!)
						["isLimited"] = true,
					}),
				},
			}),
			n(55103, {	-- Galissa Sundew <Fishing Prizes>
				["coord"] = { 52.5, 88.7, DARKMOON_ISLAND },
				["timeline"] = { "added 5.4.2.17658" },
				["groups"] = {
					darkmoondaggermaw(50, i(126925, {	-- Blorp (PET!)
						["timeline"] = { ADDED_6_2_0 },
					})),
					darkmoondaggermaw(25, i(124671, {	-- Darkmoon Firewater
						["timeline"] = { ADDED_6_2_0 },
					})),
					darkmoondaggermaw(500, i(142398, {	-- Darkwater Skate (MOUNT!)
						["timeline"] = { "added 7.1.0.22731" },
					})),
					darkmoondaggermaw(25, i(124674, {	-- Day-Old Darkmoon Doughnut
						["timeline"] = { ADDED_6_2_0 },
					})),
					darkmoondaggermaw(100, i(126930, {	-- Faded Treasure Map
						["timeline"] = { ADDED_6_2_0 },
					})),
					darkmoondaggermaw(50, i(184689, {	-- Recipe: Extra Fancy Darkmoon Feast
						["timeline"] = { "added 9.0.2.36639" },
					})),
					darkmoondaggermaw(10, i(184683, {	-- Recipe: Extra Lemony Herb Filet
						["timeline"] = { "added 9.0.2.36639" },
					})),
					darkmoondaggermaw(25, i(184625, {	-- Recipe: Extra Sugary Fish Feast
						["timeline"] = { "added 9.0.2.36639" },
					})),
					darkmoondaggermaw(50, i(126929, {	-- Recipe: Fancy Darkmoon Feast
						["timeline"] = { ADDED_6_2_0 },
					})),
					darkmoondaggermaw(10, i(126928, {	-- Recipe: Lemon Herb Filet
						["timeline"] = { ADDED_6_2_0 },
					})),
					darkmoondaggermaw(25, i(126927, {	-- Recipe: Sugar-Crusted Fish Feast
						["timeline"] = { ADDED_6_2_0 },
					})),
					darkmoondaggermaw(25, i(126931, {	-- Seafarer's Slidewhistle (TOY!)
						["timeline"] = { ADDED_6_2_0 },
					})),
					darkmoondaggermaw(100, i(126926, {	-- Ghostshell Crab (PET!)
						["timeline"] = { ADDED_6_2_0 },
					})),
				},
			}),
			-- #if AFTER 4.3.0
			n(14828, {	-- Gelvas Grimegate <Souvenir & Toy Prizes>
				["coord"] = { 47.7, 64.7, DARKMOON_ISLAND },
				["groups"] = {
					darkmoonprizeticket(90, i(78340, {	-- Cloak of the Darkmoon Faire
						["timeline"] = { "added 4.3.0.15005" },
					})),
					darkmoonprizeticket(20, i(77256, {	-- Darkmoon "Sword"
						["timeline"] = { "added 4.3.0.15005" },
					})),
					darkmoonprizeticket(90, i(73762, {	-- Darkmoon Balloon (PET!)
						["timeline"] = { "added 4.3.0.15005" },
					})),
					darkmoonprizeticket(1, i(19295)),	-- Darkmoon Flower
					darkmoonprizeticket(75, i(78341, {	-- Darkmoon Hammer
						["timeline"] = { "added 4.3.0.15005" },
					})),
					darkmoonprizeticket(50, i(97994, {	-- Darkmoon Seesaw (TOY!)
						["timeline"] = { "added 5.3.0.16758" },
					})),
					darkmoonprizeticket(1, i(19291)),	-- Darkmoon Storage Box
					darkmoonprizeticket(90, i(90899, {	-- Darkmoon Whistle (TOY!)
						["timeline"] = { "added 5.1.0.16309" },
					})),
				},
			}),
			-- #endif
			n(14846, {	-- Lhara <Darkmoon Faire Exotic Goods>
				-- #if AFTER 4.3.0
				["coord"] = { 48.0, 69.5, DARKMOON_ISLAND },
				-- #else
				["coords"] = {
					{ 36.4, 38.0, MULGORE },
					{ 41.2, 69.8, ELWYNN_FOREST },
					-- #if AFTER TBC
					{ 34.3, 34.4, TEROKKAR_FOREST },
					-- #endif
				},
				-- #endif
				["groups"] = {
					-- #if AFTER 4.3.0
					darkmoonprizeticket(90, i(73762, {	-- Darkmoon Balloon (PET!)
						["timeline"] = { "added 4.3.0.15005" },
					})),
					darkmoonprizeticket(90, i(74981, {	-- Darkmoon Cub (PET!)
						["timeline"] = { "added 4.3.0.15005" },
					})),
					darkmoonprizeticket(180, i(73766, {	-- Darkmoon Dancing Bear (MOUNT!)
						["timeline"] = { "added 4.3.0.15005" },
					})),
					darkmoonprizeticket(1000, i(153485, {	-- Darkmoon Dirigible (MOUNT!)
						["timeline"] = { "added 7.3.0.24781" },
					})),
					darkmoonprizeticket(90, i(91003, {	-- Darkmoon Hatchling (PET!)
						["timeline"] = { ADDED_5_1_0 },
					})),
					darkmoonprizeticket(90, i(73764, {	-- Darkmoon Monkey (PET!)
						["timeline"] = { "added 4.3.0.15005" },
					})),
					-- #else
					BIG_STICK,
					DARING_DIRK,
					-- #endif
					i(19303, {	-- Darkmoon Necklace
						["timeline"] = { "removed 4.3.0" },
					}),
					i(19302, {	-- Darkmoon Ring
						["timeline"] = { "removed 4.3.0" },
					}),
					-- #if AFTER 4.3.0
					darkmoonprizeticket(90, i(73903, {	-- Darkmoon Tonk  (PET!)
						["timeline"] = { "added 4.3.0.15005" },
					})),
					darkmoonprizeticket(90, i(73765, {	-- Darkmoon Turtle  (PET!)
						["timeline"] = { "added 4.3.0.15005" },
					})),
					darkmoonprizeticket(90, i(73905, {	-- Darkmoon Zeppelin  (PET!)
						["timeline"] = { "added 4.3.0.15005" },
					})),
					darkmoonprizeticket(180, i(72140, {	-- Swift Forest Strider (MOUNT!)
						["timeline"] = { "added 4.3.0.15005" },
					})),
					-- #else
					DENSE_SHORTBOW,
					FINE_SHORTBOW,
					STURDY_RECURVE,
					SLYVAN_SHORTBOW,
					-- #endif
				},
			}),
			-- #if AFTER 6.0.1.18379
			n(14847, {	-- Professor Thaddeus Paleo <Darkmoon Cards>
				["coord"] = { 51.9, 60.9, DARKMOON_ISLAND },
				["groups"] = {
					i(113135, bubbleDownSelf({ ["timeline"] = { "added 6.0.1.18379" }, }, {	-- Iron Joker
						["description"] = "You can trade in a joker for any one of the cards you are missing to Thaddeus Paleo at the Darkmoon Faire.",
						["groups"] = {
							i(112278),	-- Ace of Iron
							i(112271),	-- Eight of Iron
							i(112275),	-- Five of Iron
							i(112274),	-- Four of Iron
							i(112272),	-- Seven of Iron
							i(112273),	-- Six of Iron
							i(112276),	-- Three of Iron
							i(112277),	-- Two of Iron
						},
					})),
					i(113142, bubbleDownSelf({ ["timeline"] = { "added 6.0.1.18379" }, }, {	-- Moon Joker
						["description"] = "You can trade in a joker for any one of the cards you are missing to Thaddeus Paleo at the Darkmoon Faire.",
						["groups"] = {
							i(112302),	-- Ace of the Moon
							i(112295),	-- Eight of the Moon
							i(112298),	-- Five of the Moon
							i(112299),	-- Four of the Moon
							i(112296),	-- Seven of the Moon
							i(112297),	-- Six of the Moon
							i(112300),	-- Three of the Moon
							i(112301),	-- Two of the Moon
						},
					})),
					darkmoonprizeticket(50, i(137790, {	-- Technique: Darkmoon Card of the Legion [Rank 2] (RECIPE!)
						["timeline"] = { "added 7.0.3.22248" },
					})),
					darkmoonprizeticket(250, i(137791, {	-- Technique: Darkmoon Card of the Legion [Rank 3] (RECIPE!)
						["timeline"] = { "added 7.0.3.22248" },
					})),
					darkmoonprizeticket(5, i(137745, {	-- Technique: Propehcy Tarot [Rank 2] (RECIPE!)
						["timeline"] = { "added 7.0.3.22248" },
					})),
					darkmoonprizeticket(35, i(137746, {	-- Technique: Propehcy Tarot [Rank 3] (RECIPE!)
						["timeline"] = { "added 7.0.3.22248" },
					})),
					i(113139, bubbleDownSelf({ ["timeline"] = { "added 6.0.1.18379" }, }, {	-- Visions Joker
						["description"] = "You can trade in a joker for any one of the cards you are missing to Thaddeus Paleo at the Darkmoon Faire.",
						["groups"] = {
							i(112286),	-- Ace of Visions
							i(112279),	-- Eight of Visions
							i(112282),	-- Five of Visions
							i(112283),	-- Four of Visions
							i(112280),	-- Seven of Visions
							i(112281),	-- Six of Visions
							i(112284),	-- Three of Visions
							i(112285),	-- Two of Visions
						},
					})),
					i(113140, bubbleDownSelf({ ["timeline"] = { "added 6.0.1.18379" }, }, {	-- War Joker
						["description"] = "You can trade in a joker for any one of the cards you are missing to Thaddeus Paleo at the Darkmoon Faire.",
						["groups"] = {
							i(112294),	-- Ace of War
							i(112287),	-- Eight of War
							i(112290),	-- Five of War
							i(112291),	-- Four of War
							i(112288),	-- Seven of War
							i(112289),	-- Six of War
							i(112292),	-- Three of War
							i(112293),	-- Two of War
						},
					})),
				},
			}),
			-- #endif
			n(108785, bubbleDownSelf({ ["timeline"] = { "added 7.0.3.22345" }, }, {	-- Scarlet Quartermaster
				["description"] = "You must be wearing Tabard of the Scarlet Crusade in order to purchase items from the Scarlet Quartermaster.  A tabard that has been transmogged will NOT work.",
				["provider"] = { "i", 23192 },	-- Tabard of the Scarlet Crusade
				["coord"] = { 58.2, 80.6, DARKMOON_ISLAND },
				["groups"] = {
					i(138429, {	-- Cropped Tabard of the Scarlet Crusade
						["cost"] = 250000000,	-- 25,000g
					}),
					i(138430, {	-- Ensemble: Chain of the Scarlet Crusade
						["cost"] = 100000000,	-- 10,000g
						["groups"] = {
							i(10329),	-- Scarlet Belt
							i(10332),	-- Scarlet Boots
							i(10328),	-- Scarlet Chestpiece
							i(10331),	-- Scarlet Gauntlets
							i(10330),	-- Scarlet Leggings
							i(10333),	-- Scarlet Wristguards
						},
					}),
					i(138431, {	-- Ensemble: Scale of the Scarlet Crusade
						["cost"] = 100000000,	-- 10,000g
						["groups"] = {
							i(138424),	-- Scarlet Belt
							i(138427),	-- Scarlet Boots
							i(138423),	-- Scarlet Chestpiece
							i(138426),	-- Scarlet Gauntlets
							i(138425),	-- Scarlet Leggings
							i(138428),	-- Scarlet Wristguards
						},
					}),
				},
			})),
			-- #if AFTER 8.0.1.26530
			n(14845, {	-- Stamp Thunderhorn <Food Vendor>
				["coord"] = { 52.8, 67.9, DARKMOON_ISLAND },
				["groups"] = {
					darkmoonprizeticket(50, i(162539, {	-- Hot Buttered Popcorn (TOY!)
						["timeline"] = { "added 8.0.1.26530" },
					})),
				},
			}),
			-- #endif
			n(56069, {	-- Tatia Brine <Fishing Supplies>
				["coord"] = { 52.37, 88.76, DARKMOON_ISLAND },
				["timeline"] = { "added 4.3.0.14942" },
				["groups"] = {
					i(6325),	-- Recipe: Brilliant Smallfish
					i(6330),	-- Recipe: Bristle Whisker Catfish
				},
			}),
		}),
		category(3, {	-- Tarot Decks
			applyclassicphase(PHASE_THREE, i(19228, {	-- Beasts Deck
				["cost"] = {
					{ "i", 19227, 1 },	-- Ace of Beasts
					{ "i", 19230, 1 },	-- Two of Beasts
					{ "i", 19231, 1 },	-- Three of Beasts
					{ "i", 19232, 1 },	-- Four of Beasts
					{ "i", 19233, 1 },	-- Five of Beasts
					{ "i", 19234, 1 },	-- Six of Beasts
					{ "i", 19235, 1 },	-- Seven of Beasts
					{ "i", 19236, 1 },	-- Eight of Beasts
				},
			})),
			applyclassicphase(TBC_PHASE_THREE, i(31890, {	-- Blessings Deck
				["cost"] = {
					{ "i", 31882, 1 },	-- Ace of Blessings
					{ "i", 31889, 1 },	-- Two of Blessings
					{ "i", 31888, 1 },	-- Three of Blessings
					{ "i", 31885, 1 },	-- Four of Blessings
					{ "i", 31884, 1 },	-- Five of Blessings
					{ "i", 31887, 1 },	-- Six of Blessings
					{ "i", 31886, 1 },	-- Seven of Blessings
					{ "i", 31883, 1 },	-- Eight of Blessings
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, i(44276, {	-- Chaos Deck
				["cost"] = {
					{ "i", 44277, 1 },	-- Ace of Chaos
					{ "i", 44278, 1 },	-- Two of Chaos
					{ "i", 44279, 1 },	-- Three of Chaos
					{ "i", 44280, 1 },	-- Four of Chaos
					{ "i", 44281, 1 },	-- Five of Chaos
					{ "i", 44282, 1 },	-- Six of Chaos
					{ "i", 44284, 1 },	-- Seven of Chaos
					{ "i", 44285, 1 },	-- Eight of Chaos
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, i(44158, {	-- Demons Deck
				["cost"] = {
					{ "i", 44143, 1 },	-- Ace of Demons
					{ "i", 44154, 1 },	-- Two of Demons
					{ "i", 44155, 1 },	-- Three of Demons
					{ "i", 44156, 1 },	-- Four of Demons
					{ "i", 44157, 1 },	-- Five of Demons
				},
			})),
			applyclassicphase(PHASE_THREE, i(19267, {	-- Elementals Deck
				["cost"] = {
					{ "i", 19268, 1 },	-- Ace of Elementals
					{ "i", 19269, 1 },	-- Two of Elementals
					{ "i", 19270, 1 },	-- Three of Elementals
					{ "i", 19271, 1 },	-- Four of Elementals
					{ "i", 19272, 1 },	-- Five of Elementals
					{ "i", 19273, 1 },	-- Six of Elementals
					{ "i", 19274, 1 },	-- Seven of Elementals
					{ "i", 19275, 1 },	-- Eight of Elementals
				},
			})),
			applyclassicphase(TBC_PHASE_THREE, i(31907, {	-- Furies Deck
				["cost"] = {
					{ "i", 31901, 1 },	-- Ace of Furies
					{ "i", 31909, 1 },	-- Two of Furies
					{ "i", 31908, 1 },	-- Three of Furies
					{ "i", 31904, 1 },	-- Four of Furies
					{ "i", 31903, 1 },	-- Five of Furies
					{ "i", 31906, 1 },	-- Six of Furies
					{ "i", 31905, 1 },	-- Seven of Furies
					{ "i", 31902, 1 },	-- Eight of Furies
				},
			})),
			applyclassicphase(TBC_PHASE_THREE, i(31914, {	-- Lunacy Deck
				["cost"] = {
					{ "i", 31910, 1 },	-- Ace of Lunacy
					{ "i", 31918, 1 },	-- Two of Lunacy
					{ "i", 31917, 1 },	-- Three of Lunacy
					{ "i", 31913, 1 },	-- Four of Lunacy
					{ "i", 31912, 1 },	-- Five of Lunacy
					{ "i", 31916, 1 },	-- Six of Lunacy
					{ "i", 31915, 1 },	-- Seven of Lunacy
					{ "i", 31911, 1 },	-- Eight of Lunacy
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, i(44148, {	-- Mages Deck
				["cost"] = {
					{ "i", 44165, 1 },	-- Ace of Mages
					{ "i", 44144, 1 },	-- Two of Mages
					{ "i", 44145, 1 },	-- Three of Mages
					{ "i", 44146, 1 },	-- Four of Mages
					{ "i", 44147, 1 },	-- Five of Mages
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, i(44326, {	-- Nobles Deck
				["cost"] = {
					{ "i", 44268, 1 },	-- Ace of Nobles
					{ "i", 44269, 1 },	-- Two of Nobles
					{ "i", 44270, 1 },	-- Three of Nobles
					{ "i", 44271, 1 },	-- Four of Nobles
					{ "i", 44272, 1 },	-- Five of Nobles
					{ "i", 44273, 1 },	-- Six of Nobles
					{ "i", 44274, 1 },	-- Seven of Nobles
					{ "i", 44275, 1 },	-- Eight of Nobles
				},
			})),
			applyclassicphase(PHASE_THREE, i(19277, {	-- Portals Deck
				["cost"] = {
					{ "i", 19276, 1 },	-- Ace of Portals
					{ "i", 19278, 1 },	-- Two of Portals
					{ "i", 19279, 1 },	-- Three of Portals
					{ "i", 19280, 1 },	-- Four of Portals
					{ "i", 19281, 1 },	-- Five of Portals
					{ "i", 19282, 1 },	-- Six of Portals
					{ "i", 19283, 1 },	-- Seven of Portals
					{ "i", 19284, 1 },	-- Eight of Portals
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, i(44259, {	-- Prisms Deck
				["cost"] = {
					{ "i", 44260, 1 },	-- Ace of Prisms
					{ "i", 44261, 1 },	-- Two of Prisms
					{ "i", 44262, 1 },	-- Three of Prisms
					{ "i", 44263, 1 },	-- Four of Prisms
					{ "i", 44264, 1 },	-- Five of Prisms
					{ "i", 44265, 1 },	-- Six of Prisms
					{ "i", 44266, 1 },	-- Seven of Prisms
					{ "i", 44267, 1 },	-- Eight of Prisms
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, i(37163, {	-- Rogues Deck
				["cost"] = {
					{ "i", 37140, 1 },	-- Ace of Rogues
					{ "i", 37143, 1 },	-- Two of Rogues
					{ "i", 37156, 1 },	-- Three of Rogues
				},
			})),
			applyclassicphase(TBC_PHASE_THREE, i(31891, {	-- Storms Deck
				["cost"] = {
					{ "i", 31892, 1 },	-- Ace of Storms
					{ "i", 31900, 1 },	-- Two of Storms
					{ "i", 31899, 1 },	-- Three of Storms
					{ "i", 31895, 1 },	-- Four of Storms
					{ "i", 31894, 1 },	-- Five of Storms
					{ "i", 31898, 1 },	-- Six of Storms
					{ "i", 31896, 1 },	-- Seven of Storms
					{ "i", 31893, 1 },	-- Eight of Storms
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, i(37164, {	-- Swords Deck
				["cost"] = {
					{ "i", 37145, 1 },	-- Ace of Swords
					{ "i", 37147, 1 },	-- Two of Swords
					{ "i", 37159, 1 },	-- Three of Swords
					{ "i", 37160, 1 },	-- Four of Swords
				},
			})),
			applyclassicphase(WRATH_PHASE_ONE, i(44294, {	-- Undeath Deck
				["cost"] = {
					{ "i", 44286, 1 },	-- Ace of Undeath
					{ "i", 44287, 1 },	-- Two of Undeath
					{ "i", 44288, 1 },	-- Three of Undeath
					{ "i", 44289, 1 },	-- Four of Undeath
					{ "i", 44290, 1 },	-- Five of Undeath
					{ "i", 44291, 1 },	-- Six of Undeath
					{ "i", 44292, 1 },	-- Seven of Undeath
					{ "i", 44293, 1 },	-- Eight of Undeath
				},
			})),
			applyclassicphase(PHASE_THREE, i(19257, {	-- Warlords Deck
				["cost"] = {
					{ "i", 19258, 1 },	-- Ace of Warlords
					{ "i", 19259, 1 },	-- Two of Warlords
					{ "i", 19260, 1 },	-- Three of Warlords
					{ "i", 19261, 1 },	-- Four of Warlords
					{ "i", 19262, 1 },	-- Five of Warlords
					{ "i", 19263, 1 },	-- Six of Warlords
					{ "i", 19264, 1 },	-- Seven of Warlords
					{ "i", 19265, 1 },	-- Eight of Warlords
				},
			})),
		}),
	},
})));

-- Wipe out the unobtainable states.
HEAVY_LEATHER_BALL.u = nil;
DENSE_SHORTBOW.u = nil;
DARING_DIRK.u = nil;
BIG_STICK.u = nil;
SLYVAN_SHORTBOW.u = nil;
STURDY_RECURVE.u = nil;
FINE_SHORTBOW.u = nil;
STEAM_TONK_CONTROLLER.u = nil;

root(ROOTS.HiddenQuestTriggers,{
	tier(CATA_TIER, {
		q(30562),	-- [DNT] A Fizzy Fusion TRACKER - triggers after completing A Fizzy Fusion (questID 29506)
		q(30561),	-- [DNT] Fun for the Little Ones TRACKER - triggers after completing Fun For the Little Ones (questID 29507)
	}),
	tier(MOP_TIER, {
		q(30557),	-- [DNT] A Captured Banner TRACKER - triggers after completing A Captured Banner (questID 29456)
		q(30553),	-- [DNT] A Curious Crystal TRACKER - triggers after completing A Curious Crystal (questID 29443)
		q(30556),	-- [DNT] A Wondrous Weapon TRACKER - triggers after completing A Wondrous Weapon (questID 29446)
		q(30554),	-- [DNT] An Exotic Egg TRACKER - triggers after completing An Exotic Egg (questID 29444)
		q(30555),	-- [DNT] An Intriguing Grimoire TRACKER - triggers after completing An Intriguing Grimoire (questID 29445)
		q(30539),	-- [DNT] Baby Needs Two Pair of Shoes TRACKER - triggers after completing Baby Needs Two Pair of Shoes (questID 29508)
		q(30551),	-- [DNT] Banners, Banners Everywhere! TRACKER - triggers after completing Banners, Banners Everywhere! (questID 29520)
		q(30548),	-- [DNT] Eyes on the Prizes TRACKER - triggers after completing Eyes on the Prizes (questID 29517)
		q(30545),	-- [DNT] Herbs for Healing TRACKER - triggers after completing Herbs for Healing (questID 29514)
		q(30547),	-- [DNT] Keeping the Faire Sparkling TRACKER - triggers after completing Keeping the Faire Sparkling (questID 29516)
		q(30543),	-- [DNT] Putting the Carnies Back Together Again TRACKER
		q(30540),	-- [DNT] Putting the Crunch in the Frog TRACKER - triggers after completing Putting the Crunch in the Frog (questID 29509)
		q(30541),	-- [DNT] Putting Trash to Good Use TRACKER - triggers after completing Putting Trash to Good Use (questID 29510)
		q(30544),	-- [DNT] Spoilin' for Salty Sea Dogs TRACKER - triggers after completing Spoilin' for Salty Sea Dogs (questID 29513)
		q(30542),	-- [DNT] Talkin' Tonks TRACKER - triggers after completing Talkin' Tonks (questID 29511)
		q(30550),	-- [DNT] Tan My Hide TRACKER - triggers after completing Tan My Hide (questID 29519)
		q(30559),	-- [DNT] The Captured Journal TRACKER - triggers after completing The Captured Journal (questID 29458)
		q(30558),	-- [DNT] The Enemy's Insignia TRACKER - triggers after completing The Enemy's Insignia (questID 29457)
		q(30552),	-- [DNT] The Master Strategist TRACKER - triggers after completing The Master Strategist (questID 29451)
		q(30560),	-- [DNT] Tools of Divination TRACKER - triggers after completing Tools of Divination (questID 29464)
		q(30546),	-- [DNT] Writing the Future TRACKER - triggers after completing Writing the Future (questID 29515)
	}),
	tier(BFA_TIER, {
		q(45038),	-- Hexsweeper lvl 1
		q(45039),	-- Hexsweeper lvl 2
		q(45040),	-- Hexsweeper lvl 3
		q(45041),	-- Hexsweeper lvl 4
		q(45042),	-- Hexsweeper lvl 5
		q(59312),	-- Hexsweeper lvl X
		q(57827),	-- Rune Matching easy
		q(57828),	-- Rune Matching normal
		q(57829),	-- Rune Matching hard
		q(57830),	-- Rune Matching hardest
		q(57835),	-- Totems lvl 1
		q(57836),	-- Totems lvl 2
		q(57837),	-- Totems lvl 3
		q(57838),	-- Totems lvl 4
		q(57839),	-- Totems lvl 5
		q(58572),	-- playing console game, remembthon something
		q(57776),	-- unknown tracking quest that appeared after speaking to Selina Dourman
	}),
});