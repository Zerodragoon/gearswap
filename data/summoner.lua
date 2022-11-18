include('organizer-lib')
include('custom_functions.lua')

-- Summoner Gearswap Lua by Pergatory - http://pastebin.com/u/pergatory
-- IdleMode determines the set used after casting. You change it with "/console gs c <IdleMode>"
-- The modes are:
-- Refresh: Uses the most refresh available.
-- DT: A mix of refresh, PDT, and MDT to help when you can't avoid AOE.
-- PetDT: Sacrifice refresh to reduce avatar's damage taken. WARNING: Selenian Cap drops you below 119, use with caution!
-- DD: When melee mode is on and you're engaged, uses TP gear. Otherwise, avatar melee gear.
-- Favor: Uses Beckoner's Horn +1 and max smn skill to boost the favor effect.
-- Zendik: Favor build with the Zendik Robe added in, for Shiva's Favor in manaburn parties. (Shut up, it sounded like a good idea at the time)

-- Additional Bindings:
-- F9 - Toggles between a subset of IdleModes (Refresh > DT > PetDT)
-- F10 - Toggles MeleeMode (When enabled, equips Nirvana and Elan+1, then disables those 2 slots from swapping)
--       NOTE: If you don't already have the Nirvana & Elan+1 equipped, YOU WILL LOSE TP

-- Additional Commands:
-- /console gs c AccMode - Toggles high-accuracy sets to be used where appropriate.
-- /console gs c ImpactMode - Toggles between using normal magic BP set for Fenrir's Impact or a custom high-skill set for debuffs.
-- /console gs c ForceIlvl - I have this set up to override a few specific slots where I normally use non-ilvl pieces.
-- /console gs c TH - Treasure Hunter toggle. By default, this is only used for Dia, Dia II, and Diaga.
-- /console gs c LagMode - Used to help BPs land in the right gear in high-lag situations.
--							Sets a timer to swap gear 0.5s after the BP is used rather than waiting for server response.

function file_unload()
	send_command('input //lua u nostrum')
end

