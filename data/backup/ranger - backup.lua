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
	Ammo_Index = 1
	DI_flag = false

	--Default Macro Set for RNG
	send_command('input /macro book 1;wait .1;input /macro set 1;wait .1;wait .1;input //dp Gun;input //lua load SkillChains;wait .1;input //lua load equipviewer;wait .1; input //ev position 1650 50;wait 2.0; input /lockstyleset 3')
	
	--PreSets Below (Snapshot/JA's)
	sets.precast = {}
	sets.precast.Standard = {}
	sets.precast.Gastraphetes = {}
	sets.precast.Sharanga = {}

	sets.precast['Camouflage'] = {body="Orion Jerkin +3"}
	sets.precast['Scavenge'] = {feet="Orion Socks +3"}
	sets.precast['Shadow Bind'] = {hands="Orion Bracers +3"}
	sets.precast['Bounty Shot'] = {hands="Amini Glovelettes +1",
				       feet={ name="Herculean Boots", augments={'Pet: STR+4','Attack+4','"Treasure Hunter"+1','Accuracy+17 Attack+17',}}
	}	

	
	Flurry_Set_Names = {'PreShotF2', 'PreShotF1'}
			
	sets.precast.Standard.PreShot = { --10 --30
		head="Amini Gapette +1", --7						
		body="Amini Caban +1",
		hands="Carmine Finger Gauntlets +1", --8 --11
		legs="Orion Braccae +3", --15
		feet="Meghanada Jambeaux +2",--10
		neck="Scout's Gorget +2", --4
		waist="Yemaya Belt",--0 --5
		ring1="Ilabrat Ring",
		ring2="Haverton Ring", --6
		back={name="Belenus's Cape", augments={'"Snapshot"+10'}}, --10
		ear1="Moonshade Earring",
		ear2="Telos Earring"} --70 --46

	sets.precast.Standard.PreShotF1 = set_combine(sets.precast.Standard.PreShot, { --25 --30
		head="Orion Beret +3", --0 --18	
		waist="Yemaya Belt", --0 --5
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}} --10 --13
	}) --73 --77

	sets.precast.Standard.PreShotF2  = set_combine(sets.precast.Standard.PreShotF1, { --40 --30
		feet="Arcadian Socks +3" --0 --10
	}) --78 --87

	sets.precast.Gastraphetes.PreShot = { --20 --30
		head="Orion Beret +3", --0 --18						
		body="Amini Caban +1",
		hands="Carmine Finger Gauntlets +1", --8 --11
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, --10 --13
		feet="Meghanada Jambeaux +2", --10
		neck="Scout's Gorget +2", --4
		waist="Impulse Belt", --3
		ring1="Ilabrat Ring",
		ring2="Haverton Ring", --6
		back={name="Belenus's Cape", augments={'"Snapshot"+10'}}, --10
		ear1="Moonshade Earring",
		ear2="Telos Earring"} --71 --72

	sets.precast.Gastraphetes.PreShotF1 = set_combine(sets.precast.Gastraphetes.PreShot, { --35 --30
		feet="Arcadian Socks +3", --0 --10
		waist="Yemaya Belt" --0 --5
	}) --73 --87

	sets.precast.Gastraphetes.PreShotF2  = set_combine(sets.precast.Gastraphetes.PreShotF1, { --50 --30
		legs="Pursuer's Pants" --0 --19
	}) --78 --93

	sets.precast.Sharanga.PreShot = { --30 --30
		head="Orion Beret +3",	--0 --18							
		body="Amini Caban +1",
		hands="Carmine Finger Gauntlets +1", --8 --11
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, --10 --13
		feet="Arcadian Socks +3", --0 --10
		neck="Scout's Gorget +2", --4
		waist="Impulse Belt", --3
		ring1="Ilabrat Ring",
		ring2="Haverton Ring", --6
		back={name="Belenus's Cape", augments={'"Snapshot"+10'}}, --10
		ear1="Moonshade Earring",
		ear2="Telos Earring"} --71 --82

	sets.precast.Sharanga.PreShotF1 = set_combine(sets.precast.Sharanga.PreShot, { --45 --30
		legs="Pursuer's Pants", --0 --19
		waist="Yemaya Belt" --0 --5
	}) --76 --93

	sets.precast.Sharanga.PreShotF2  = set_combine(sets.precast.Sharanga.PreShotF1, {})
		
	-- Magic Sets Below		
	sets.precast.FastCast = {
		head="Carmine Mask +1",
		hands="Leyline Gloves",
		body="Samnuha Coat",
		legs="Rawhide Trousers",
		feet="Carmine Greaves +1",
		ear1="Loquacious Earring",
		back={ name="Belenus's Cape", augments={'"Fast Cast"+10',}}
	}
	
	sets.precast.Utsusemi = set_combine(sets.precast.FastCast,{})

	sets.precast['Curing Waltz III'] = {
		head="Mummu Bonnet +2",
        	--body="Passion Jacket",
        	ring1="Asklepian Ring",
        	waist="Gishdubar Sash",
		back={ name="Belenus's Cape", augments={'"Waltz" potency +10%',}}
        }

	Weapon_Set_Names = {'Fomalhaut', 'Gastraphetes', 'Annihilator', 'Armageddon', 'FailNot', 'Ambu', 'Sharanga', 'Sparrowhawk', 'Anarchy'}

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

	set.Weapon.FailNot = {
		set={ 
			ranged="Fail-Not"
		},
		ammoType="arrow",
		preshot="Standard"
	}

	set.Weapon.Ambu = {
		set={ 
			ranged="Ullr"
		},
		ammoType="arrow",
		preshot="Standard"
	}

	set.Weapon.Sharanga = {
		set={ 
			ranged="Sharanga"
		},
		ammoType="bolt",
		preshot="Sharanga"
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

	Ammo_Set_Names = {
		bullet = {'Chrono', 'Eradicating'},
		arrow = {'Chrono'},
		bolt= {'Quelling'},
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
		}
	}

	sets.Ammo.arrow = {
		Chrono = {
			ammo="Chrono Arrow"
		}
	}

	sets.Ammo.bolt = {
		Quelling = {
			ammo="Quelling Bolt"
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

	Hands_Set_Names = {'PhysicalShield', 'MagicalShield', 'KustawiShield', 'RaeticShield', 'AmbuSwordShield', 'AmbuKnifeShield', 'AmbuAxeShield', 'Crit', 'Physical', 'Magical', 'Kustawi', 'AmbuSwordKnife', 'Raetic', 'AmbuKnifeSword', 'AmbuAxe', 'SwordCrit'}

	sets.Hands = {}	

	sets.Hands.PhysicalShield = { 
		main="Perun +1",
		sub="Nusku Shield"
	}

	sets.Hands.MagicalShield = { 
		main={ name="Malevolence", augments={'INT+7','"Mag.Atk.Bns."+5','"Fast Cast"+3',}},
		sub="Nusku Shield"
	}

	sets.Hands.KustawiShield = { 
		main="Kustawi +1",
		sub="Nusku Shield"
	}

	sets.Hands.RaeticShield = { 
		main="Raetic Kris +1",
		sub="Nusku Shield"
	}

	sets.Hands.AmbuSwordShield= { 
		main="Naegling",
		sub="Nusku Shield"
	}

	sets.Hands.AmbuKnifeShield = { 
		main="Tauret",
		sub="Nusku Shield"
	}

	sets.Hands.AmbuAxeShield = { 
		main="Dolichenus",
		sub="Nusku Shield"
	}

	sets.Hands.Crit = { 
		main="Oneiros Knife",
		sub="Nusku Shield"
	}

	sets.Hands.Physical = { 
		main="Perun +1",
		sub="Perun"
	}

	sets.Hands.Magical = { 
		main="Malevolence",
		sub="Malevolence"
	} 
	
	sets.Hands.Kustawi = { 
		main="Kustawi +1",
		sub="Kustawi"
	}
	
	sets.Hands.AmbuSwordKnife = { 
		main="Naegling",
		sub="Tauret",
	}

	sets.Hands.Raetic = { 
		main="Raetic Kris +1",
		sub="Raetic Kris +1",
	}

	sets.Hands.AmbuKnifeSword = { 
		main="Tauret",
		sub="Naegling"
	}

	sets.Hands.AmbuAxe = { 
		main="Dolichenus",
		sub="Vampirism"
	}

	sets.Hands.SwordCrit = { 
		main="Naegling",
		sub="Oneiros Knife",
	}
						
	--Midshot Sets Below
	Midshot_Set_Names = {'Standard', 'StandardAlt', 'Acc','Attack', 'Crit', 'CritDamage', 'DI'}
	sets.Midshot = { 
		head="Arcadian Beret +3",							
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Scout's Gorget +2",
		waist="Yemaya Belt",
		ring1="Ilabrat Ring",
		ring2="Rajas Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}},
		ear1="Dedition Earring",
		ear2="Telos Earring"  
	}

	sets.Midshot.Standard = set_combine(sets.Midshot, {})

	sets.Midshot.StandardAlt = set_combine(sets.Midshot, {
		body="Nisroch Jerkin",
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}}
	})

	sets.Midshot.Acc = set_combine(sets.Midshot, { 
		head="Orion Beret +3",
		hands="Orion Bracers +3",
		body="Orion Jerkin +3",
		legs="Orion Braccae +3",
		feet="Malignance Boots",
		waist="Kwahu Kachina Belt +1",	
		ring1="Regal Ring",
		ring2="Haverton Ring",			 
		ear1="Enervating Earring",
		ear2="Telos Earring"})
				
	sets.Midshot.Attack =  set_combine(sets.Midshot, {
		head="Arcadian Beret +3",
		body="Arcadian Jerkin +3",
		hands="Arcadian Bracers +3",
		legs="Arcadian Braccae +3",
		feet="Arcadian Socks +3",
		waist="Yemaya Belt",
		ring2="Meghanada Ring",					
		ear1="Enervating Earring",
		ear2="Telos Earring"})

	sets.Midshot.Crit =  set_combine(sets.Midshot, {
		head="Meghanada Visor +2",
		body="Nisroch Jerkin",
		hands="Mummu Wrists +2",
		legs="Mummu Kecks +2",
		feet="Oshosi Leggings +1",
		waist="Kwahu Kachina Belt +1",
		neck="Nefarious Collar +1",
		ring1="Ilabrat Ring",
		ring2="Mummu Ring",
		ear1="Enervating Earring",
		ear2="Telos Earring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10',}}})

	sets.Midshot.CritDamage =  set_combine(sets.Midshot.Crit, {
		body="Abnoba Kaftan",
		legs="Darraigner's Brais"
	})

	sets.Midshot.DI = { 
		main="Voluspa Knife",
		ranged="Voluspa Gun",
		head="Heidrek Mask",							
		body="Heidrek Harness",
		hands="Heidrek Gloves",
		legs="Heidrek Brais",
		feet="Heidrek Boots",
		waist="Kwahu Kachina Belt +1",
		ring1="Ilabrat Ring",
		ring2="Mummu Ring",
		ear1="Enervating Earring",
		ear2="Telos Earring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10',}}
	}

	sets.Midshot.double = {
			head="Arcadian Beret +3",
			body="Arcadian Jerkin +3",
			hands="Oshosi Gloves +1",
			legs="Oshosi Trousers +1",
			feet="Oshosi Leggings +1"}

	sets.precast['Eagle Eye Shot'] = sets.Midshot.Standard

	--Barrage Sets Below
	Barrage_Set_Names = {'BarrageAcc', 'BarrageSTP'}
	sets.Barrage = set_combine(sets.Midshot.Acc, {
			hands="Orion Bracers +3",
			legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}}
			})

	sets.Barrage.BarrageSTP = set_combine(sets.Barrage, sets.Midshot.Standard)

	sets.Barrage.BarrageAcc = sets.Barrage
						
	-- Last Stand Sets Below
	LS_Set_Names = {'Normal','Acc', 'DI'}
	sets.LS = {
		head="Orion Beret +3",							
		body={ name="Herculean Vest", augments={'Rng.Atk.+15','Weapon skill damage +5%','AGI+9',}},
		hands="Meghanada Gloves +2",
		legs="Arcadian Braccae +3",
		feet={name="Herculean Boots", augments={'Rng.Acc.+23 Rng.Atk.+23','Weapon skill damage +5%','DEX+5','Rng.Acc.+5',}},
		neck="Scout's Gorget +2",
		waist="Fotia Belt",
		ring1="Regal Ring",
		ring2="Epaminondas's Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
		ear1="Ishvara Earring",
		ear2="Moonshade Earring"}

	sets.LS.Normal = set_combine(sets.LS, {})

	sets.LS.Acc = set_combine(sets.LS, {
		hands="Orion Bracers +3",
		body="Orion Jerkin +3",
		legs="Orion Braccae +3",
		feet="Malignance Boots",
		waist="Kwahu Kachina Belt +1",		
		ring1="Haverton Ring",
		ring2="Regal Ring",
		ear1="Telos Earring",
		ear2="Moonshade Earring"})

	sets.LS.DI = { 
		main="Voluspa Knife",
		ranged="Voluspa Gun",
		head="Heidrek Mask",							
		body="Heidrek Harness",
		hands="Heidrek Gloves",
		legs="Heidrek Brais",
		feet="Heidrek Boots",
		waist="Fotia Belt",
		ring1="Regal Ring",
		ring2="Epaminondas's Ring",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	}

	TrueFlight_Set_Names = {'Normal','Acc', 'Hachi'}

	sets.TrueFlight  = {
		head={ name="Herculean Helm", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Weapon skill damage +4%','INT+10','"Mag.Atk.Bns."+7',}},						
		body= { name="Herculean Vest", augments={'"Mag.Atk.Bns."+24','Weapon skill damage +4%','MND+1','Mag. Acc.+12',}},
		hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+17','Weapon skill damage +5%','Mag. Acc.+15',}},
		legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+24','Weapon skill damage +5%','INT+5','Mag. Acc.+14',}},
		feet={ name="Herculean Boots", augments={'Mag. Acc.+10 "Mag.Atk.Bns."+10','Weapon skill damage +4%','INT+6','Mag. Acc.+1','"Mag.Atk.Bns."+14',}},
		neck="Scout's Gorget +2",
		waist="Eschan Stone",
		ring1="Dingir Ring",
		ring2="Epaminondas's Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
		ear1="Friomisi Earring",
		ear2="Ishvara Earring"}
						
	sets.TrueFlight.Normal = set_combine(sets.TrueFlight, {})

	sets.TrueFlight.Acc = set_combine(sets.TrueFlight, {
		head="Arcadian Beret +3",						
		body="Arcadian Jerkin +3",
		hands="Oshosi Gloves +1",
		legs="Oshosi Trousers +1",
		feet="Oshosi Leggings +1",
		waist="Eschan Stone",
		ring1="Dingir Ring",
		ring2="Mummu Ring"
	 })

	sets.TrueFlight.Hachi = set_combine(sets.TrueFlight, {
		waist="Hachirin-no-Obi"
	})

	sets.Coronach = {
		ear2="Sherida Earring"
	}

	sets.Decimation = {
		head="Adhemar Bonnet +1",
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Meghanada Chausses +2",
		feet={ name="Herculean Boots", augments={'Attack+23','"Triple Atk."+4','AGI+10',}},
		waist="Fotia Belt",
		neck="Fotia Gorget",
		ear1="Brutal Earring",
		ear2="Sherida Earring",
		ring1="Regal Ring",
		ring2="Epona's Ring",
		back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
	}

	sets.Evis = {
		head="Adhemar Bonnet +1",
		body="Abnoba Kaftan",
		hands="Mummu Wrists +2",
		legs={ name="Herculean Trousers", augments={'"Triple Atk."+4','AGI+4','Accuracy+12',}},
		feet="Mummu Gamashes +2",
		waist="Fotia Belt",
		neck="Fotia Gorget",
		ear1="Mache Earring +1",
		ear2="Moonshade Earring",
		ring1="Regal Ring",
		ring2="Mummu Ring",
		back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	}

	sets.Savage = {	
		head="Orion Beret +3",							
		body={ name="Herculean Vest", augments={'Accuracy+22','Weapon skill damage +5%','Attack+13',}},
		hands="Meghanada Gloves +2",
		legs="Arcadian Braccae +3",
		feet={ name="Herculean Boots", augments={'Attack+23','Weapon skill damage +5%','Accuracy+10',}},
		waist="Prosilio Belt +1",
		neck="Caro Necklace",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		ring1="Regal Ring",
		ring2="Epaminondas's Ring",
		back={ name="Belenus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	}
	
	--Idle Sets Below
	Idle_Set_Names = {'DT', 'Normal'}
	sets.Idle = {
		head="Arcadian Beret +3",							
		body="Nisroch Jerkin",
		hands="Arcadian Bracers +3",
		legs="Arcadian Braccae +3",
		feet="Orion Socks +3",
		neck="Scout's Gorget +2",
		waist="Kwahu Kachina Belt +1",
		ring1="Regal Ring",
		ring2="Epaminondas's Ring",
		back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}},
		ear1="Infused Earring",
		ear2="Telos Earring"}

	sets.Idle.Normal = set_combine(sets.Idle, {})

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

	Melee_Set_Names = {'DT', 'DblAtt'}

	sets.Melee = {  
		head="Adhemar Bonnet +1",							
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Samnuha Tights",
		legs={ name="Herculean Trousers", augments={'"Triple Atk."+4','AGI+4','Accuracy+12',}},
		neck="Anu Torque",
		waist="Windbuffet Belt +1",
		ring1="Petrov Ring",
		ring2="Epona's Ring",
		back={ name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
		ear1="Suppanomimi",
		ear2="Sherida Earring"
	}

	sets.Melee.DblAtt = set_combine(sets.Melee, {})

	sets.Melee.DT = set_combine(sets.Melee, {
		head="Malignance Chapeau",
		body="Malignance Tabard",	
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots"})
	
	-- PDT (Set will lock and unlock on toggle)
	-- Macro /console gs c pdt
	set.pdt = {}
	pdt = {}
	pdt.on = {
		head="Malignance Chapeau",							
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Gishdubar Sash",
		ring1="Warden's Ring",
		ring2="Defending Ring",
		back="Moonlight Cape",
		ear1="Infused Earring",
		ear2="Telos Earring"}
	pdt.off = {}

	send_command('wait 5;input //gs c startup')

end

function precast(spell)	
	if sets.precast[spell.english] then
                equip(sets.precast[spell.english])

		if spell.name == 'Bounty Shot' or spell.name == 'Eagle Eye Shot' then
			if player.equipment.ammo == 'Hauksbok Bullet' or player.equipment.ammo == 'Hauksbok Arrow' then
				add_to_chat(167,''..player.equipment.ammo..' equipped, canceling shot')                           
            			cancel_spell()
            			return	
			end	
		end
	elseif spell.type == 'WeaponSkill' then
		if spell.target.distance > 21.0  then						
			add_to_chat(167,''..spell.target.name..' is too far can not use '..spell.name..'!!!. Cancelling WeaponSkill ')                           
            		cancel_spell()
            		return			
		elseif spell.name == "Trueflight" then
                	equip(sets.TrueFlight[TrueFlight_Set_Names[TrueFlight_Index]])
		elseif spell.name == "Wildfire" then
                	equip(sets.TrueFlight[TrueFlight_Set_Names[TrueFlight_Index]])
		elseif spell.name == "Flaming Arrow" then
                	equip(sets.TrueFlight[TrueFlight_Set_Names[TrueFlight_Index]])
		elseif spell.name == "Coronach" then
                	equip(sets.LS[LS_Set_Names[LS_Index]], sets.Coronach)
		else
                	equip(sets.LS[LS_Set_Names[LS_Index]])
		end

		if spell.name == "Aeolian Edge" then
                	equip(sets.TrueFlight[TrueFlight_Set_Names[TrueFlight_Index]])
		elseif spell.name == "Circle Blade" then
                	equip(sets.LS[LS_Set_Names[LS_Index]])
		elseif spell.name == "Evisceration" then
                	equip(sets.Evis)
		elseif spell.name == "Savage Blade" then
                	equip(sets.Savage)
		elseif spell.name == "Decimation" then
                	equip(sets.Decimation)
		elseif player.equipment.ammo == 'Hauksbok Bullet' or player.equipment.ammo == 'Hauksbok Arrow' then
			add_to_chat(167,''..player.equipment.ammo..' equipped, canceling shot')                           
            		cancel_spell()
            		return		
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
		elseif buffactive['Double Shot'] and DI_flag == false then
			equip(set_combine(sets.Midshot[Midshot_Set_Names[Midshot_Index]], sets.Midshot.double))						
		end
	end
end

function aftercast(spell)	
	if DI_flag == false then 
		if player.status=='Engaged' then
			equip(sets.Melee[Melee_Set_Names[Melee_Index]])
		else		
			equip(sets.Idle[Idle_Set_Names[Idle_Index]])		
		end
	end
end

function status_change(new,old)
	if DI_flag == false then 
		if T{'Idle','Resting'}:contains(new) then		
			equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
		elseif new == 'Engaged' then
			equip(sets.Melee[Melee_Set_Names[Melee_Index]]) 
		end
	end 
end

function buff_change(name,gain_or_loss)
	if name == 'Battlefield' and not gain_or_loss then
		--send_command('wait 3; input /ja "Scavenge" <me>')
		add_to_chat(167,'You left the Battlefield, don\'t forget to Scavenge!')
	end
	if name == 'weakness' and gain_or_loss then	
			send_command('timers create "Weakness" 300 up abilities/00255.png')			
	elseif name == 'weakness' and not gain_or_loss then	
			send_command('timers delete "Weakness"')
	end
end

--Toggle Self Commands with //gs c [command name] 
--Example type in chat //gs c tp (case sensitive)
--Example Make a macro /console gs c tp (case sensitive)
function self_command(command)
	if command == 'tp' then
		TP_Index = TP_Index +1		
		if TP_Index > #TP_Set_Names then TP_Index = 1 end
		add_to_chat(207,'TP Set Changed to: '..TP_Set_Names[TP_IEndex]..'')
		status_change(player.status)
	elseif command == 'idle' then
		Idle_Index = Idle_Index +1
		if Idle_Index > #Idle_Set_Names then Idle_Index = 1 end
		add_to_chat(207,'Idle Set Changed to: '..Idle_Set_Names[Idle_Index]..'')
		equip(sets.Idle[Idle_Set_Names[Idle_Index]])
	elseif command == 'melee' then
		Melee_Index = Melee_Index +1
		if Melee_Index > #Melee_Set_Names then Melee_Index = 1 end
		add_to_chat(207,'Melee Set Changed to: '..Melee_Set_Names[Melee_Index]..'')
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	elseif command:sub(1, 5) == 'hands' then
		Temp_Hands_Index = command:sub(6,8)

		if Temp_Hands_Index == nil then
			Hands_Index = Hands_Index +1
		else 
			Hands_Index = tonumber(Temp_Hands_Index)
		end
		
		if Hands_Index > #Hands_Set_Names then Hands_Index = 1 end
		add_to_chat(207,'Hands Set Changed to: '..Hands_Set_Names[Hands_Index]..'')
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
	elseif command == 'flurry' then
		Flurry_Index = Flurry_Index +1
		if Flurry_Index > #Flurry_Set_Names then Flurry_Index = 1 end
		add_to_chat(207,'Flurry Set Changed to: '..Flurry_Set_Names[Flurry_Index ]..'')
	elseif command:sub(1, 6) == 'weapon' then
		Temp_Weapon_Index = command:sub(7,9)

		if Temp_Weapon_Index == nil then
			Weapon_Index = Weapon_Index +1
		else 
			Weapon_Index = tonumber(Temp_Weapon_Index)
		end
		
		if Weapon_Index > #Weapon_Set_Names then Weapon_Index = 1 end
		add_to_chat(207,'Weapon Set Changed to: '..Weapon_Set_Names[Weapon_Index]..'')
		weapon_set = set.Weapon[Weapon_Set_Names[Weapon_Index]]
		equip(weapon_set.set)

		Ammo_Index = 1
		Ammo_Set_Subset = sets.Ammo[weapon_set.ammoType]
		Ammo_Name_Subset = Ammo_Set_Names[weapon_set.ammoType]
		
		equip(Ammo_Set_Subset[Ammo_Name_Subset[Ammo_Index]])

		if weapon_set.ammoType == 'bullet' then
			send_command('input //dp Gun')
		elseif weapon_set.ammoType == 'arrow' then
			send_command('input //dp Bow')
		elseif weapon_set.ammoType == 'bolt' then
			send_command('input //dp Xbow')
		end
	elseif command == 'ammo' then
		weapon_set = set.Weapon[Weapon_Set_Names[Weapon_Index]]
		Ammo_Index = Ammo_Index +1
		Ammo_Name_Subset = Ammo_Set_Names[weapon_set.ammoType]
		if Ammo_Index > #Ammo_Name_Subset then Ammo_Index = 1 end
		add_to_chat(207,'Ammo Set Changed to: '..Ammo_Name_Subset[Ammo_Index]..'')	
	elseif command == 'pdt' then
		if sets.pdt == pdt.on then
			equip(pdt.off)
			equip(sets.Hands[Hands_Set_Names[Hands_Index]])
			sets.pdt = pdt.off
			enable('head','neck','ear1','ear2','body','hands','ring1','ring2','back','waist','legs','feet')
			status_change(player.status)
			add_to_chat(207,'>>>>> PDT Set Unlocked! <<<<<')
		else				
			equip(pdt.on)
			sets.pdt = pdt.on
			disable('head','neck','ear1','ear2','body','hands','ring1','ring2','back','waist','legs','feet')
			add_to_chat(66,'>>>>> PDT Set Locked! <<<<<')
		end
	elseif command == 'midshot' then
		Midshot_Index = Midshot_Index +1
		if Midshot_Index > #Midshot_Set_Names then Midshot_Index = 1 end
		add_to_chat(207,'Midshot Set Changed to: '..Midshot_Set_Names[Midshot_Index]..'')		
	elseif command == 'barrage' then
		Barrage_Index = Barrage_Index +1
		if Barrage_Index > #Barrage_Set_Names then Barrage_Index = 1 end
		add_to_chat(207,'Barrage Set Changed to: '..Barrage_Set_Names[Barrage_Index]..'')	
	elseif command == 'lsws' then
		LS_Index = LS_Index +1
		if LS_Index > #LS_Set_Names then LS_Index = 1 end
		add_to_chat(207,'LS Set Changed to: '..LS_Set_Names[LS_Index]..'')
	elseif command == 'tfws' then
		TrueFlight_Index = TrueFlight_Index +1
		if TrueFlight_Index > #TrueFlight_Set_Names then TrueFlight_Index = 1 end
		add_to_chat(207,'Trueflight Set Changed to: '..TrueFlight_Set_Names[TrueFlight_Index]..'')
	elseif command == 'update' then
		status_change(player.status)
		add_to_chat(207,'Update player status...')
	elseif command == 'equippre' then
		weapon_set = set.Weapon[Weapon_Set_Names[Weapon_Index]]
		equip(sets.precast[weapon_set.preshot].PreShot)	 
	elseif command == 'equipflurry' then
		weapon_set = set.Weapon[Weapon_Set_Names[Weapon_Index]]
		preshot_set = sets.precast[weapon_set.preshot]
		equip(preshot_set[Flurry_Set_Names[Flurry_Index]])	
	elseif command == 'equipmid' then
		equip(sets.Midshot[Midshot_Set_Names[Midshot_Index]]) 
	elseif command == 'equipdouble' then
		equip(set_combine(sets.Midshot[Midshot_Set_Names[Midshot_Index]], sets.Midshot.double))		 
	elseif command == 'equipbarrage' then
		equip(sets.Barrage[Barrage_Set_Names[Barrage_Index]])	
	elseif command == 'equiptf' then
		equip(sets.TrueFlight[TrueFlight_Set_Names[TrueFlight_Index]])
	elseif command == 'equipws' then
		equip(sets.LS[LS_Set_Names[LS_Index]])
	elseif command == 'equipevis' then
		equip(sets.Evis)
	elseif command == 'equipdeci' then
		equip(sets.Decimation)
	elseif command == 'equipsavage' then
		equip(sets.Savage)
	elseif command == 'equipidle' then
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif command == 'equipmelee' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	elseif command == 'di' then
		if DI_flag == false then
			DI_flag = true
			Midshot_Index = 6
			LS_Index = 3
			equip(sets.Midshot[Midshot_Set_Names[Midshot_Index]]) 
		else 
			DI_flag = false
			Midshot_Index = 1
			LS_Index = 1
		end
	elseif command == 'startup' then
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
 
		weapon_set = set.Weapon[Weapon_Set_Names[Weapon_Index]]
		equip(weapon_set.set)

		Ammo_Set_Subset = sets.Ammo[weapon_set.ammoType]
		Ammo_Name_Subset = Ammo_Set_Names[weapon_set.ammoType]
		equip(Ammo_Set_Subset[Ammo_Name_Subset[Ammo_Index]])
	end
end


function file_unload()
	
end