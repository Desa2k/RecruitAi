/*
 * Desa2k's Playhouse
 * https://discord.gg/3RCdgzDCzD
 */
 
d2kRecruitLocker = true;							// true = use pop tabs from locker, false = use pop tabs from wallet.
d2kAiHiX = 1.5;										// Multipier for High Skill pricing. Needs to be >= 1 
d2kAiMeX = 1;										// Multipier for Medium Skill pricing. Needs to be Left at 1 or pricing will not work correctly.
d2kAiLoX = 0.8;										// Multipier for low Skill pricing. Needs to be <=1
d2kRecruitVic = "B_Heli_Transport_03_unarmed_F";	// Classname of the vehicle to deliver The recruits. Needs to have cargo postions.
d2kTeamMaxSize = 18;								// Number of cargo postions availible in the deliver vehicle.
d2kRecruitVicHeight = 200;							// Height delivery vehicle will travel at.
d2kRecruitVicDis = 3000;							// Distance from player the deliver vehicle will spawn.
d2kRecruitPopTabs = 3000;							// Amout of pop tabs each recruit will have. Allows players to loot.
d2kRecruitList = 
	[
    //["UnitClassName",			Price],		// Units that can be recruited and their price.	
	["I_Soldier_AT_F",			30000],		// When selecting units to add, only pick units from the independent (green) side, otehrwise the units will attack eachother.
	["I_Soldier_AA_F",			30000],		// Also, when selecting a unit, pick ones that have a preview image in the editor, or they will not have on in the app.
	["B_soldier_LAT_F",			30000],	
	["O_T_Soldier_AA_F",		30000],

	["O_HeavyGunner_F",			20000],
	["B_HeavyGunner_F",			20000],
	["B_sniper_F",				20000],
	["I_Sniper_F",				20000],

	["B_Soldier_GL_F",			15000],
	["I_Soldier_M_F",			15000],
	["B_Patrol_Soldier_MG_F",	15000],

	["O_engineer_F",			10000],
	["O_soldier_M_F",			10000],
	["I_soldier_mine_F",		10000],
	["B_soldier_repair_F",		10000],
	["O_Sharpshooter_F",		10000],
	["B_Sharpshooter_F",		10000],
	["O_Soldier_TL_F",			10000],
	["B_Soldier_TL_F",			10000],
	["O_recon_JTAC_F",			10000],
	["O_V_Soldier_Medic_hex_F",	10000]
	];

d2kAiHighSill = // High Skill Settings
[
	1,	//aimingAccuracy
	1,	//aimingShake
	1,	//aimingSpeed
	1,	//spotDistance
	1,	//spotTime
	1,	//courage
	1,	//reloadSpeed
	1,	//commanding
	1	//general
];

d2kAiMediumSill = // Medium Skill Settings
[
	0.85,	//aimingAccuracy
	0.85,	//aimingShake
	0.85,	//aimingSpeed
	0.85,	//spotDistance
	0.85,	//spotTime
	0.85,	//courage
	0.85,	//reloadSpeed
	0.85,	//commanding
	0.85	//general
];

d2kAiLowSill = // Low Skill Settings
[
	0.70,	//aimingAccuracy
	0.70,	//aimingShake
	0.70,	//aimingSpeed
	0.70,	//spotDistance
	0.70,	//spotTime
	0.70,	//courage
	0.70,	//reloadSpeed
	0.70,	//commanding
	0.70	//general
];

////////////////////////////////
//*DO*NOT*EDIT*BELOW*THIS*LINE//
////////////////////////////////

d2kTeamPrice = 0;
d2kOldMultiplier = 1;