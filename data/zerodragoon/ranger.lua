include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	TP_Index = 1
	Idle_Index = 1	
	Melee_Index = 1
	Midshot_Index = 1
	Barrage_Index = 1
	Hands_Index = 1
	Flurry_Index = 1
	Weapon_Index = 1
	LS_Index = 1
	TrueFlight_Index = 1
	Jishnu_Index = 1
	Ammo_Index = 1
	ATT_Cap_High = false
	ATT_Cap_Flag = false
	Style_Lock_Id = 3

	--Default Macro Set for RNG
	send_command('input /macro book 1;wait .1;input /macro set 1;wait .1;wait .1;input //dp Gun;wait 0.5;input //gs org;input //lua l ar')
	
	set_style_lock()

	--PreSets Below (Snapshot/JA's)
	sets.precast = {}
	sets.precast.Standard = {}
	sets.precast.Gastraphetes = {}
	sets.precast.Sharanga = {}

	sets.precast['Camouflage'] = {body="Orion Jerkin +3"}
	sets.precast['Scavenge'] = {feet="Orion Socks +3"}
	sets.precast['Shadowbind'] = {hands="Orion Bracers +3"}
	sets.precast['Bounty Shot'] = {
		hands="Amini Glovelettes +3"
	}
	
	Flurry_Set_Names = {'PreShotF2', 'PreShotF1'}
			
	sets.precast.Standard.PreShot = { --10 --35
		--Perun +1 --5 This just assumes this is equipped
		head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}}, --10						
		body="Amini Caban +3",
		hands="Carmine Finger Gauntlets +1", --8 --11
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, --10 --13
		feet="Meghanada Jambeaux +2",--10
		neck="Scout's Gorget +2", --4
		waist="Yemaya Belt", --0 --5
		ring1="Crepuscular Ring", --3
		back={name="Belenus's Cape", augments={'"Snapshot"+10'}}, --10
	} --70 --64

	sets.precast.Standard.PreShotF1 = set_combine(sets.precast.Standard.PreShot, { --25 --35
		head="Orion Beret +3", --0 --18
	}) --75 --82

	sets.precast.Standard.PreShotF2  = set_combine(sets.precast.Standard.PreShotF1, { --40 --35
		legs="Pursuer's Pants", --0 --19
		feet="Arcadian Socks +3", --0 --10
	}) --70 --98

	sets.precast.Gastraphetes.PreShot = { --20 --35
		--Perun +1 --5 This just assumes this is equipped
		head="Orion Beret +3", --0 --18						
		body="Amini Caban +3",
		hands="Carmine Finger Gauntlets +1", --8 --11
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, --10 --13
		feet="Meghanada Jambeaux +2", --10
		neck="Scout's Gorget +2", --4
		waist="Yemaya Belt", --0 --5
		ring1="Crepuscular Ring", --3
		back={name="Belenus's Cape", augments={'"Snapshot"+10'}}, --10
	} --70 --82

	sets.precast.Gastraphetes.PreShotF1 = set_combine(sets.precast.Gastraphetes.PreShot, { --35 --30
		feet="Arcadian Socks +3" --0 --10
	}) --75 --92

	sets.precast.Gastraphetes.PreShotF2  = set_combine(sets.precast.Gastraphetes.PreShotF1, { --50 --30
		hands="Mrigavyadha Gloves", --0 --15
		legs="Pursuer's Pants" --0 --19		
	}) --72 --99
	
	sets.precast.Sharanga.PreShot = { --30 --35
		--Perun +1 --5 This just assumes this is equipped
		head="Orion Beret +3",	--0 --18							
		body="Amini Caban +3",
		hands="Carmine Finger Gauntlets +1", --8 --11
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, --10 --13
		feet="Arcadian Socks +3", --0 --10
		neck="Scout's Gorget +2", --4
		waist="Yemaya Belt", --0 --5
		ring1="Crepuscular Ring", --3
		back={name="Belenus's Cape", augments={'"Snapshot"+10'}}, --10
	} --70 --87

	sets.precast.Sharanga.PreShotF1 = set_combine(sets.precast.Sharanga.PreShot, { --45 --30
		legs="Pursuer's Pants" --0 --19
	}) --75 --98

	sets.precast.Sharanga.PreShotF2  = set_combine(sets.precast.Sharanga.PreShotF1, {
		hands="Mrigavyadha Gloves" --0 --15
	}) --74 --99
		
	-- Magic Sets Below		
	sets.precast.FastCast = {
		head="Carmine Mask +1", --14
		hands="Leyline Gloves", --8
		body="Dread Jupon", --7
		legs="Rawhide Trousers", --5
		feet="Carmine Greaves +1", --8
		neck="Baetyl Pendant", --4
		ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
		ring1="Weatherspoon Ring +1", --5
		ring2="Prolix Ring", --2
		back={ name="Belenus's Cape", augments={'"Fast Cast"+10',}} --10
	} --57
	
	sets.precast.Utsusemi = set_combine(sets.precast.FastCast,{
		neck="Magoraga Beads", --10
		body="Passion Jacket" --10
	}) --73

	sets.precast['Curing Waltz III'] = {
		head="Anwig Salade",
		body="Passion Jacket", --13
		hands="Slither Gloves +1", --5
		feet="Rawhide Boots", --8
		ring1="Asklepian Ring",
		ring2="Valseur's Ring", --3
		ear1="Handler's Earring +1",
		ear2="Enchanter's Earring +1",
		waist="Gishdubar Sash",
		back={ name="Belenus's Cape", augments={'"Waltz" potency +10%',}} --10
	}

	Weapon_Set_Names = {'Fomalhaut', 'Gastraphetes', 'Annihilator', 'Armageddon', 'FailNot', 'Sparrowhawk', 'Anarchy', 'Sharanga', 'Yoichinoyumi', 'Gandiva', 'Ullr'}

	set.Weapon = {}	

	set.Weapon.Annihilator = {
		set={ 
			ranged="Annihilator"
		},
		ammoType="bullet",
		preshot="Standard"
	}

	set.Weapon.Fomalhaut = {
		set={ 
			ranged="Fomalhaut"
		},
		ammoType="bullet",
		preshot="Standard"
	}

	set.Weapon.Armageddon = {
		set={ 
			ranged="Armageddon"
		},
		ammoType="bullet",
		preshot="Standard"
	}
	
	set.Weapon.Prime = {
		set={ 
			ranged="Earp"
		},
		ammoType="bullet",
		preshot="Standard"
	}

	set.Weapon.FailNot = {
		set={ 
			ranged="Fail-Not"
		},
		ammoType="arrow",
		preshot="Standard"
	}

	set.Weapon.Gastraphetes = {
		set={ 
			ranged="Gastraphetes"
		},
		ammoType="bolt",
		preshot="Gastraphetes"
	}

	set.Weapon.Sparrowhawk = {
		set={ 
			ranged="Sparrowhawk +2"
		},
		ammoType="hauksbokArrow",
		preshot="Standard"
	}

	set.Weapon.Anarchy = {
		set={ 
			ranged="Anarchy +2"
		},
		ammoType="hauksbokBullet",
		preshot="Standard"
	}
	
	set.Weapon.Sharanga = {
		set={ 
			ranged="Sharanga"
		},
		ammoType="bolt",
		preshot="Sharanga"
	}
	
	set.Weapon.Yoichinoyumi = {
		set={ 
			ranged="Yoichinoyumi"
		},
		ammoType="arrow",
		preshot="Standard"
	}
	
	set.Weapon.Gandiva = {
		set={ 
			ranged="Gandiva"
		},
		ammoType="arrow",
		preshot="Standard"
	}
	
	set.Weapon.Ullr = {
		set={ 
			ranged="Ullr"
		},
		ammoType="arrow",
		preshot="Standard"
	}
	
	sets.Sharanga = {
		ranged="Sharanga"
	}
	
	sets.Yoichinoyumi = {
		ranged="Yoichinoyumi"
	}
	
	sets.Failnot = {
		ranged="Fail-Not"
	}
	
	sets.Gandiva = {
		ranged="Gandiva"
	}
	
	sets.Prime = {
		ranged="Earp"
	}

	Ammo_Set_Names = {
		bullet = {'Chrono', 'Eradicating', 'Devastating'},
		arrow = {'Chrono', 'Yoichi', 'Artemis'},
		bolt= {'Quelling', 'Acid'},
		hauksbokArrow = {'Hauksbok', 'Chrono'},
		hauksbokBullet = {'Hauksbok', 'Chrono'}
	}

	sets.Ammo = {}

	sets.Ammo.bullet = {
		Chrono =  {
			ammo="Chrono Bullet"
		},
		Eradicating = {
			ammo="Eradicating Bullet"
		},
		Devastating = {
			ammo="Devastating Bullet"
		}
	}

	sets.Ammo.arrow = {
		Chrono = {
			ammo="Chrono Arrow"
		},
		Yoichi = {
			ammo="Yoichi's Arrow"
		},
		Artemis = {
			ammo="Artemis's Arrow"
		}
	}

	sets.Ammo.bolt = {
		Quelling = {
			ammo="Quelling Bolt"
		},
		Acid = {
			ammo="Abrasion Bolt"
		}
	}

	sets.Ammo.hauksbokArrow = {
		Hauksbok = {
			ammo="Hauksbok Arrow"
		},
		Chrono = {
			ammo="Chrono Arrow"
		}
	}

	sets.Ammo.hauksbokBullet = {
		Hauksbok = {
			ammo="Hauksbok Bullet"
		},
		Chrono =  {
			ammo="Chrono Bullet"
		}
	}

	Hands_Set_Names = {'PhysicalShield', 'Physical', 'Magical', 'KrakenP', 'KrakenM', 'KrakenT', 'CrepGletis', 'NaegGletis', 'NaegCrep', 'MalevGletis', 'Oneiros'}

	sets.Hands = {}	

	sets.Hands.PhysicalShield = { 
		main="Perun +1",
		sub="Nusku Shield"
	}

	sets.Hands.Physical = { 
		main="Perun +1",
		sub="Kustawi +1"
	}

	sets.Hands.Magical = { 
		main="Malevolence",
		sub="Malevolence"
	} 

	sets.Hands.KrakenP = { 
		main="Naegling",
		sub="Kraken Club",
	}

	sets.Hands.KrakenM = { 
		main={ name="Malevolence", augments={'INT+9','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},
		sub="Kraken Club",
	}
	
	sets.Hands.KrakenT = { 
		main="Tauret",
		sub="Kraken Club",
	}
	
	sets.Hands.CrepGletis = { 
		main="Crepuscular Knife",
		sub="Gleti's Knife",
	}
	
	sets.Hands.NaegGletis = { 
		main="Naegling",
		sub="Gleti's Knife",
	}
	
	sets.Hands.NaegCrep = { 
		main="Naegling",
		sub="Crepuscular Knife",
	}
	
	sets.Hands.MalevGletis = { 
		main={ name="Malevolence", augments={'INT+9','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},
		sub="Gleti's Knife",
	}
	
	sets.Hands.Oneiros = { 
		main="Oneiros Knife",
		sub="Nusku Shield"
	}
						
	--Midshot Sets Below
	Midshot_Set_Names = {'TrueShot', 'Ikenga', 'Malig', 'Acc', 'Crit', 'CritPDL', 'CritTrue'}
	sets.Midshot = { 
		head="Arcadian Beret +3",							
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Scout's Gorget +2",
		waist="Tellen Belt",
		ring1="Ilabrat Ring",
		ring2="Crepuscular Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}},
		ear1="Dedition Earring",
		ear2="Telos Earring"  
	}
	
	sets.Midshot.TrueShot = set_combine(sets.Midshot, { 
		body="Ikenga's Vest",
		hands="Amini Glovelettes +3",
		legs="Amini Bragues +3",
		feet="Ikenga's Clogs"
	})

	sets.Midshot.Malig = set_combine(sets.Midshot, {})

	sets.Midshot.Acc = set_combine(sets.Midshot, { 
		head="Orion Beret +3",
		hands="Orion Bracers +3",
		body="Orion Jerkin +3",
		legs="Orion Braccae +3",
		feet="Malignance Boots",
		waist="Kwahu Kachina Belt +1",	
		ring1="Regal Ring",
		ring2="Longshot Ring",			 
		ear1="Beyla Earring",
		ear2="Telos Earring"})
		
	sets.Midshot.Ikenga = set_combine(sets.Midshot, { 
		hands="Ikenga's Gloves",
		body="Ikenga's Vest",
		legs="Ikenga's Trousers",
		feet="Ikenga's Clogs"
	})

	sets.Midshot.Crit =  set_combine(sets.Midshot, {
		--head="Meghanada Visor +2",
		head="Mummu Bonnet +2",
		body="Nisroch Jerkin",
		hands="Mummu Wrists +2",
		legs="Amini Bragues +3",
		feet="Oshosi Leggings +1",
		waist="Kwahu Kachina Belt +1",
		neck="Nefarious Collar +1",
		--ring1="Ilabrat Ring", --Begruding Ring
		ring1="Begrudging Ring",
		ring2="Mummu Ring",
		ear1="Odr Earring",
		ear2="Telos Earring", --Amini Earring +2
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10',}}})

		
	sets.Midshot.CritPDL =  set_combine(sets.Midshot.Crit, {
		head="Meghanada Visor +2",
		body="Ikenga's Vest",
		neck="Scout's Gorget +2"})
		
	sets.Midshot.CritTrue =  set_combine(sets.Midshot.CritPDL, {
		body="Nisroch Jerkin",
		feet="Ikenga's Clogs",
		waist="Tellen Belt"
	})

	sets.Midshot.double = {
			head="Arcadian Beret +3",
			body="Arcadian Jerkin +3",
			hands="Oshosi Gloves +1",
			legs="Oshosi Trousers +1",
			feet="Oshosi Leggings +1"}

	sets.precast['Eagle Eye Shot'] = sets.Midshot

	--Barrage Sets Below
	Barrage_Set_Names = {'BarrageSTP', 'BarrageAcc'}
	sets.Barrage = {
			hands="Orion Bracers +3",
			legs="Amini Bragues +3",
			waist="Tellen Belt"
			}

	sets.Barrage.BarrageSTP = set_combine(sets.Midshot.TrueShot, sets.Barrage)

	sets.Barrage.BarrageAcc = set_combine(sets.Midshot.Acc, sets.Barrage)
						
	-- Last Stand Sets Below
	LS_Set_Names = {'Normal', 'Ikenga', 'Nyame', 'Acc'}
	sets.LS = {
		head="Orion Beret +3",	
		body="Amini Caban +3",		
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Amini Bottillons +3",
		neck="Scout's Gorget +2",
		waist="Fotia Belt",
		ring1="Regal Ring",
		ring2="Epaminondas's Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
		ear1="Moonshade Earring",
		ear2="Ishvara Earring"}

	sets.LS.Normal = sets.LS
	
	sets.LS.Cap = {
		body="Ikenga's Vest",
		hands="Ikenga's Gloves",
		ring1="Sroda Ring",
		ear2="Amini Earring"
	}
	
	sets.LS.Normal.Cap = set_combine(sets.LS, sets.LS.Cap)
	
	sets.LS.Nyame =  set_combine(sets.LS, {
		body="Nyame Mail"
	})
	
	sets.LS.Nyame.Cap = set_combine(sets.LS.Nyame, sets.LS.Cap)
	
	sets.LS.Ikenga = set_combine(sets.LS, {
		body="Ikenga's Vest"
	})
	
	sets.LS.Ikenga.Cap = set_combine(sets.LS.Ikenga, sets.LS.Cap)

	sets.LS.Acc = set_combine(sets.LS, {
		hands="Orion Bracers +3",
		body="Orion Jerkin +3",
		legs="Orion Braccae +3",
		feet="Malignance Boots",
		waist="Kwahu Kachina Belt +1",		
		ring1="Regal Ring",
		ring2="Longshot Ring",
		ear1="Telos Earring",
		ear2="Beyla Earring"})
		
	sets.LS.Acc.Cap = sets.LS.Acc
		
	sets.precast['Split Shot'] = sets.LS.Acc
	sets.precast['Sniper Shot'] = sets.LS.Acc
	sets.precast['Slug Shot'] = sets.LS.Acc
	sets.precast['Blast Shot'] = sets.LS.Acc
	sets.precast['Heavy Shot'] = sets.LS.Acc
	sets.precast['Detonator'] = sets.LS.Acc
	sets.precast['Numbling Shot'] = sets.LS.Acc

	TrueFlight_Set_Names = {'Normal','Acc', 'Hachi', 'Orpheus'}

	sets.TrueFlight  = {
		head="Nyame Helm",							
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Scout's Gorget +2",
		waist="Eschan Stone",
		ring1="Weatherspoon Ring +1",
		ring2="Dingir Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
		ear1="Friomisi Earring",
		ear2="Moonshade Earring"}
						
	sets.TrueFlight.Normal = set_combine(sets.TrueFlight, {})

	sets.TrueFlight.Acc = set_combine(sets.TrueFlight, {
		head="Arcadian Beret +3",						
		body="Arcadian Jerkin +3",
		hands="Oshosi Gloves +1",
		legs="Oshosi Trousers +1",
		waist="Eschan Stone",
		ring1="Dingir Ring",
		ring2="Mummu Ring"
	 })

	sets.TrueFlight.Hachi = set_combine(sets.TrueFlight, {
		waist="Hachirin-no-Obi"
	})

	sets.TrueFlight.Orpheus = {
		waist="Orpheus's Sash"
	}

	sets.Coronach = {
		head="Orion Beret +3",							
		body="Amini Caban +3",
		--body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Amini Bottillons +3",
		neck="Scout's Gorget +2",
		waist="Fotia Belt",
		ring1="Regal Ring",
		ring2="Epaminondas's Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
		ear1="Ishvara Earring",
		ear2="Sherida Earring"
	}
	
	sets.CoronachCap = set_combine(sets.Coronach, {
		ring1="Sroda Ring",
		ear2="Amini Earring",
	})

	sets.Wildfire = {
		ring1="Epaminondas's Ring",
		ear2="Crematio Earring"
	}
	
	sets.HotShot = {
		ring1="Epaminondas's Ring"
	}
	
	sets.Aeolian = set_combine(sets.TrueFlight, {
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		ear2="Moonshade Earring",
		ring1="Epaminondas's Ring"
	})
	
	Jishnu_Set_Names = {'Normal', 'True'}
	
	sets.Jishnu = {}
	
	sets.Jishnu.Normal =  {
		head="Orion Beret +3",
		body="Amini Caban +3",
		hands="Amini Glovelettes +3",
		legs="Nyame Flanchard",
		feet="Amini Bottillons +3",
		waist="Fotia Belt",
		neck="Fotia Gorget",
		ring1="Regal Ring",
		ring2="Begrudging Ring",
		ear1="Odr Earring",
		ear2="Sherida Earring", --Amini Earring +1/+2
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10',}}
	}
	
	sets.Jishnu.Normal.Cap = set_combine(sets.Jishnu.Normal, {
		head="Blistering Sallet +1",
		body="Amini Caban +3",
		hands="Ikenga's Gloves",
		legs="Ikenga's Trousers",
		neck="Scout's Gorget +2",
		ear2="Amini Earring"
	})
	
	sets.Jishnu.True = set_combine(sets.Jishnu.Normal, {
		body="Nisroch Jerkin",
		legs="Amini Bragues +3",
		feet="Ikenga's Clogs"
	})
	
	sets.Jishnu.True.Cap = set_combine(sets.Jishnu.True, {
		head="Blistering Sallet +1",
		body="Amini Caban +3",
		hands="Ikenga's Gloves",
		neck="Scout's Gorget +2",
		ear2="Amini Earring"
	})

	sets.Evis = {
		head="Adhemar Bonnet +1",
		body="Abnoba Kaftan",
		hands="Mummu Wrists +2",
		legs={ name="Herculean Trousers", augments={'"Triple Atk."+4','AGI+4','Accuracy+12',}},
		feet="Mummu Gamashes +2",
		waist="Fotia Belt",
		neck="Fotia Gorget",
		ear1="Odr Earring",
		ear2="Sherida Earring",
		ring1="Regal Ring",
		ring2="Mummu Ring",
		back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	}

	sets.Savage = {	
		head="Nyame Helm",							
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		waist="Sailfi Belt +1",
		neck="Scout's Gorget +2",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		ring1="Sroda Ring",
		ring2="Epaminondas's Ring",
		back={ name="Belenus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	}
	
	sets.SavageCap = set_combine(sets.Savage, {	
		ear2="Amini Earring", --Amini Earring +2
	})
	
	sets.SavageCapHigh = set_combine(sets.SavageCap, {	
		body="Ikenga's Vest"
	})
	
	--Idle Sets Below
	Idle_Set_Names = {'DT'}
	
	sets.Idle = {}

	sets.Idle.DT = set_combine(sets.Idle, {
		head="Malignance Chapeau",							
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Orion Socks +3",
		neck="Loricate Torque +1",
		waist="Gishdubar Sash",
		ring1="Warden's Ring",
		ring2="Defending Ring",
		back="Moonlight Cape",
		ear1="Infused Earring",
		ear2="Telos Earring"})

	Melee_Set_Names = {'Malig', 'Acc', 'DT', 'DTAcc'}
	
	sets.Melee = {
		head="Malignance Chapeau",
		body="Malignance Tabard",	
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Iskur Gorget",
		waist="Olseni Belt",
		ear1="Crepuscular Earring",
		ear2="Dedition Earring",
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1",
		back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+8','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    }

	sets.Melee.Malig = sets.Melee
	
	sets.Melee.Acc = set_combine(sets.Melee.Malig, {
		ear2="Telos Earring",
	})
	
	sets.Melee.DT = set_combine(sets.Melee.Malig, {
		hands="Amini Glovelettes +3",
		legs="Amini Bragues +3"
	})
	
	sets.Melee.DTAcc = set_combine(sets.Melee.DT, {
		ear2="Telos Earring",
	})

	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')

end

function precast(spell)	
	if sets.precast[spell.english] then
		if checkWSDistance(spell) then
			equip(sets.precast[spell.english])

			if spell.name == 'Shadowbind' or spell.name == 'Bounty Shot' or spell.name == 'Eagle Eye Shot' then
				if player.equipment.ammo == 'Hauksbok Bullet' or player.equipment.ammo == 'Hauksbok Arrow' then
					add_to_chat(167,''..player.equipment.ammo..' equipped, canceling shot')                           
							cancel_spell()
							return	
				end	
			end
		end
	elseif spell.type == 'WeaponSkill' then
		if checkWSDistance(spell) then
			if spell.target.distance > 21.0  then						
				add_to_chat(167,''..spell.target.name..' is too far can not use '..spell.name..'!!!. Cancelling WeaponSkill ')                           
				cancel_spell()
				return			
			elseif spell.name == "Trueflight" then
				equip(sets.TrueFlight[TrueFlight_Set_Names[TrueFlight_Index]])

				if buffactive['Aurorastorm'] then
					equip(sets.TrueFlight.Hachi)
				elseif spell.target.distance < 3.0 then
					equip(sets.TrueFlight.Orpheus)
				end
			elseif spell.name == "Wildfire" then
				equip(set_combine(sets.TrueFlight[TrueFlight_Set_Names[TrueFlight_Index]], sets.Wildfire))

				if buffactive['Firestorm'] then
					equip(sets.TrueFlight.Hachi)
				elseif spell.target.distance < 3.0 then
					equip(sets.TrueFlight.Orpheus)
				end
			elseif spell.name == "Hot Shot" or spell.name == "Flaming Arrow" then
				equip(set_combine(sets.TrueFlight[TrueFlight_Set_Names[TrueFlight_Index]], sets.HotShot))

				if buffactive['Firestorm'] then
					equip(sets.TrueFlight.Hachi)
				elseif spell.target.distance < 3.0 then
					equip(sets.TrueFlight.Orpheus)
				end
			elseif spell.name == "Coronach" then
				if ATT_Cap_Flag then
					equip(sets.CoronachCap)
				else 
					equip(sets.Coronach)
				end 
			elseif spell.name == "Jishnu's Radiance" then
				if ATT_Cap_Flag then
					equip(sets.Jishnu[Jishnu_Set_Names[Jishnu_Index]].Cap)
				else
					equip(sets.Jishnu[Jishnu_Set_Names[Jishnu_Index]])
				end
			else
				if ATT_Cap_Flag then
					equip(sets.LS[LS_Set_Names[LS_Index]].Cap)			
				else
					equip(sets.LS[LS_Set_Names[LS_Index]])			
				end
			end
			
			Ammo_Set_Subset = sets.Ammo[weapon_set.ammoType]
			Ammo_Name_Subset = Ammo_Set_Names[weapon_set.ammoType]
			
			equip(Ammo_Set_Subset[Ammo_Name_Subset[Ammo_Index]])

			if spell.name == "Aeolian Edge" or spell.name == "Burning Blade" or spell.name == "Red Lotus Blade"  then
				equip(sets.Aeolian)
			elseif spell.name == "Seraph Blade" then
				equip(set_combine(sets.Aeolian, {
					ring1="Weatherspoon Ring +1"
				}))
			elseif spell.name == "Circle Blade" then
				equip(sets.LS[LS_Set_Names[LS_Index]])
			elseif spell.name == "Evisceration" then
				equip(sets.Evis)
			elseif spell.name == "Savage Blade" then
				if ATT_Cap_Flag then
					if ATT_Cap_High then
						equip(sets.SavageCapHigh)
					else 
						equip(sets.SavageCap)
					end
				else 
					equip(sets.Savage)
				end
			elseif player.equipment.ammo == 'Hauksbok Bullet' or player.equipment.ammo == 'Hauksbok Arrow' then
				add_to_chat(167,''..player.equipment.ammo..' equipped, canceling shot')                           
						cancel_spell()
						return		
			end		
		end
	elseif spell.name == "Ranged" then
		weapon_set = set.Weapon[Weapon_Set_Names[Weapon_Index]]
		preshot_set = sets.precast[weapon_set.preshot]

		if buffactive['Flurry'] then
			equip(preshot_set[Flurry_Set_Names[Flurry_Index]])				
		else
			equip(preshot_set.PreShot)
		end

		Ammo_Set_Subset = sets.Ammo[weapon_set.ammoType]
		Ammo_Name_Subset = Ammo_Set_Names[weapon_set.ammoType]
		
		equip(Ammo_Set_Subset[Ammo_Name_Subset[Ammo_Index]])

		if player.equipment.ammo == 'Hauksbok Bullet' or player.equipment.ammo == 'Hauksbok Arrow' then
			add_to_chat(167,''..player.equipment.ammo..' equipped, canceling shot')                           
            		cancel_spell()
            		return		
		end
	elseif spell.type == "Ninjutsu" then
		if string.find(spell.english,'Utsusemi') then
			equip(sets.precast.Utsusemi)
		else
			equip(sets.precast.FastCast)
		end
	elseif spell.type == "Trust" then
		equip(sets.precast.FastCast)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')        
    end
end

function midcast(spell)
	if spell.name == "Ranged" then
		equip(sets.Midshot[Midshot_Set_Names[Midshot_Index]]) 
		if buffactive.Barrage then
			equip(sets.Barrage[Barrage_Set_Names[Barrage_Index]])						
		elseif buffactive['Double Shot'] then
			equip(set_combine(sets.Midshot[Midshot_Set_Names[Midshot_Index]], sets.Midshot.double))						
		end
	end
end

function aftercast(spell)	
	if player.status=='Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	else		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]])		
	end
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif new == 'Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]]) 
	end
end

--Toggle Self Commands with //gs c [command name] 
--Example type in chat //gs c tp (case sensitive)
--Example Make a macro /console gs c tp (case sensitive)
function self_command(command)
	parent_self_command(command)
	
	if command == 'acid' then
		local weapon_index = Weapon_Index
		local midshot_index = Midshot_Index
		
		windower.send_command('input //gs c weapon2; wait .1;input //gs c ammo; wait .1;input //gs c midshot4; wait .1;input /ra <t>; wait 1;input //gs c weapon'..Weapon_Index..'; wait .1;input //gs c midshot'..Midshot_Index..'; wait .1;timers delete "Acid"; wait .1;timers create "Acid" 60 down;')
	elseif command == 'startup' then
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
 
		weapon_set = set.Weapon[Weapon_Set_Names[Weapon_Index]]
		equip(weapon_set.set)

		Ammo_Set_Subset = sets.Ammo[weapon_set.ammoType]
		Ammo_Name_Subset = Ammo_Set_Names[weapon_set.ammoType]
		equip(Ammo_Set_Subset[Ammo_Name_Subset[Ammo_Index]])
		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]])
	end
end


function file_unload()
	send_command('lua u ar')
end

--[[
	Melee_Set_Names = {'DTAcc','DT', 'Tate', 'DblAtt45', 'DblAtt30', 'DblAtt15', 'DblAtt0', 'TH'}

	sets.Melee = {  
		head="Adhemar Bonnet +1",							
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Samnuha Tights",
		feet={ name="Herculean Boots", augments={'Quadruple Attack +3'}},
		neck="Anu Torque",
		waist="Windbuffet Belt +1",
		ring1="Petrov Ring",
		ring2="Epona's Ring",
		back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
		ear1="Suppanomimi",
		ear2="Sherida Earring"
	}

	sets.Melee.DblAtt45 = set_combine(sets.Melee, {})

	sets.Melee.DblAtt30 = set_combine(sets.Melee.DblAtt45, {
		ear2="Eabani Earring"
	})

	sets.Melee.DblAtt15 = set_combine(sets.Melee.DblAtt30, {
		legs="Carmine Cuisses +1"
	})

	sets.Melee.DblAtt0 = set_combine(sets.Melee.DblAtt15, {
		head={ name="Herculean Helm", augments={'Accuracy+8','"Dual Wield"+5','DEX+1','Attack+12',}},
	})

	sets.Melee.DT = set_combine(sets.Melee, {
		head="Malignance Chapeau",
		body="Malignance Tabard",	
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		ear1="Telos Earring",
		back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+8','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    })

	sets.Melee.DTAcc = set_combine(sets.Melee.DT, {
		head="Malignance Chapeau",
		body="Malignance Tabard",	
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Iskur Gorget",
		waist="Kentarch Belt +1",
		ear1="Telos Earring",
		ear2="Crepuscular Earring",
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1",
		back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+8','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    })
		
	sets.Melee.TH = set_combine(sets.Melee.DT, {
		ammo="Perfect Lucky Egg",
		feet={ name="Herculean Boots", augments={'"Treasure Hunter"+2',}},
		waist="Chaac Belt"})
		
	sets.Melee.Tate = set_combine(sets.Melee, {
		body="Tatenashi Haramaki +1",	
		hands="Tatenashi Gote +1",
		legs="Tatenashi Haidate +1",
		feet="Tatenashi Sune-ate +1"})
	}
	
	sets.Jishnu =  {
		head="Adhemar Bonnet +1",
		body="Meghanada Cuirie +2",
		hands="Mummu Wrists +2",
		legs="Mummu Kecks +2",
		feet="Thereoid Greaves",
		waist="Fotia Belt",
		neck="Fotia Gorget",
		ring1="Regal Ring",
		ring2="Begrudging Ring",
		ear1="Odr Earring",
		ear2="Sherida Earring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10',}}
	}
--]]