function get_sets()

	send_command('input //gs org; wait 1;input //lua l nostrum; wait 1;input //nos profile summoner')


	-- Set your merits here. This is used in deciding between Enticer's Pants or Apogee Slacks +1.
	-- To change in-game, "/console gs c MeteorStrike3" will change Meteor Strike to 3/5 merits.
	-- The damage difference is very minor unless you're over 2400 TP.
	-- It's ok to just always use Enticer's Pants and ignore this section.
	MeteorStrike = 3
	HeavenlyStrike = 1
	WindBlade = 1
	Geocrush = 1
	Thunderstorm = 3
	GrandFall = 1

	StartLockStyle = '13'
	IdleMode = 'Refresh'
	AccMode = false
	ImpactDebuff = false
	MeleeMode = false
	TreasureHunter = false
	THSpells = S{"Dia","Dia II","Diaga"} -- If you want Treasure Hunter gear to swap for a spell/ability, add it here.
	ForceIlvl = false
	LagMode = false -- Default LagMode. If you have a lot of lag issues, change to "true".
	AutoRemedy = false -- Auto Remedy when using an ability while Paralyzed.
	AutoEcho = false -- Auto Echo Drop when using an ability while Silenced.
	SacTorque = true -- If you have Sacrifice Torque, this will auto-equip it when slept in order to wake up.

	-- ===================================================================================================================
	--		Sets
	-- ===================================================================================================================

	-- Base Damage Taken Set - Mainly used when IdleMode is "DT"
	sets.DT_Base = {
		main="Nirvana",
		sub="Khonsu",
		head="Beckoner's Horn +2", --Beckoner's Horn +3
		body="Inyanga Jubbah +2", --Beckoner's Doublet +3
		hands="Inyanga Dastanas +2",
		legs="Assiduity Pants +1",
		feet="Inyanga Crackows +2",
		neck="Loricate Torque +1",
		left_ring="Warden's Ring",
		ring2="Defending Ring",
		back="Moonlight Cape",
		waist="Lucidity Sash",
		left_ear="Ethereal Earring",
    	right_ear="Infused Earring",
		ammo="Sancus Sachet +1"
	}

	-- Treasure Hunter set. Don't put anything in here except TH+ gear.
	-- It overwrites slots in other sets when TH toggle is on (Ctrl+F10).
	sets.TH = {

	}

	sets.precast = {}

	-- Fast Cast
	sets.precast.FC = {
		ammo="Sapience Orb",
		head={ name="Merlinic Hood", augments={'"Fast Cast"+7','CHR+6','Mag. Acc.+6','"Mag.Atk.Bns."+14',}}, --15
		body="Shango Robe", --8
		hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+28','"Fast Cast"+7','INT+7',}}, --7
		legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+9','"Fast Cast"+7','MND+1','Mag. Acc.+15',}}, --7
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7',}}, --12
		neck="Baetyl Pendant", --4
		left_ear="Malignance Earring", --4
		right_ear="Loquac. Earring", --2
		left_ring="Kishar Ring", --4
		right_ring="Weatherspoon Ring +1", --5 --3
		back="Fi Follet Cape +1", --10
		waist="Witful Belt", --3 --3
	} --83

	sets.precast["Dispelga"] = set_combine(sets.precast.FC, {
		main="Daybreak",
		sub="Ammurapi Shield"
	})

    sets.midcast = {}

	-- BP Timer Gear
	-- Use BP Recast Reduction here, along with Avatar's Favor gear.
	-- Avatar's Favor skill tiers are 512 / 575 / 670.
    sets.midcast.BP = {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +2", -- Always use Beckoner's Horn here. If you don't have it, quit SMN in shame until you make it.
		neck="Incanter's Torque",
		ear1="Cath Palug Earring",
		ear2="Lodurr Earring",
		body="Baayami Robe +1",
		hands="Baayami Cuffs +1",
		ring1="Stikini Ring +1",
		ring2="Evoker's Ring",
		back="Conveyance Cape",
		waist="Kobo Obi",
		legs="Baayami Slops +1",
		feet="Baayami Sabots +1"
	}

	-- Elemental Siphon sets. Zodiac Ring is affected by day, Chatoyant Staff by weather, and Twilight Cape by both.
    sets.midcast.Siphon = {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Vox Grip",
		ammo="Esper Stone +1",
		head="Baayami Hat +1",
		neck="Incanter's Torque",
		ear1="Cath Palug Earring",
		ear2="Lodurr Earring",
		body="Baayami Robe +1",
		hands="Baayami Cuffs +1",
		ring1="Stikini Ring +1",
		ring2="Evoker's Ring",
		back="Conveyance Cape",
		waist="Kobo Obi",
		legs="Baayami Slops +1",
		feet="Beckoner's Pigaches +1"
	}

	sets.midcast.SiphonZodiac = set_combine(sets.midcast.Siphon, {})

	sets.midcast.SiphonWeather = set_combine(sets.midcast.Siphon, { })
	
	sets.midcast.SiphonWeatherZodiac = set_combine(sets.midcast.SiphonZodiac, {  })

	-- Summoning Midcast, cap spell interruption if possible (Baayami Robe gives 100, need 2 more)
	-- PDT isn't a bad idea either, so don't overwrite a lot from the DT set it inherits from.
	sets.midcast.Summon = set_combine(sets.DT_Base, {
		body="Baayami Robe +1",
		waist="Rumination Sash"
	})

	-- If you ever lock your weapon, keep that in mind when building cure potency set.
	sets.midcast.Cure = {
		main="Daybreak",
		sub="Sors Shield",
		head="Convoker's Horn +3",
		body="Inyanga Jubbah +2", 
		legs="Assiduity Pants +1",
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10'}},
		feet="Vanya Clogs",
		neck="Incanter's Torque",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Oretania's Cape +1",
		waist="Rumination Sash",
	}

	sets.midcast.Cursna = set_combine(sets.precast.FC, {
		feet="Vanya Clogs",
	--	neck="Debilis Medallion",
	--	ring1="Haoma's Ring",
	--	ring2="Haoma's Ring",
		back="Oretania's Cape +1"
	})
	
	-- Just a standard set for spells that have no set
	sets.midcast.EnmityRecast = set_combine(sets.precast.FC, {	
		main="Nirvana",
		
	})

	-- Strong alternatives: Daybreak and Ammurapi Shield, Cath Crown, Gwati Earring
	sets.midcast.Enfeeble = {
		main="Daybreak",
		sub="Ammurapi Shield",
		neck="Incanter's Torque",
		ear1="Malignance Earring",
		ear2="Dignitary's Earring",
		right_ear="Hecate's Earring",
		head="Cath Palug Crown",
		body="Cohort Cloak +1",
		hands="Inyanga Dastanas +2",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Izdubar Mantle",
		waist="Luminary Sash",
		legs="Inyanga Shalwar +2",
		feet="Medium's Sabots"
	}

	sets.midcast.Enhancing = {
		main="Gada",
		sub="Ammurapi Shield",
		neck="Incanter's Torque",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chasuble", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		back="Fi Follet Cape +1",
		waist="Embla Sash",
		ear1="Mimir Earring",
		ear2="Andoaa Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
	}

	sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing, {
		neck="Nodens Gorget",
		ear2="Earthcry Earring",
		waist="Siegel Sash",
		legs="Shedir Seraweels"
	})

	sets.midcast.Nuke = {
		head="Cath Palug Crown",
		body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1",
		neck="Baetyl Pendant",
		waist="Eschan Stone",
		left_ear="Malignance Earring",
		right_ear="Hecate's Earring",
		left_ring="Freke Ring",
		right_ring="Weatherspoon Ring +1",
		back="Izdubar Mantle",
	}

    sets.midcast["Refresh"] = set_combine(sets.midcast.Enhancing, {
		head="Amalric Coif +1",
		waist="Gishdubar Sash"
	})

    sets.midcast["Aquaveil"] = set_combine(sets.midcast.Enhancing, {
		head="Amalric Coif +1"
	})

	sets.midcast["Mana Cede"] = { hands = "Beckoner's Bracers +1" }

    sets.midcast["Astral Flow"] = { head="Glyphic Horn +1" }
	
	-- ===================================================================================================================
	--	Weaponskills
	-- ===================================================================================================================

	-- I stack magic accuracy here to land the defense down effect, rather than MAB for damage.
	-- It's a personal preference, use whatever you prefer.
	sets.midcast["Garland of Bliss"] = sets.midcast.Nuke

	-- My set focuses on accuracy here to make skillchains with Ifrit
	-- Just like Garland, it's not hard to improve on the damage from this set if that's what you're after.
	sets.midcast["Shattersoul"] =sets.midcast.Nuke

	sets.midcast["Cataclysm"] = sets.midcast.Nuke

	sets.pet_midcast = {}

	-- Main physical pact set (Volt Strike, Pred Claws, etc.)
	-- Prioritize BP Damage & Pet: Double Attack
	-- Strong Alternatives:
	-- Gridarvor, Apogee Crown, Apogee Pumps, Convoker's Doublet, Apogee Dalmatica, Shulmanu Collar (equal to ~R15 Collar), Gelos Earring, Regal Belt
	sets.pet_midcast.Physical_BP = {
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}}, -- Helios Band - Attack, Dbl. Attack, Blood Pact Damage
		neck="Summoner's Collar +2", -- Summoner's Collar
		ear1="Lugalbanda Earring",
		ear2="Kyrene's Earring",
		body="Glyphic Doublet +3", --Relic Body +3
		hands={ name="Apogee Mitts +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}}, --Convert to full Melee Damage
		ring1="Cath Palug Ring", 
		ring2="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
		waist="Incarnation Sash",
		legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}}, --Covert to DBL Attack
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}} -- Helios Boots Att, Dbl Atk, Blood Pact Damage
	}

	-- Physical Pact AM3 set, less emphasis on Pet:DA
	sets.pet_midcast.Physical_BP_AM3 = set_combine(sets.pet_midcast.Physical_BP, {
		ring1="Varar Ring +1",
		body="Apogee Dalmatica +1", -- AF Body +3
		ear2="Beckoner's Earring +1", --Beckoner's Earring +2
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}} --Convert to full Melee
	})

	-- Physical pacts which benefit more from TP than Pet:DA (like Spinning Dive and other pacts you never use except that one time)
	sets.pet_midcast.Physical_BP_TP = set_combine(sets.pet_midcast.Physical_BP, {
		ring1="Varar Ring +1",
		ear2="Beckoner's Earring +1", --Beckoner's Earring +2
		waist="Regal Belt",
		head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}}, -- Convert to full melee
		body="Apogee Dalmatica +1",
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}} -- Conver to full melee
	})

	-- Used for all physical pacts when AccMode is true
	sets.pet_midcast.Physical_BP_Acc = set_combine(sets.pet_midcast.Physical_BP, {
		head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}}
	})

	-- Base magic pact set
	-- Prioritize BP Damage & Pet:MAB
	-- Strong Alternatives:
	-- Espiritus, Apogee Crown, Adad Amulet (equal to ~R12 Collar)
	sets.pet_midcast.Magic_BP_Base = {
		main="Grioavolr",
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="Cath Palug Crown",
		neck="Summoner's Collar +2",
		ear1="Lugalbanda Earring",
		ear2="Beckoner's Earring +1", --Beckoner's Earring +2
		body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}, --Convert to full magic damage
		hands={ name="Apogee Mitts +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}, -- Full magic damage
		ring1="Varar Ring +1",
		ring2="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20'}},
		waist="Regal Belt",
		legs="Enticer's Pants", -- Enticer's Pants
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}
	}
	
	-- Some magic pacts benefit more from TP than others.
	-- Note: This set will only be used on merit pacts if you have less than 4 merits.
	--       Make sure to update your merit values at the top of this Lua.
	sets.pet_midcast.Magic_BP_TP = set_combine(sets.pet_midcast.Magic_BP_Base, {
		--Enticer's Pants
	})

	-- NoTP set used when you don't need Enticer's
	sets.pet_midcast.Magic_BP_NoTP = set_combine(sets.pet_midcast.Magic_BP_Base, {
		legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}
	})

	sets.pet_midcast.Magic_BP_TP_Acc = set_combine(sets.pet_midcast.Magic_BP_TP, {
		--Body AF+3
	})

	sets.pet_midcast.Magic_BP_NoTP_Acc = set_combine(sets.pet_midcast.Magic_BP_NoTP, {
		--Body AF+3
	})

	-- Favor BP Damage above all. Pet:MAB also very strong.
	-- Pet: Accuracy, Attack, Magic Accuracy moderately important.
	-- Strong Alternatives:
	-- Keraunos, Grioavolr, Espiritus, Was, Apogee Crown, Apogee Dalmatica, Adad Amulet
	sets.pet_midcast.FlamingCrush = set_combine(sets.pet_midcast.Magic_BP_Base, {
		main="Nirvana",
		--Body AF+3
		--Nirvana
	})
		
	sets.pet_midcast.FlamingCrush_Acc = set_combine(sets.pet_midcast.FlamingCrush, {
		
	})

	-- Pet: Magic Acc set - Mainly used for debuff pacts like Shock Squall
	sets.pet_midcast.MagicAcc_BP = {
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="Cath Palug Crown",
		neck="Summoner's Collar +2",
		ear1="Lugalbanda Earring",
		ear2="Beckoner's Earring +1",
		body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}, -- AF Body +3
		hands={ name="Apogee Mitts +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}, --Magic Apogee Hands
		ring1="Varar Ring +1",
		ring2="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20'}},
		waist="Regal Belt",
		legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}, --Magic Pants
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}} -- Magic Feet
	}

	sets.pet_midcast.Debuff_Rage = sets.pet_midcast.MagicAcc_BP

	-- Pure summoning magic set, mainly used for buffs like Hastega II.
	-- Strong Alternatives:
	-- Andoaa Earring, Summoning Earring, Lamassu Mitts +1, Caller's Pendant
	sets.pet_midcast.SummoningMagic = {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head="Baayami Hat +1",
		neck="Incanter's Torque",
		ear1="Cath Palug Earring",
		ear2="Lodurr Earring",
		body="Baayami Robe +1",
		hands="Baayami Cuffs +1",
		ring1="Stikini Ring +1",
		ring2="Evoker's Ring",
		back="Conveyance Cape",
		waist="Kobo Obi",
		legs="Baayami Slops +1",
		feet="Baayami Sabots +1"
	}

	sets.pet_midcast.Buff = sets.pet_midcast.SummoningMagic
	
	-- Wind's Blessing set. Pet:MND increases potency.
	sets.pet_midcast.Buff_MND = set_combine(sets.pet_midcast.Buff, {
		main="Nirvana",
		neck="Summoner's Collar +2",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20'}},
		legs="Assiduity Pants +1",
	})

	-- Don't drop Avatar level in this set if you can help it.
	-- You can use Avatar:HP+ gear to increase the HP recovered, but most of it will decrease your own max HP.
	sets.pet_midcast.Buff_Healing = set_combine(sets.pet_midcast.Buff, {
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="Cath Palug Crown",
		neck="Summoner's Collar +2",
		ear1="Lugalbanda Earring",
		ear2="Beckoner's Earring +1",
		body="Apogee Dalmatica +1",
		hands="Apogee Mitts +1",
		ring1="Varar Ring +1",
		ring2="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20'}},
		waist="Regal Belt",
		legs="Apogee Slacks +1",
		feet="Apogee Pumps +1"
	})

	-- This set is used for certain blood pacts when ImpactDebuff mode is turned ON. (/console gs c ImpactDebuff)
	-- These pacts are normally used with magic damage gear, but they're also strong debuffs when enhanced by summoning skill.
	-- This set is safe to ignore.
	sets.pet_midcast.Impact = set_combine(sets.pet_midcast.SummoningMagic, {
		main="Nirvana",
		head="Convoker's Horn +3",
		ear1="Lugalbanda Earring"
	})

	sets.aftercast = {}

	-- Idle set with no avatar out.
	sets.aftercast.Idle = {
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="Convoker's Horn +3",
		neck="Loricate Torque +1",
		ear1="Cath Palug Earring",
		ear2="Moonshade Earring",
		body="Amalric Doublet +1",
		hands="Inyanga Dastanas +2",
		ring1="Stikini Ring +1",
		ring2="Defending Ring",
		back="Moonlight Cape",
		waist="Regal Belt",
		legs="Assiduity Pants +1",
		feet="Herald's Gaiters"
	}
	
	-- Idle set used when ForceIlvl is ON. Use this mode to avoid Gaiters dropping ilvl.
	sets.aftercast.Idle_Ilvl = set_combine(sets.aftercast.Idle, {
		feet="Baayami Sabots +1"
	})
	
	sets.aftercast.DT = sets.DT_Base

	-- Main refresh set - Many idle sets inherit from this set.
	-- Put common items here so you don't have to repeat them over and over.
	-- Strong Alternatives:
	-- Gridarvor, Asteria Mitts, Shomonjijoe, Beckoner's Horn, Evans Earring, Isa Belt
	sets.aftercast.Perp_Base = {
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +2", --Beckoner's Horn +3
		neck="Caller's Pendant", 
		ear1="Cath Palug Earring", 
		ear2="Enmerkar Earring", 
		body="Apogee Dalmatica +1", --Beckoner's Doublet +3
		hands="Apogee Mitts +1",
		ring1="Stikini Ring +1",
		ring2="Evoker's Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
		waist="Lucidity Sash",
		legs="Assiduity Pants +1",
		feet="Baayami Sabots +1"
	}

	-- Avatar Melee set. Equipped when IdleMode is "DD" and MeleeMode is OFF.
	-- You really don't need this set. It's only here because I can't bring myself to throw it away.
	sets.aftercast.Perp_DD = set_combine(sets.aftercast.Perp_Base, {
		
	})

	-- Refresh set with avatar out. Equipped when IdleMode is "Refresh".
	sets.aftercast.Perp_Refresh = set_combine(sets.aftercast.Perp_Base, {
	})

	-- Refresh set when MP is under 50%
	-- If you have Fucho and don't need Lucidity Sash for perp down, you can uncomment the belt here to enable using it.
	sets.aftercast.Perp_RefreshSub50 = set_combine(sets.aftercast.Perp_Refresh, {
		waist="Fucho-no-obi"
	})
	
	-- Used when IdleMode is "Favor" to maximize avatar's favor effect.
	-- Skill tiers are 512 / 575 / 670
	sets.aftercast.Perp_Favor = set_combine(sets.aftercast.Perp_Refresh, {
		main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
		sub="Vox Grip",
		head="Beckoner's Horn +2", --Horn +3
		hands="Baayami Cuffs +1",
		feet="Baayami Sabots +1", --Legs Beckoner's Spats +3
        ear2="Lodurr Earring",
        ring1="Stikini Ring +1",
        ring2="Evoker's Ring",
        
	})

	sets.aftercast.Perp_Zendik = set_combine(sets.aftercast.Perp_Favor, {
		
	})

	-- TP set. Equipped when IdleMode is "DD" and MeleeMode is ON.
	sets.aftercast.Perp_Melee = set_combine(sets.aftercast.Perp_Refresh, {
		head="Nyame Helm",								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Shulmanu Collar",
		ear1="Telos Earring",
		ear2="Sroda Earring",
		ring1="Crepuscular Ring",
		ring2="Petrov Ring",
		waist="Windbuffet Belt +1"
	})

	-- Pet:DT build. Equipped when IdleMode is "PetDT". Note: Avatars only need -31 PDT to cap, MDT is the hard one to cap.
	-- Strong alternatives:
	-- Selenian Cap, Enmerkar Earring, Handler's Earring, Rimeice Earring, Thurandaut Ring, Tali'ah Seraweels
	sets.aftercast.Avatar_DT = set_combine(sets.aftercast.Perp_Refresh, {
		main="Espiritus",
		sub="Khonsu",
		waist="Isa Belt",
		legs="Enticer's Pants",
		ear2="Rimeice Earring",
		ear1="Enmerkar Earring",
		ring2="Defending Ring",
		neck="Summoner's Collar +2"
	})

	-- Perp down set used when ForceIlvl is ON. If you use Selenian Cap for Pet:DT, you can make another set here without it.
	sets.aftercast.Avatar_DT_Ilvl = set_combine(sets.aftercast.Avatar_DT, {
	})

	-- DT build with avatar out. Equipped when IdleMode is "DT".
	sets.aftercast.Perp_DT = set_combine(sets.DT_Base, {
		
	})

	-- Idle set used when you have a spirit summoned. Glyphic Spats will make them cast more frequently.
	sets.aftercast.Spirit = {
		main="Nirvana",
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head="Convoker's Horn +3",
		neck="Incanter's Torque",
		ear1="Cath Palug Earring",
		body="Baayami Robe +1",
		hands="Baayami Cuffs +1",
		ring1={name="Stikini Ring +1", bag="wardrobe2"},
		ring2="Evoker's Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
		legs="Baayami Slops +1",
		waist="Lucidity Sash",
		feet="Baayami Sabots +1"
	}

	-- ===================================================================================================================
	--		End of Sets
	-- ===================================================================================================================

	Buff_BPs_Duration = S{'Shining Ruby','Aerial Armor','Frost Armor','Rolling Thunder','Crimson Howl','Lightning Armor','Ecliptic Growl','Glittering Ruby','Earthen Ward','Hastega','Noctoshield','Ecliptic Howl','Dream Shroud','Earthen Armor','Fleet Wind','Inferno Howl','Heavenward Howl','Hastega II','Soothing Current','Crystal Blessing','Katabatic Blades'}
	Buff_BPs_Healing = S{'Healing Ruby','Healing Ruby II','Whispering Wind','Spring Water'}
	Buff_BPs_MND = S{"Wind's Blessing"}
	Debuff_BPs = S{'Mewing Lullaby','Eerie Eye','Lunar Cry','Lunar Roar','Nightmare','Pavor Nocturnus','Ultimate Terror','Somnolence','Slowga','Tidal Roar','Diamond Storm','Sleepga','Shock Squall','Bitter Elegy','Lunatic Voice'}
	Debuff_Rage_BPs = S{'Moonlit Charge','Tail Whip'}

	Magic_BPs_NoTP = S{'Holy Mist','Nether Blast','Aerial Blast','Searing Light','Diamond Dust','Earthen Fury','Zantetsuken','Tidal Wave','Judgment Bolt','Inferno','Howling Moon','Ruinous Omen','Night Terror','Thunderspark','Tornado II','Sonic Buffet'}
	Magic_BPs_TP = S{'Impact','Conflag Strike','Level ? Holy','Lunar Bay'}
	Merit_BPs = S{'Meteor Strike','Geocrush','Grand Fall','Wind Blade','Heavenly Strike','Thunderstorm'}
	Physical_BPs_TP = S{'Rock Buster','Mountain Buster','Crescent Fang','Spinning Dive','Roundhouse'}
	
	ZodiacElements = S{'Fire','Earth','Water','Wind','Ice','Lightning'}

	--TownIdle = S{"windurst woods","windurst waters","windurst walls","port windurst","bastok markets","bastok mines","port bastok","southern san d'oria","northern san d'oria","port san d'oria","upper jeuno","lower jeuno","port jeuno","ru'lude gardens","norg","kazham","tavnazian safehold","rabao","selbina","mhaura","aht urhgan whitegate","al zahbi","nashmau","western adoulin","eastern adoulin"}
	--Salvage = S{"Bhaflau Remnants","Zhayolm Remnants","Arrapago Remnants","Silver Sea Remnants"}

	-- Select initial macro set and set lockstyle
	-- This section likely requires changes or removal if you aren't Pergatory
	-- Note: This doesn't change your macro set for you during play, your macros have to do that. This is just for when the Lua is loaded.
	if pet.isvalid then
		if pet.name=='Fenrir' then
			send_command('input /macro book 11;wait .1;input /macro set 4;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Ifrit' then
			send_command('input /macro book 11;wait .1;input /macro set 5;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Titan' then
			send_command('input /macro book 11;wait .1;input /macro set 6;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Leviathan' then
			send_command('input /macro book 11;wait .1;input /macro set 7;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Garuda' then
			send_command('input /macro book 11;wait .1;input /macro set 8;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Shiva' then
			send_command('input /macro book 11;wait .1;input /macro set 3;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Ramuh' then
			send_command('input /macro book 11;wait .1;input /macro set 3;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Diabolos' then
			send_command('input /macro book 11;wait .1;input /macro set 10;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Cait Sith' then
			send_command('input /macro book 11;wait .1;input /macro set 2;wait 3;input /lockstyleset '..StartLockStyle)
		elseif pet.name=='Siren' then
			send_command('input /macro book 11;wait .1;input /macro set 9;wait 3;input /lockstyleset '..StartLockStyle)
		end
	else
		send_command('input /macro book 11;wait .1;input /macro set 1;wait 3;input /lockstyleset '..StartLockStyle)
	end
	
	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')
	-- End macro set / lockstyle section
end

-- ===================================================================================================================
--		Gearswap rules below this point - Modify at your own peril
-- ===================================================================================================================

function pretarget(spell,action)
	if not buffactive['Muddle'] then
		-- Auto Remedy --
		if AutoRemedy and (spell.action_type == 'Magic' or spell.type == 'JobAbility') then
			if buffactive['Paralysis'] or (buffactive['Silence'] and not AutoEcho) then
				cancel_spell()
				send_command('input /item "Remedy" <me>')
			end
		end
		-- Auto Echo Drop --
		if AutoEcho and spell.action_type == 'Magic' and buffactive['Silence'] then
			cancel_spell()
			send_command('input /item "Echo Drops" <me>')
		end
	end
end

function precast(spell)
    if (pet.isvalid and pet_midaction() and not spell.type=="SummonerPact") or spell.type=="Item" then
		-- Do not swap if pet is mid-action. I added the type=SummonerPact check because sometimes when the avatar
		-- dies mid-BP, pet.isvalid and pet_midaction() continue to return true for a brief time.
		return
	end
	-- Spell fast cast
	if sets.precast[spell.english] then
        equip(sets.precast[spell.english])
    elseif spell.action_type=="Magic" then
		if spell.name=="Stoneskin" then
			equip(sets.precast.FC,{waist="Siegel Sash"})
		else
			equip(sets.precast.FC)
		end
    end
end

function midcast(spell)
    if (pet.isvalid and pet_midaction()) or spell.type=="Item" then
        return
    end
	-- BP Timer gear needs to swap here
	if (spell.type=="BloodPactWard" or spell.type=="BloodPactRage") then
		if not buffactive["Astral Conduit"] then
			equip(sets.midcast.BP)
		end
		-- If lag compensation mode is on, set up a timer to equip the BP gear.
		if LagMode then
			send_command('wait 0.5;gs c EquipBP '..spell.name)
		end
	-- Spell Midcast & Potency Stuff
    elseif sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
	elseif spell.name=="Elemental Siphon" then
		if pet.element==world.day_element and ZodiacElements:contains(pet.element) then
			if pet.element==world.weather_element then
				equip(sets.midcast.SiphonWeatherZodiac)
			else
				equip(sets.midcast.SiphonZodiac)
			end
		else
			if pet.element==world.weather_element then
				equip(sets.midcast.SiphonWeather)
			else
				equip(sets.midcast.Siphon)
			end
		end
	elseif spell.type=="SummonerPact" then
		equip(sets.midcast.Summon)
	elseif string.find(spell.name,"Cure") or string.find(spell.name,"Curaga") then
		equip(sets.midcast.Cure)
	elseif string.find(spell.name,"Protect") or string.find(spell.name,"Shell") then
		equip(sets.midcast.Enhancing,{ring2="Sheltered Ring"})
	elseif spell.skill=="Enfeebling Magic" then
		equip(sets.midcast.Enfeeble)
	elseif spell.skill=="Enhancing Magic" then
		equip(sets.midcast.Enhancing)
	elseif spell.skill=="Elemental Magic" then
		equip(sets.midcast.Nuke)
	elseif spell.action_type=="Magic" then
		equip(sets.midcast.EnmityRecast)
    else
        idle()
    end
	-- Treasure Hunter
	if THSpells:contains(spell.name) then
		equip(sets.TH)
	end
	-- Auto-cancel existing buffs
	if spell.name=="Stoneskin" and buffactive["Stoneskin"] then
		windower.send_command('cancel 37;')
	elseif spell.name=="Sneak" and buffactive["Sneak"] and spell.target.type=="SELF" then
		windower.send_command('cancel 71;')
	elseif spell.name=="Utsusemi: Ichi" and buffactive["Copy Image"] then
		windower.send_command('wait 1;cancel 66;')
	end
end

function aftercast(spell)
    if pet_midaction() or spell.type=="Item" then
        return
    end
	if not string.find(spell.type,"BloodPact") then
        idle()
    end
end

function pet_change(pet,gain)
	if (not (gain and pet_midaction())) then
		idle()
	end
end

function status_change(new,old)
	if new=="Idle" then
        idle()
	end
end

function buff_change(name,gain)
    if name=="quickening" then
        idle()
    end
	if SacTorque and name=="sleep" and gain and pet.isvalid then
		equip({neck="Sacrifice Torque"})
		disable("neck")
		if buffactive["Stoneskin"] then
			windower.send_command('cancel 37;')
		end
	end
	if name=="sleep" and not gain then
		enable("neck")
	end
	if name == "doom" then
        if gain then
            equip(sets.HolyWater)
            disable('neck','ring1','waist')
        else
            enable('neck','ring1','waist') 
        end
    end
end

function pet_midcast(spell)
	if not LagMode then
		equipBPGear(spell.name)
	end
end

function pet_aftercast(spell)
    idle()
end

function equipBPGear(spell)
    if spell=="Perfect Defense" then
        equip(sets.pet_midcast.SummoningMagic)
	elseif Debuff_BPs:contains(spell) then
		equip(sets.pet_midcast.MagicAcc_BP)
	elseif Buff_BPs_Healing:contains(spell) then
		equip(sets.pet_midcast.Buff_Healing)
	elseif Buff_BPs_Duration:contains(spell) then
		equip(sets.pet_midcast.Buff)
	elseif Buff_BPs_MND:contains(spell) then
		equip(sets.pet_midcast.Buff_MND)
	elseif spell=="Flaming Crush" then
		if AccMode then
			equip(sets.pet_midcast.FlamingCrush_Acc)
		else
			equip(sets.pet_midcast.FlamingCrush)
		end
	elseif ImpactDebuff and (spell=="Impact" or spell=="Conflag Strike") then
		equip(sets.pet_midcast.Impact)
	elseif Magic_BPs_NoTP:contains(spell) then
		if AccMode then
			equip(sets.pet_midcast.Magic_BP_NoTP_Acc)
		else
			equip(sets.pet_midcast.Magic_BP_NoTP)
		end
	elseif Magic_BPs_TP:contains(spell) or string.find(spell," II") or string.find(spell," IV") then
		if AccMode then
			equip(sets.pet_midcast.Magic_BP_TP_Acc)
		else
			equip(sets.pet_midcast.Magic_BP_TP)
		end
	elseif Merit_BPs:contains(spell) then
		if AccMode then
			equip(sets.pet_midcast.Magic_BP_TP_Acc)
		elseif spell=="Meteor Strike" and MeteorStrike>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Geocrush" and Geocrush>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Grand Fall" and GrandFall>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Wind Blade" and WindBlade>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Heavenly Strike" and HeavenlyStrike>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		elseif spell=="Thunderstorm" and Thunderstorm>4 then
			equip(sets.pet_midcast.Magic_BP_NoTP)
		else
			equip(sets.pet_midcast.Magic_BP_TP)
		end
	elseif Debuff_Rage_BPs:contains(spell) then
		equip(sets.pet_midcast.Debuff_Rage)
	else
		if AccMode then
			equip(sets.pet_midcast.Physical_BP_Acc)
		elseif Physical_BPs_TP:contains(spell) then
			equip(sets.pet_midcast.Physical_BP_TP)
		elseif buffactive["Aftermath: Lv.3"] then
			equip(sets.pet_midcast.Physical_BP_AM3)
		else
			equip(sets.pet_midcast.Physical_BP)
		end
	end
end

-- This command is called whenever you input "gs c <command>"
function self_command(command)
	IdleModeCommands = {'DD','Refresh','DT','Favor','PetDT','Zendik'}
	is_valid = command:lower()=="idle"
	
	for _, v in ipairs(IdleModeCommands) do
		if command:lower()==v:lower() then
			IdleMode = v
			send_command('console_echo "Idle Mode: ['..IdleMode..']"')
			idle()
			return
		end
	end
	if string.sub(command,1,7)=="EquipBP" then
		equipBPGear(string.sub(command,9,string.len(command)))
		return
	elseif command:lower()=="accmode" then
		AccMode = AccMode==false
		is_valid = true
		send_command('console_echo "AccMode: '..tostring(AccMode)..'"')
	elseif command:lower()=="impactmode" then
		ImpactDebuff = ImpactDebuff==false
		is_valid = true
		send_command('console_echo "Impact Debuff: '..tostring(ImpactDebuff)..'"')
    elseif command:lower()=="forceilvl" then
        ForceIlvl = ForceIlvl==false
        is_valid = true
        send_command('console_echo "Force iLVL: '..tostring(ForceIlvl)..'"')
	elseif command:lower()=="lagmode" then
		LagMode = LagMode==false
		is_valid = true
		send_command('console_echo "Lag Compensation Mode: '..tostring(LagMode)..'"')
	elseif command:lower()=="th" then
		TreasureHunter = TreasureHunter==false
		is_valid = true
		send_command('console_echo "Treasure Hunter Mode: '..tostring(TreasureHunter)..'"')
	elseif command:lower()=="meleemode" then
		if MeleeMode then
			MeleeMode = false
			enable("main","sub")
			send_command('console_echo "Melee Mode: false"')
		else
			MeleeMode = true
			equip({main="Nirvana",sub="Elan Strap +1"})
			disable("main","sub")
			send_command('console_echo "Melee Mode: true"')
		end
		is_valid = true
	elseif command=="ToggleIdle" then
		is_valid = true
		-- If you want to change the sets cycled with F9, this is where you do it
		if IdleMode=="Refresh" then
			IdleMode = "DT"
		elseif IdleMode=="DT" then
			IdleMode = "PetDT"
		elseif IdleMode=="PetDT" then
			IdleMode = "Favor"
		elseif IdleMode=="Favor" then
			IdleMode = "DD"
		else
			IdleMode = "Refresh"
		end
		send_command('console_echo "Idle Mode: ['..IdleMode..']"')
	elseif command:lower()=="lowhp" then
		
		return
	elseif string.sub(command:lower(),1,12)=="meteorstrike" then
		MeteorStrike = string.sub(command,13,13)
		send_command('console_echo "Meteor Strike: '..MeteorStrike..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,8)=="geocrush" then
		Geocrush = string.sub(command,9,9)
		send_command('console_echo "Geocrush: '..Geocrush..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,9)=="grandfall" then
		GrandFall = string.sub(command,10,10)
		send_command('console_echo "Grand Fall: '..GrandFall..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,9)=="windblade" then
		WindBlade = +string.sub(command,10,10)
		send_command('console_echo "Wind Blade: '..WindBlade..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,14)=="heavenlystrike" then
		HeavenlyStrike = string.sub(command,15,15)
		send_command('console_echo "Heavenly Strike: '..HeavenlyStrike..'/5"')
		is_valid = true
	elseif string.sub(command:lower(),1,12)=="thunderstorm" then
		Thunderstorm = string.sub(command,13,13)
		send_command('console_echo "Thunderstorm: '..Thunderstorm..'/5"')
		is_valid = true
	elseif command == 'whm' then
		send_command('input /macro book 15;')
		is_valid = true;
	elseif command == 'smn' then
		send_command('input /macro book 11;')
		is_valid = true;
	elseif command == 'startup' then
		is_valid = true;
	end

	if is_valid then
		if not midaction() and not pet_midaction() then
			idle()
		end
	else
		sanitized = command:gsub("\"", "")
		send_command('console_echo "Invalid self_command: '..sanitized..'"')
	end
end

-- This function is for returning to aftercast gear after an action/event.
function idle()
	--if TownIdle:contains(world.area:lower()) then
	--	return
	--end
    if pet.isvalid then
		if IdleMode=='DT' then
			equip(sets.aftercast.Perp_DT)
		elseif string.find(pet.name,'Spirit') then
            equip(sets.aftercast.Spirit)
		elseif MeleeMode then
			equip(sets.aftercast.Perp_Melee)
		elseif IdleMode=='PetDT' then
			if ForceIlvl then
				equip(sets.aftercast.Avatar_DT_Ilvl)
			else
				equip(sets.aftercast.Avatar_DT)
			end
        elseif IdleMode=='Refresh' then
			if player.mpp < 50 then
				equip(sets.aftercast.Perp_RefreshSub50)
			else
				equip(sets.aftercast.Perp_Refresh)
			end
		elseif IdleMode=='Favor' then
			equip(sets.aftercast.Perp_Favor)
		elseif IdleMode=='Zendik' then
			equip(sets.aftercast.Perp_Zendik)
        elseif IdleMode=='DD' then
            equip(sets.aftercast.Perp_DD)
        end
		-- Gaiters if Fleet Wind is up
		if buffactive['Quickening'] and IdleMode~='DT' and not ForceIlvl then
			equip({feet="Herald's Gaiters"})
		end
	else
		if IdleMode=='DT' then
			equip(sets.aftercast.DT)
		elseif MeleeMode and IdleMode=='DD' then
			equip(sets.aftercast.Perp_Melee)
		elseif ForceIlvl then
			equip(sets.aftercast.Idle_Ilvl)
		else
			equip(sets.aftercast.Idle)
		end
    end
	-- Balrahn's Ring
	--if Salvage:contains(world.area) then
	--	equip({ring2="Balrahn's Ring"})
	--end
	-- Maquette Ring
	--if world.area=='Maquette Abdhaljs-Legion' and not IdleMode=='DT' then
	--	equip({ring2="Maquette Ring"})
	--end
end