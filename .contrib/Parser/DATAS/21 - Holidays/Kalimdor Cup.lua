--------------------------------------------
--     H O L I D A Y S  M O D U L E       --
--------------------------------------------
KALIMDOR_CUP_HEADER = createHeader({
	readable = "Kalimdor Cup",
	constant = "KALIMDOR_CUP_HEADER",
	icon = "Interface\\Icons\\misc_arrowrightcalendar_kalimdorcupstart",
	eventID = EVENTS.KALIMDOR_CUP,
	text = {
		en = "Kalimdor Cup",
	},
});
local RIDERS_OF_AZEROTH_BADGE = 2588;
root(ROOTS.Holidays, applyevent(EVENTS.KALIMDOR_CUP, n(KALIMDOR_CUP_HEADER, bubbleDownSelf({ ["timeline"] = { ADDED_10_1_5 } }, {
	n(ACHIEVEMENTS, {
		ach(17712, {	-- Kalimdor: Bronze
			-- Meta Achievement
			["sym"] = {{"meta_achievement",
				17685,	-- Ahn'Qiraj Circuit: Bronze
				17613,	-- Ashenvale Ambit: Bronze
				17640,	-- Desolace Drift: Bronze
				17622,	-- Durotar Tour: Bronze
				17568,	-- Felwood Flyover: Bronze
				17676,	-- Feralas Ruins Ramble: Bronze
				17649,	-- Great Divide Dive: Bronze
				17595,	-- Hyjal Hotfoot: Bronze
				17586,	-- Nordrassil Spiral: Bronze
				17658,	-- Razorfen Roundabout: Bronze
				17604,	-- Rocketway Ride: Bronze
				17667,	-- Thousand Needles Thread: Bronze
				17694,	-- Uldum Tour: Bronze
				17703,	-- Un'Goro Crater Circuit: Bronze
				17631,	-- Webwinder Weave: Bronze
				17577,	-- Winter Wander: Bronze
			}},
		}),
		ach(17713, {	-- Kalimdor: Silver
			-- Meta Achievement
			["sym"] = {{"meta_achievement",
				17686,	-- Ahn'Qiraj Circuit: Silver
				17614,	-- Ashenvale Ambit: Silver
				17641,	-- Desolace Drift: Silver
				17623,	-- Durotar Tour: Silver
				17569,	-- Felwood Flyover: Silver
				17677,	-- Feralas Ruins Ramble: Silver
				17650,	-- Great Divide Dive: Silver
				17596,	-- Hyjal Hotfoot: Silver
				17587,	-- Nordrassil Spiral: Silver
				17659,	-- Razorfen Roundabout: Silver
				17605,	-- Rocketway Ride: Silver
				17668,	-- Thousand Needles Thread: Silver
				17695,	-- Uldum Tour: Silver
				17704,	-- Un'Goro Crater Circuit: Silver
				17632,	-- Webwinder Weave: Silver
				17578,	-- Winter Wander: Silver
			}},
		}),
		ach(17714, {	-- Kalimdor: Gold
			-- Meta Achievement
			["sym"] = {{"meta_achievement",
				17687,	-- Ahn'Qiraj Circuit: Gold
				17615,	-- Ashenvale Ambit: Gold
				17642,	-- Desolace Drift: Gold
				17624,	-- Durotar Tour: Gold
				17570,	-- Felwood Flyover: Gold
				17678,	-- Feralas Ruins Ramble: Gold
				17651,	-- Great Divide Dive: Gold
				17597,	-- Hyjal Hotfoot: Gold
				17588,	-- Nordrassil Spiral: Gold
				17660,	-- Razorfen Roundabout: Gold
				17606,	-- Rocketway Ride: Gold
				17669,	-- Thousand Needles Thread: Gold
				17696,	-- Uldum Tour: Gold
				17705,	-- Un'Goro Crater Circuit: Gold
				17633,	-- Webwinder Weave: Gold
				17579,	-- Winter Wander: Gold
			}},
		}),
		ach(17715, {	-- Kalimdor Advanced: Bronze
			-- Meta Achievement
			["sym"] = {{"meta_achievement",
				17688,	-- Ahn'Qiraj Circuit Advanced: Bronze
				17616,	-- Ashenvale Ambit Advanced: Bronze
				17643,	-- Desolace Drift Advanced: Bronze
				17625,	-- Durotar Tour Advanced: Bronze
				17571,	-- Felwood Flyover Advanced: Bronze
				17679,	-- Feralas Ruins Ramble Advanced: Bronze
				17652,	-- Great Divide Dive Advanced: Bronze
				17598,	-- Hyjal Hotfoot Advanced: Bronze
				17589,	-- Nordrassil Spiral Advanced: Bronze
				17661,	-- Razorfen Roundabout Advanced: Bronze
				17607,	-- Rocketway Ride Advanced: Bronze
				17670,	-- Thousand Needles Thread Advanced: Bronze
				17697,	-- Uldum Tour Advanced: Bronze
				17706,	-- Un'Goro Crater Circuit Advanced: Bronze
				17634,	-- Webwinder Weave Advanced: Bronze
				17580,	-- Winter Wander Advanced: Bronze
			}},
		}),
		ach(17716, {	-- Kalimdor Advanced: Silver
			-- Meta Achievement
			["sym"] = {{"meta_achievement",
				17689,	-- Ahn'Qiraj Circuit Advanced: Silver
				17617,	-- Ashenvale Ambit Advanced: Silver
				17644,	-- Desolace Drift Advanced: Silver
				17626,	-- Durotar Tour Advanced: Silver
				17572,	-- Felwood Flyover Advanced: Silver
				17680,	-- Feralas Ruins Ramble Advanced: Silver
				17653,	-- Great Divide Dive Advanced: Silver
				17599,	-- Hyjal Hotfoot Advanced: Silver
				17590,	-- Nordrassil Spiral Advanced: Silver
				17662,	-- Razorfen Roundabout Advanced: Silver
				17608,	-- Rocketway Ride Advanced: Silver
				17671,	-- Thousand Needles Thread Advanced: Silver
				17698,	-- Uldum Tour Advanced: Silver
				17707,	-- Un'Goro Crater Circuit Advanced: Silver
				17635,	-- Webwinder Weave Advanced: Silver
				17581,	-- Winter Wander Advanced: Silver
			}},
		}),
		ach(17717, {	-- Kalimdor Advanced: Gold
			-- Meta Achievement
			["sym"] = {{"meta_achievement",
				17690,	-- Ahn'Qiraj Circuit Advanced: Gold
				17618,	-- Ashenvale Ambit Advanced: Gold
				17645,	-- Desolace Drift Advanced: Gold
				17627,	-- Durotar Tour Advanced: Gold
				17573,	-- Felwood Flyover Advanced: Gold
				17681,	-- Feralas Ruins Ramble Advanced: Gold
				17654,	-- Great Divide Dive Advanced: Gold
				17600,	-- Hyjal Hotfoot Advanced: Gold
				17591,	-- Nordrassil Spiral Advanced: Gold
				17663,	-- Razorfen Roundabout Advanced: Gold
				17609,	-- Rocketway Ride Advanced: Gold
				17672,	-- Thousand Needles Thread Advanced: Gold
				17699,	-- Uldum Tour Advanced: Gold
				17708,	-- Un'Goro Crater Circuit Advanced: Gold
				17636,	-- Webwinder Weave Advanced: Gold
				17582,	-- Winter Wander Advanced: Gold
			}},
		}),
		ach(17718, {	-- Kalimdor Reverse: Bronze
			-- Meta Achievement
			["sym"] = {{"meta_achievement",
				17691,	-- Ahn'Qiraj Circuit Reverse: Bronze
				17619,	-- Ashenvale Ambit Reverse: Bronze
				17646,	-- Desolace Drift Reverse: Bronze
				17628,	-- Durotar Tour Reverse: Bronze
				17574,	-- Felwood Flyover Reverse: Bronze
				17682,	-- Feralas Ruins Ramble Reverse: Bronze
				17655,	-- Great Divide Dive Reverse: Bronze
				17601,	-- Hyjal Hotfoot Reverse: Bronze
				17592,	-- Nordrassil Spiral Reverse: Bronze
				17664,	-- Razorfen Roundabout Reverse: Bronze
				17610,	-- Rocketway Ride Reverse: Bronze
				17673,	-- Thousand Needles Thread Reverse: Bronze
				17700,	-- Uldum Tour Reverse: Bronze
				17709,	-- Un'Goro Crater Circuit Reverse: Bronze
				17637,	-- Webwinder Weave Reverse: Bronze
				17583,	-- Winter Wander Reverse: Bronze
			}},
		}),
		ach(17719, {	-- Kalimdor Reverse: Silver
			-- Meta Achievement
			["sym"] = {{"meta_achievement",
				17692,	-- Ahn'Qiraj Circuit Reverse: Silver
				17620,	-- Ashenvale Ambit Reverse: Silver
				17647,	-- Desolace Drift Reverse: Silver
				17629,	-- Durotar Tour Reverse: Silver
				17575,	-- Felwood Flyover Reverse: Silver
				17683,	-- Feralas Ruins Ramble Reverse: Silver
				17656,	-- Great Divide Dive Reverse: Silver
				17602,	-- Hyjal Hotfoot Reverse: Silver
				17593,	-- Nordrassil Spiral Reverse: Silver
				17665,	-- Razorfen Roundabout Reverse: Silver
				17611,	-- Rocketway Ride Reverse: Silver
				17674,	-- Thousand Needles Thread Reverse: Silver
				17701,	-- Uldum Tour Reverse: Silver
				17710,	-- Un'Goro Crater Circuit Reverse: Silver
				17638,	-- Webwinder Weave Reverse: Silver
				17584,	-- Winter Wander Reverse: Silver
			}},
		}),
		ach(17720, {	-- Kalimdor Reverse: Gold
			-- Meta Achievement
			["sym"] = {{"meta_achievement",
				17693,	-- Ahn'Qiraj Circuit Reverse: Gold
				17621,	-- Ashenvale Ambit Reverse: Gold
				17648,	-- Desolace Drift Reverse: Gold
				17630,	-- Durotar Tour Reverse: Gold
				17576,	-- Felwood Flyover Reverse: Gold
				17684,	-- Feralas Ruins Ramble Reverse: Gold
				17657,	-- Great Divide Dive Reverse: Gold
				17603,	-- Hyjal Hotfoot Reverse: Gold
				17594,	-- Nordrassil Spiral Reverse: Gold
				17666,	-- Razorfen Roundabout Reverse: Gold
				17612,	-- Rocketway Ride Reverse: Gold
				17675,	-- Thousand Needles Thread Reverse: Gold
				17702,	-- Uldum Tour Reverse: Gold
				17711,	-- Un'Goro Crater Circuit Reverse: Gold
				17639,	-- Webwinder Weave Reverse: Gold
				17585,	-- Winter Wander Reverse: Gold
			}},
		}),
		ach(17721, {	-- Kalimdor Racing Completionist
			-- Meta Achievement
			["sym"] = {{"meta_achievement",
				17712,	-- Kalimdor: Bronze
				17715,	-- Kalimdor Advanced: Bronze
				17718,	-- Kalimdor Reverse: Bronze
			}},
		}),
		ach(17722, {	-- Kalimdor Racing Completionist: Silver
			-- Meta Achievement
			["sym"] = {{"meta_achievement",
				17713,	-- Kalimdor: Silver
				17716,	-- Kalimdor Advanced: Silver
				17719,	-- Kalimdor Reverse: Silver
			}},
		}),
		ach(17723, {	-- Kalimdor Racing Completionist: Gold
			-- Meta Achievement
			["sym"] = {{"meta_achievement",
				17714,	-- Kalimdor: Gold
				17717,	-- Kalimdor Advanced: Gold
				17720,	-- Kalimdor Reverse: Gold
			}},
			["g"] = {
				title(496),	-- Kalimdor Racer <Name>
			},
		}),
	}),
	n(QUESTS, {
		q(76429, {	-- The Kalimdor Cup Begins
			["provider"] = { "n", 199261 },	-- Holiday Enthusiast
			["coord"] = { 55.0, 37.7, VALDRAKKEN },
			["isBreadcrumb"] = true,
		}),
		q(76426, {	-- The Kalimdor Cup's Introduction
			["sourceQuests"] = { 76429 },	-- The Kalimdor Cup Begins
			["provider"] = { "n", 206737 },	-- Lord Andestrasz
			["coord"] = { 27.1, 47.1, VALDRAKKEN },
			["g"] = {
				currency(RIDERS_OF_AZEROTH_BADGE),
			},
		}),
		dragonridingrace(75472, {	-- Ahn'Qiraj Circuit
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, AHNQIRAJ_THE_FALLEN_KINGDOM },
			["g"] = {
				ach(17685),	-- Ahn'Qiraj Circuit: Bronze
				ach(17686),	-- Ahn'Qiraj Circuit: Silver
				ach(17687),	-- Ahn'Qiraj Circuit: Gold
			},
		}),
		dragonridingrace(75473, {	-- Ahn'Qiraj Circuit - Advanced
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, AHNQIRAJ_THE_FALLEN_KINGDOM },
			["g"] = {
				ach(17688),	-- Ahn'Qiraj Circuit Advanced: Bronze
				ach(17689),	-- Ahn'Qiraj Circuit Advanced: Silver
				ach(17690),	-- Ahn'Qiraj Circuit Advanced: Gold
			},
		}),
		dragonridingrace(75474, {	-- Ahn'Qiraj Circuit - Reverse
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, AHNQIRAJ_THE_FALLEN_KINGDOM },
			["g"] = {
				ach(17691),	-- Ahn'Qiraj Circuit Reverse: Bronze
				ach(17692),	-- Ahn'Qiraj Circuit Reverse: Silver
				ach(17693),	-- Ahn'Qiraj Circuit Reverse: Gold
			},
		}),
		dragonridingrace(75378, {	-- Ashenvale Ambit
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, ASHENVALE },
			["g"] = {
				ach(17613),	-- Ashenvale Ambit: Bronze
				ach(17614),	-- Ashenvale Ambit: Silver
				ach(17615),	-- Ashenvale Ambit: Gold
			},
		}),
		dragonridingrace(75379, {	-- Ashenvale Ambit - Advanced
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, ASHENVALE },
			["g"] = {
				ach(17616),	-- Ashenvale Ambit Advanced: Bronze
				ach(17617),	-- Ashenvale Ambit Advanced: Silver
				ach(17618),	-- Ashenvale Ambit Advanced: Gold
			},
		}),
		dragonridingrace(75380, {	-- Ashenvale Ambit - Reverse
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, ASHENVALE },
			["g"] = {
				ach(17619),	-- Ashenvale Ambit Reverse: Bronze
				ach(17620),	-- Ashenvale Ambit Reverse: Silver
				ach(17621),	-- Ashenvale Ambit Reverse: Gold
			},
		}),
		dragonridingrace(75409, {	-- Desolace Drift
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, DESOLACE },
			["g"] = {
				ach(17640),	-- Desolace Drift: Bronze
				ach(17641),	-- Desolace Drift: Silver
				ach(17642),	-- Desolace Drift: Gold
			},
		}),
		dragonridingrace(75410, {	-- Desolace Drift - Advanced
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, DESOLACE },
			["g"] = {
				ach(17643),	-- Desolace Drift Advanced: Bronze
				ach(17644),	-- Desolace Drift Advanced: Silver
				ach(17645),	-- Desolace Drift Advanced: Gold
			},
		}),
		dragonridingrace(75411, {	-- Desolace Drift - Reverse
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, DESOLACE },
			["g"] = {
				ach(17646),	-- Desolace Drift Reverse: Bronze
				ach(17647),	-- Desolace Drift Reverse: Silver
				ach(17648),	-- Desolace Drift Reverse: Gold
			},
		}),
		dragonridingrace(75385, {	-- Durotar Tour
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, DUROTAR },
			["g"] = {
				ach(17622),	-- Durotar Tour: Bronze
				ach(17623),	-- Durotar Tour: Silver
				ach(17624),	-- Durotar Tour: Gold
			},
		}),
		dragonridingrace(75386, {	-- Durotar Tour - Advanced
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, DUROTAR },
			["g"] = {
				ach(17625),	-- Durotar Tour Advanced: Bronze
				ach(17626),	-- Durotar Tour Advanced: Silver
				ach(17627),	-- Durotar Tour Advanced: Gold
			},
		}),
		dragonridingrace(75387, {	-- Durotar Tour - Reverse
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, DUROTAR },
			["g"] = {
				ach(17628),	-- Durotar Tour Reverse: Bronze
				ach(17629),	-- Durotar Tour Reverse: Silver
				ach(17630),	-- Durotar Tour Reverse: Gold
			},
		}),
		dragonridingrace(75277, {	-- Felwood Flyover
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, FELWOOD },
			["g"] = {
				ach(17568),	-- Felwood Flyover: Bronze
				ach(17569),	-- Felwood Flyover: Silver
				ach(17570),	-- Felwood Flyover: Gold
			},
		}),
		dragonridingrace(75293, {	-- Felwood Flyover - Advanced
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, FELWOOD },
			["g"] = {
				ach(17571),	-- Felwood Flyover Advanced: Bronze
				ach(17572),	-- Felwood Flyover Advanced: Silver
				ach(17573),	-- Felwood Flyover Advanced: Gold
			},
		}),
		dragonridingrace(75294, {	-- Felwood Flyover - Reverse
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, FELWOOD },
			["g"] = {
				ach(17574),	-- Felwood Flyover Reverse: Bronze
				ach(17575),	-- Felwood Flyover Reverse: Silver
				ach(17576),	-- Felwood Flyover Reverse: Gold
			},
		}),
		dragonridingrace(75468, {	-- Feralas Ruins Ramble
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, FERALAS },
			["g"] = {
				ach(17676),	-- Feralas Ruins Ramble: Bronze
				ach(17677),	-- Feralas Ruins Ramble: Silver
				ach(17678),	-- Feralas Ruins Ramble: Gold
			},
		}),
		dragonridingrace(75469, {	-- Feralas Ruins Ramble - Advanced
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, FERALAS },
			["g"] = {
				ach(17679),	-- Feralas Ruins Ramble Advanced: Bronze
				ach(17680),	-- Feralas Ruins Ramble Advanced: Silver
				ach(17681),	-- Feralas Ruins Ramble Advanced: Gold
			},
		}),
		dragonridingrace(75470, {	-- Feralas Ruins Ramble - Reverse
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, FERALAS },
			["g"] = {
				ach(17682),	-- Feralas Ruins Ramble Reverse: Bronze
				ach(17683),	-- Feralas Ruins Ramble Reverse: Silver
				ach(17684),	-- Feralas Ruins Ramble Reverse: Gold
			},
		}),
		dragonridingrace(75412, {	-- Great Divide Dive
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, SOUTHERN_BARRENS },
			["g"] = {
				ach(17649),	-- Great Divide Dive: Bronze
				ach(17650),	-- Great Divide Dive: Silver
				ach(17651),	-- Great Divide Dive: Gold
			},
		}),
		dragonridingrace(75413, {	-- Great Divide Dive - Advanced
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, SOUTHERN_BARRENS },
			["g"] = {
				ach(17652),	-- Great Divide Dive Advanced: Bronze
				ach(17653),	-- Great Divide Dive Advanced: Silver
				ach(17654),	-- Great Divide Dive Advanced: Gold
			},
		}),
		dragonridingrace(75414, {	-- Great Divide Dive - Reverse
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, SOUTHERN_BARRENS },
			["g"] = {
				ach(17655),	-- Great Divide Dive Reverse: Bronze
				ach(17656),	-- Great Divide Dive Reverse: Silver
				ach(17657),	-- Great Divide Dive Reverse: Gold
			},
		}),
		dragonridingrace(75330, {	-- Hyjal Hotfoot
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, MOUNT_HYJAL },
			["g"] = {
				ach(17595),	-- Hyjal Hotfoot: Bronze
				ach(17596),	-- Hyjal Hotfoot: Silver
				ach(17597),	-- Hyjal Hotfoot: Gold
			},
		}),
		dragonridingrace(75331, {	-- Hyjal Hotfoot - Advanced
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, MOUNT_HYJAL },
			["g"] = {
				ach(17598),	-- Hyjal Hotfoot Advanced: Bronze
				ach(17599),	-- Hyjal Hotfoot Advanced: Silver
				ach(17600),	-- Hyjal Hotfoot Advanced: Gold
			},
		}),
		dragonridingrace(75332, {	-- Hyjal Hotfoot - Reverse
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, MOUNT_HYJAL },
			["g"] = {
				ach(17601),	-- Hyjal Hotfoot Reverse: Bronze
				ach(17602),	-- Hyjal Hotfoot Reverse: Silver
				ach(17603),	-- Hyjal Hotfoot Reverse: Gold
			},
		}),
		dragonridingrace(75317, {	-- Nordrassil Spiral
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, MOUNT_HYJAL },
			["g"] = {
				ach(17586),	-- Nordrassil Spiral: Bronze
				ach(17587),	-- Nordrassil Spiral: Silver
				ach(17588),	-- Nordrassil Spiral: Gold
			},
		}),
		dragonridingrace(75318, {	-- Nordrassil Spiral - Advanced
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, MOUNT_HYJAL },
			["g"] = {
				ach(17589),	-- Nordrassil Spiral Advanced: Bronze
				ach(17590),	-- Nordrassil Spiral Advanced: Silver
				ach(17591),	-- Nordrassil Spiral Advanced: Gold
			},
		}),
		dragonridingrace(75319, {	-- Nordrassil Spiral - Reverse
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, MOUNT_HYJAL },
			["g"] = {
				ach(17592),	-- Nordrassil Spiral Reverse: Bronze
				ach(17593),	-- Nordrassil Spiral Reverse: Silver
				ach(17594),	-- Nordrassil Spiral Reverse: Gold
			},
		}),
		dragonridingrace(75437, {	-- Razorfen Roundabout
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, SOUTHERN_BARRENS },
			["g"] = {
				ach(17658),	-- Razorfen Roundabout: Bronze
				ach(17659),	-- Razorfen Roundabout: Silver
				ach(17660),	-- Razorfen Roundabout: Gold
			},
		}),
		dragonridingrace(75438, {	-- Razorfen Roundabout - Advanced
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, SOUTHERN_BARRENS },
			["g"] = {
				ach(17661),	-- Razorfen Roundabout Advanced: Bronze
				ach(17662),	-- Razorfen Roundabout Advanced: Silver
				ach(17663),	-- Razorfen Roundabout Advanced: Gold
			},
		}),
		dragonridingrace(75439, {	-- Razorfen Roundabout - Reverse
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, SOUTHERN_BARRENS },
			["g"] = {
				ach(17664),	-- Razorfen Roundabout Reverse: Bronze
				ach(17665),	-- Razorfen Roundabout Reverse: Silver
				ach(17666),	-- Razorfen Roundabout Reverse: Gold
			},
		}),
		dragonridingrace(75347, {	-- Rocketway Ride
			["provider"] = { "n", 203657 },	-- Bronze Timekeeper
			["coord"] = { 67.2, 26.2, AZSHARA },
			["g"] = {
				ach(17604),	-- Rocketway Ride: Bronze
				ach(17605),	-- Rocketway Ride: Silver
				ach(17606),	-- Rocketway Ride: Gold
			},
		}),
		dragonridingrace(75355, {	-- Rocketway Ride - Advanced
			["provider"] = { "n", 203657 },	-- Bronze Timekeeper
			["coord"] = { 67.2, 26.2, AZSHARA },
			["g"] = {
				ach(17607),	-- Rocketway Ride Advanced: Bronze
				ach(17608),	-- Rocketway Ride Advanced: Silver
				ach(17609),	-- Rocketway Ride Advanced: Gold
			},
		}),
		dragonridingrace(75356, {	-- Rocketway Ride - Reverse
			["provider"] = { "n", 203657 },	-- Bronze Timekeeper
			["coord"] = { 67.2, 26.2, AZSHARA },
			["g"] = {
				ach(17610),	-- Rocketway Ride Reverse: Bronze
				ach(17611),	-- Rocketway Ride Reverse: Silver
				ach(17612),	-- Rocketway Ride Reverse: Gold
			},
		}),
		dragonridingrace(75463, {	-- Thousand Needles Thread
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, THOUSAND_NEEDLES },
			["g"] = {
				ach(17667),	-- Thousand Needles Thread: Bronze
				ach(17668),	-- Thousand Needles Thread: Silver
				ach(17669),	-- Thousand Needles Thread: Gold
			},
		}),
		dragonridingrace(75464, {	-- Thousand Needles Thread - Advanced
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, THOUSAND_NEEDLES },
			["g"] = {
				ach(17670),	-- Thousand Needles Thread Advanced: Bronze
				ach(17671),	-- Thousand Needles Thread Advanced: Silver
				ach(17672),	-- Thousand Needles Thread Advanced: Gold
			},
		}),
		dragonridingrace(75465, {	-- Thousand Needles Thread - Reverse
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, THOUSAND_NEEDLES },
			["g"] = {
				ach(17673),	-- Thousand Needles Thread Reverse: Bronze
				ach(17674),	-- Thousand Needles Thread Reverse: Silver
				ach(17675),	-- Thousand Needles Thread Reverse: Gold
			},
		}),
		dragonridingrace(75481, {	-- Uldum Tour
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, ULDUM },
			["g"] = {
				ach(17694),	-- Uldum Tour: Bronze
				ach(17695),	-- Uldum Tour: Silver
				ach(17696),	-- Uldum Tour: Gold
			},
		}),
		dragonridingrace(75482, {	-- Uldum Tour - Advanced
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, ULDUM },
			["g"] = {
				ach(17697),	-- Uldum Tour Advanced: Bronze
				ach(17698),	-- Uldum Tour Advanced: Silver
				ach(17699),	-- Uldum Tour Advanced: Gold
			},
		}),
		dragonridingrace(75483, {	-- Uldum Tour - Reverse
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, ULDUM },
			["g"] = {
				ach(17700),	-- Uldum Tour Reverse: Bronze
				ach(17701),	-- Uldum Tour Reverse: Silver
				ach(17702),	-- Uldum Tour Reverse: Gold
			},
		}),
		dragonridingrace(75485, {	-- Un'Goro Crater Circuit
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, ULDUM },
			["g"] = {
				ach(17703),	-- Un'Goro Crater Circuit: Bronze
				ach(17704),	-- Un'Goro Crater Circuit: Silver
				ach(17705),	-- Un'Goro Crater Circuit: Gold
			},
		}),
		dragonridingrace(75486, {	-- Un'Goro Crater Circuit - Advanced
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, ULDUM },
			["g"] = {
				ach(17706),	-- Un'Goro Crater Circuit Advanced: Bronze
				ach(17707),	-- Un'Goro Crater Circuit Advanced: Silver
				ach(17708),	-- Un'Goro Crater Circuit Advanced: Gold
			},
		}),
		dragonridingrace(75487, {	-- Un'Goro Crater Circuit - Reverse
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, ULDUM },
			["g"] = {
				ach(17709),	-- Un'Goro Crater Circuit Reverse: Bronze
				ach(17710),	-- Un'Goro Crater Circuit Reverse: Silver
				ach(17711),	-- Un'Goro Crater Circuit Reverse: Gold
			},
		}),
		dragonridingrace(75394, {	-- Webwinder Weave
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, STONETALON_MOUNTAINS },
			["g"] = {
				ach(17631),	-- Webwinder Weave: Bronze
				ach(17632),	-- Webwinder Weave: Silver
				ach(17633),	-- Webwinder Weave: Gold
			},
		}),
		dragonridingrace(75395, {	-- Webwinder Weave - Advanced
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, STONETALON_MOUNTAINS },
			["g"] = {
				ach(17634),	-- Webwinder Weave Advanced: Bronze
				ach(17635),	-- Webwinder Weave Advanced: Silver
				ach(17636),	-- Webwinder Weave Advanced: Gold
			},
		}),
		dragonridingrace(75396, {	-- Webwinder Weave - Reverse
			--["provider"] = { "n", X },	-- Bronze Timekeeper
			--["coord"] = { X, Y, STONETALON_MOUNTAINS },
			["g"] = {
				ach(17637),	-- Webwinder Weave Reverse: Bronze
				ach(17638),	-- Webwinder Weave Reverse: Silver
				ach(17639),	-- Webwinder Weave Reverse: Gold
			},
		}),
		dragonridingrace(75310, {	-- Winter Wander
			["provider"] = { "n", 203605 },	-- Bronze Timekeeper
			["coord"] = { 68.8, 68.0, WINTERSPRING },
			["g"] = {
				ach(17577),	-- Winter Wander: Bronze
				ach(17578),	-- Winter Wander: Silver
				ach(17579),	-- Winter Wander: Gold
			},
		}),
		dragonridingrace(75311, {	-- Winter Wander - Advanced
			["provider"] = { "n", 203605 },	-- Bronze Timekeeper
			["coord"] = { 68.8, 68.0, WINTERSPRING },
			["g"] = {
				ach(17580),	-- Winter Wander Advanced: Bronze
				ach(17581),	-- Winter Wander Advanced: Silver
				ach(17582),	-- Winter Wander Advanced: Gold
			},
		}),
		dragonridingrace(75312, {	-- Winter Wander - Reverse
			["provider"] = { "n", 203605 },	-- Bronze Timekeeper
			["coord"] = { 68.8, 68.0, WINTERSPRING },
			["g"] = {
				ach(17583),	-- Winter Wander Reverse: Bronze
				ach(17584),	-- Winter Wander Reverse: Silver
				ach(17585),	-- Winter Wander Reverse: Gold
			},
		}),
	}),
	n(REWARDS, {
		currency(RIDERS_OF_AZEROTH_BADGE, {
			["description"] = "Gain one badge for each achievement.",
		}),
	}),
	n(VENDORS, {
		n(206744, {	-- Maztha <Riders of Azeroth>
			["coord"] = { 27.2, 47.2, VALDRAKKEN },
			["g"] = {
				i(197615, {	-- Windborne Velocidrake: Teal Scales (DM!)
					["cost"] = { { "c", RIDERS_OF_AZEROTH_BADGE, 30 } },
				}),
				i(206592, {	-- Drake Racer's Belt
					["cost"] = { { "c", RIDERS_OF_AZEROTH_BADGE, 15 } },
				}),
				i(206594, {	-- Drake Racer's Boots
					["cost"] = { { "c", RIDERS_OF_AZEROTH_BADGE, 15 } },
				}),
				i(206591, {	-- Drake Racer's Handwraps
					["cost"] = { { "c", RIDERS_OF_AZEROTH_BADGE, 15 } },
				}),
				i(206588, {	-- Drake Racer's Helmet
					["cost"] = { { "c", RIDERS_OF_AZEROTH_BADGE, 15 } },
				}),
				i(206590, {	-- Drake Racer's Jersey
					["cost"] = { { "c", RIDERS_OF_AZEROTH_BADGE, 15 } },
				}),
				i(206593, {	-- Drake Racer's Leggings
					["cost"] = { { "c", RIDERS_OF_AZEROTH_BADGE, 15 } },
				}),
				i(206589, {	-- Drake Racer's Shoulderpads
					["cost"] = { { "c", RIDERS_OF_AZEROTH_BADGE, 15 } },
				}),
			},
		}),
	}),
}))));