include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	Full_Mab = false

	--Default Macro Set for RNG
	send_command('input /macro book 17;wait .1;input /macro set 1;wait 0.5;input //gs org')
	
	set_style_lock()
	
	--Precast
	sets.precast = {}
	
	sets.precast.Diffusion = {
		feet="Luhlaza Charuqs +3"
	}
		
	-- Magic Sets Below		
	sets.precast.FastCast = { --5% Cleave
		head="Carmine Mask +1", --14
		body="Hashishin Mintan +2", --14
		hands="Leyline Gloves", --6
		waist="Witful Belt", --3 --3
		legs="Pinga Pants +1", --13
		feet="Carmine Greaves +1", --8
		neck="Orunmila's Torque", --5
		ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
		ring1="Kishar Ring", --4
		ring2="Weatherspoon Ring +1", --5 --3
		back="Fi Follet Cape +1", --10
		ammo="Sapience Orb" --2
	} --82 --6

	sets.midcast = { 
		ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +2", --Hashishin Set +3
		body="Hashishin Mintan +2",
		hands="Hashishin Bazubands +2",
		legs="Hashishin Tayt +3",
		feet="Hashishin Basmak +2",
		neck="Sibyl Scarf",
		waist="Eschan Stone",
		left_ear="Regal Earring",
		right_ear="Friomisi Earring",
		left_ring="Jhakri Ring",
		right_ring="Metamorph Ring +1",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
	}

	sets.midcast.MAB = set_combine(sets.midcast, {
		body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1",
		neck="Sibyl Scarf" 
	}) 
	
	sets.midcast.MACC = set_combine(sets.midcast, {
		ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +2", --Hashishin Set +3
		body="Hashishin Mintan +2",
		hands="Hashishin Bazubands +2",
		legs="Hashishin Tayt +3",
		feet="Hashishin Basmak +2",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Acuity Belt +1",
		left_ear="Crep. Earring",
		right_ear="Hashi. Earring +1",
		left_ring="Stikini Ring +1",
		right_ring="Weather. Ring +1",
        back={ name="Rosmerta's Cape", augments={'VIT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	})
	
	sets.midcast.MACCFC = set_combine(sets.midcast.MACC, {
		head="Carmine Mask +1"
	})
	
	sets.midcast.MACCWeak = set_combine(sets.midcast.MACC, {
		main="Caliburnus",
		sub="Pukulatmuj +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		waist="Luminary Sash",
		ammo="Staunch Tathlum +1"
	})
	
	sets.midcast.PhysicalAcc = {
		head="Hashishin Kavuk +2", --Hashishin Set +3
		body="Hashishin Mintan +2",
		hands="Hashishin Bazubands +2",
		legs="Hashishin Tayt +3",
		feet="Hashishin Basmak +2",
		neck="Mirage Stole +2",
		waist="Kentarch Belt +1",
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
		ear1="Digni. Earring",
		ear2="Telos Earring",
		ammo="Expeditious Pinion"
	}
	
	sets.midcast['Fire II'] = sets.midcast.MAB
	sets.midcast['Stone III'] = sets.midcast.MAB
	
	sets.midcast.Tenebral = {
		head = "Pixie Hairpin +1",
		right_ring = "Archon Ring"
	}
	
	sets.midcast['Quad. Continuum'] = sets.midcast.PhysicalAcc
	
	sets.midcast.Enmity = {
		head="Rabid Visor",
		body="Emet Harness +1",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck = "Unmoving Collar +1",
		waist = "Kasiri Belt",
		left_ear = "Cryptic Earring",
		right_ear = "Friomisi Earring",
		left_ring = "Supershear Ring",
		right_ring = "Eihwaz Ring",
		back = "Earthcry Mantle",
		ammo="Sapience Orb"
	}

	sets.midcast.Enhancing = {
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chasuble", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		neck="Mirage Stole +2",
		waist="Olympus Sash",
		ear1="Mimir Earring",
		ear2="Andoaa Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
    	back="Cornflower Cape"
	}
	
	sets.midcast.EnhancingBlueSkill = set_combine(sets.midcast.Enhancing, {
		head="Nyame Helm",
		body="Assimilator's Jubbah +3",
		hands="Nyame Gauntlets",
		legs="Hashishin Tayt +3",
		feet="Luhlaza Charuqs +3",
		ear1="Odnowa Earring +1",
		ear2="Hashi. Earring +1",
		waist="Platinum Moogle Belt"
	})
	
	sets.midcast.Healing = set_combine(sets.midcast.Enhancing, {
		waist="Gishdubar Sash",
		neck="Mirage Stole +2",
		body="Pinga Tunic +1", --15
		hands="Hashishin Bazubands +2",
		legs="Pinga Pants +1", --13
		feet="Medium's Sabots", --11
		ring1="Asklepian Ring",
		ring2="Stikini Ring +1",
		back="Oretania's Cape +1" --6
	})


	sets.midcast["Battery Charge"] = set_combine(sets.midcast.Enhancing, {
		head="Amalric Coif +1",
		waist="Gishdubar Sash",
		back="Grapevine Cape"
	})

	sets.midcast["Aquaveil"] = set_combine(sets.midcast.Enhancing, {
		head="Amalric Coif +1",
		legs="Shedir Seraweels",
		waist="Emphatikos Rope"
	})

	sets.midcast["Magic Fruit"] = sets.midcast.Healing
	sets.midcast["Wild Carrot"] = sets.midcast.Healing
	sets.midcast["White Wind"] = sets.midcast.Healing
	sets.midcast["Healing Breeze"] = sets.midcast.Healing
	sets.midcast["Plenilune Embrace"] = sets.midcast.Healing
	sets.midcast["Cure"] = sets.midcast.Healing
	sets.midcast["Cure II"] = sets.midcast.Healing
	sets.midcast["Cure III"] = sets.midcast.Healing
	sets.midcast["Cure IV"] = sets.midcast.Healing

	sets.midcast["Stoneskin"] = set_combine(sets.midcast.Enhancing, {
		hands="Stone Mufflers",
		neck="Stone Gorget",
		legs="Shedir Seraweels",
		ear1="Earthcry Earring",
		waist="Siegel Sash"
	})
	
	sets.midcast["Phalanx"] = set_combine(sets.midcast.Enhancing, {
		main="Sakpata's Sword",
		head={ name="Taeon Chapeau", augments={'Phalanx +3',}},
		body={ name="Taeon Tabard", augments={'Phalanx +3',}},
		hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
		legs={ name="Taeon Tights", augments={'Phalanx +3',}},
		feet={ name="Taeon Boots", augments={'Phalanx +3',}}
	})

	sets.midcast['Occultation'] = sets.midcast.EnhancingBlueSkill
	sets.midcast['Diamondhide'] = sets.midcast.EnhancingBlueSkill
	sets.midcast['Magic Barrier'] = set_combine(sets.midcast.EnhancingBlueSkill, {
		head="Luhlaza Keffiyeh +1",
		hands="Rawhide Gloves",
		ear1="Njordr Earring"
	})

	sets.midcast['Erratic Flutter'] = sets.midcast.Enhancing
	sets.midcast['Cocoon'] = sets.midcast.Enhancing
	sets.midcast['Reactor Cool'] = sets.midcast.Enhancing
	sets.midcast['Barrier Tusk'] = sets.midcast.Enhancing
	sets.midcast['Nat. Meditation'] = sets.midcast.Enhancing
	sets.midcast['Reaving Wind'] = sets.midcast.MACCFC
	sets.midcast['Feather Tickle'] = sets.midcast.MACCFC
	sets.midcast['Silent Storm'] = sets.midcast.MACC
	sets.midcast['Searing Tempest'] = sets.midcast.MACCWeak
	sets.midcast['Tearing Gust'] = sets.midcast.MACCWeak
	
	--sets.midcast['Fantod'] = sets.midcast.Enhancing
	sets.midcast['Fantod'] = sets.midcast.Enmity
	sets.midcast['Temporal Shift'] = sets.midcast.Enmity
	sets.midcast['Actinic Burst'] = sets.midcast.Enmity
	sets.midcast['Blank Gaze'] = sets.midcast.Enmity
	sets.midcast['Geist Wall'] = sets.midcast.Enmity
	sets.midcast['Jettatura'] = sets.midcast.Enmity

	sets.midcast['Mighty Guard'] = set_combine(sets.midcast.Enhancing, {
		feet="Luhlaza Charuqs +3"
	})
	
	sets.midcast['Memento Mori'] = set_combine(sets.midcast.Enhancing, {
		feet="Luhlaza Charuqs +3"
	})
	
	sets.midcast['Dia'] = set_combine(sets.midcast, {
		feet={ name="Herculean Boots", augments={'"Treasure Hunter"+2',}},
		waist="Chaac Belt",
		ammo="Perfect Lucky Egg"
	})
	
	sets.midcast['Dia II'] = set_combine(sets.midcast, {
		feet={ name="Herculean Boots", augments={'"Treasure Hunter"+2',}},
		waist="Chaac Belt",
		ammo="Perfect Lucky Egg"
	})
	
	sets.midcast['Diaga'] = set_combine(sets.midcast, {
		feet={ name="Herculean Boots", augments={'"Treasure Hunter"+2',}},
		waist="Chaac Belt",
		ammo="Perfect Lucky Egg"
	})

	sets.midcast.Orepheus = {
		waist="Orpheus's Sash"
	}

	Hands_Set_Names = {'Tizona', 'TizonaBunzi', 'Cleave', 'Standard', 'TizonaSakpata'}

	sets.Hands = {}	

	sets.Hands.Standard = { 
		main="Naegling",
		sub="Machaera +2"
	}

	sets.Hands.Cleave = { 
		main="Maxentius",
		sub="Bunzi's Rod"
	}
	
	sets.Hands.Tizona = { 
		main="Tizona",
		sub="Machaera +2"
	}
	
	sets.Hands.TizonaBunzi = { 
		main="Tizona",
		sub="Bunzi's Rod"
	}
	
	sets.Hands.TizonaSakpata = { 
		main="Tizona",
		sub="Sakpata's Sword"
	}

	PWS_Set_Names = {'Normal'}
	sets.PWS = {
		head="Nyame Helm", --Hashishin Kavuk +3										
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Mirage Stole +2",
		waist="Sailfi Belt +1",
		ring1="Ephramad's Ring",  
		ring2="Epaminondas's Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
		ear1="Ishvara Earring",
		ear2="Moonshade Earring"}

	sets.PWS.Normal = set_combine(sets.PWS, {})
	
	sets.midcast['Chant du Cygne'] = set_combine(sets.PWS.Normal, {
		head="Adhemar Bonnet +1",							
		body="Gleti's Cuirass",
		hands="Adhemar Wristbands +1",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		waist="Fotia Belt",
		ear1="Odr Earring",
		ear2="Mache Earring +1",
		ring1="Epona's Ring",
		ring2="Ilabrat Ring",
	})

	-- Magical WS Sets Below
	MWS_Set_Names = {'Normal'}

	sets.MWS  = {
		head="Nyame Helm", --Hashishin Kavuk +3								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sibyl Scarf",
		waist="Eschan Stone",
		ring1="Jhakri Ring",
		ring2="Epaminondas's Ring",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
		ear1="Friomisi Earring",
		ear2="Ishvara Earring"}
	
	--Idle Sets Below
	Idle_Set_Names = {'Normal', 'MagicDT'}
	sets.Idle = {
    	head="Rawhide Mask",							
		body="Jhakri Robe +2",
		hands="Malignance Gloves",
		legs="Carmine Cuisses +1",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Platinum Moogle Belt",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Moonlight Cape",
		ear1="Infused Earring",
		ear2="Telos Earring",
		ammo="Staunch Tathlum +1"
	}

	sets.Idle.Normal = set_combine(sets.Idle, {})

	sets.Idle.MagicDT = set_combine(sets.Idle, {
		head="Nyame Helm",									
		body="Hashishin Mintan +2",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		ring1="Shadow Ring",
		ring2="Archon Ring",
		ear1="Sanare Earring",
		ear2="Eabani Earring"
	})

	Melee_Set_Names = {'DT', 'DTRefresh', 'Crit'}

	sets.Melee = {  
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Mirage Stole +2",
		waist="Reiki Yotai",
		ring1="Petrov Ring",
		ring2="Epona's Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
		ear1="Suppanomimi",
		ear2="Telos Earring",
		ammo="Aurgelmir Orb +1"
	}

	sets.Melee.DT = set_combine(sets.Melee, {})

	sets.Melee.DTRefresh = set_combine(sets.Melee.DT, {
		head="Rawhide Mask",							
		body="Hashishin Mintan +2",		
		hands="Malignance Gloves",
		legs="Rawhide Trousers",
		feet="Malignance Boots",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		ammo="Staunch Tathlum +1"})

	
	sets.Melee.Crit = set_combine(sets.Melee.DT, {
		head="Blistering Sallet +1",							
		body="Gleti's Cuirass",
		hands="Adhemar Wristbands +1",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		ear1="Odr Earring",
		ear2="Mache Earring +1",
		ring1="Epona's Ring",
		ring2="Ilabrat Ring",
	})

	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')
end

function precast(spell)	
	if spell.english:find("Ring") then
		return
	end
	
	if spell.type == 'Misc' then
		return
	end

	if sets.precast[spell.english] then
        if checkWSDistance(spell) then
			equip(sets.precast[spell.english])
		end
	elseif spell.type == 'WeaponSkill' then
		if checkWSDistance(spell) then
			equip(sets.PWS[PWS_Set_Names[PWS_Index]])
		end
	elseif spell.english == 'Spectral Jig'  and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')       
	else 
		equip(sets.precast.FastCast)
    end
end

function midcast(spell)
	if spell.english:find("Ring") then
		return
	end
	
	if spell.type == 'Misc' then
		return
	end
	
	if spell.type == 'WeaponSkill' then
		return
	end
	
	if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
	elseif spell.skill == 'Enhancing Magic' then
		equip(sets.midcast.Enhancing)
	else
		if full_mab then
			equip(sets.midcast.MAB)
		else
			equip(sets.midcast)
		end
		
		if spell.english:find("Tenebral") then
			equip(sets.midcast.Tenebral)
		end

		if spell.target.distance < 5.0 then
			equip(sets.midcast.Orepheus)
		end
	end
end

function aftercast(spell)
	if player.status=='Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	else		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]])		
	end
	
	equip(sets.Hands[Hands_Set_Names[Hands_Index]])
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif new == 'Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]]) 
	end
	
	equip(sets.Hands[Hands_Set_Names[Hands_Index]])
end

--Toggle Self Commands with //gs c [command name] 
--Example type in chat //gs c tp (case sensitive)
--Example Make a macro /console gs c tp (case sensitive)
function self_command(command)
	if command == 'idle' then
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
		
		if Temp_Hands_Index == '' then
			Hands_Index = Hands_Index +1
		else 
			Hands_Index = tonumber(Temp_Hands_Index)
		end
		
		if Hands_Index > #Hands_Set_Names then Hands_Index = 1 end
		add_to_chat(207,'Hands Set Changed to: '..Hands_Set_Names[Hands_Index]..'')
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
	elseif command == 'pws' then
		PWS_Index = PWS_Index +1
		if PWS_Index > #PWS_Set_Names then PWS_Index = 1 end
		add_to_chat(207,'Physical WS Set Changed to: '..PWS_Set_Names[PWS_Index]..'')
	elseif command == 'mws' then
		MWS_Index = MWS_Index +1
		if MWS_Index > #MWS_Set_Names then MWS_Index = 1 end
		add_to_chat(207,'Magical WS Set Changed to: '..MWS_Set_Names[MWS_Index]..'')
	elseif command == 'update' then
		status_change(player.status)
		add_to_chat(207,'Update player status...')
	elseif command == 'mab' then
		add_to_chat(207,'Mab Set: '..tostring(not Full_Mab)..'')

		Full_Mab = not Full_Mab
	elseif command == 'equiptf' then
		equip(sets.MWS[MWS_Set_Names[MWS_Index]])
	elseif command == 'equipws' then
		equip(sets.PWS[PWS_Set_Names[PWS_Index]])
	elseif command == 'equipidle' then
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif command == 'equipmelee' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	elseif command == 'startup' then
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif command == 'cleavebuff' then
		send_command('input /ma "Shell II" <me>;wait 5;input /ma "Battery Charge" <me>;wait 5;input /ma "Phalanx" <me>;wait 5;input /ma "Stoneskin" <me>;wait 5;input /ma "Aquaveil" <me>;wait 5;input /ma "Occultation" <me>;wait 5;input /ma "Erratic Flutter" <me>;wait 5;input /ma "Reactor Cool" <me>;wait 5;input /ja "Diffusion" <me>;wait 2;input /ja "Unbridled Learning" <me>;wait 2;input /ma "Mighty Guard" <me>;')
	elseif command == 'cleavebuffblm' then
		send_command('input /ma "Battery Charge" <me>;wait 5;input /ma "Diamondhide" <me>;wait 5;input /ma "Barrier Tusk" <me>;wait 5;input /ma "Occultation" <me>;wait 5;input /ma "Erratic Flutter" <me>;wait 5;input /ma "Reactor Cool" <me>;wait 5;wait 5;input /ja "Diffusion" <me>;wait 2;input /ja "Unbridled Learning" <me>;wait 2;input /ma "Mighty Guard" <me>;')
	elseif command == 'meleebuff' then
		send_command('input /ma "Barrier Tusk" <me>;wait 7;input /ma "Erratic Flutter" <me>;wait 5;input /ma "Cocoon" <me>;wait 5;input /ma "Nat. Meditation" <me>;wait 5;wait 5;input /ja "Diffusion" <me>;wait 2;input /ja "Unbridled Learning" <me>;wait 2;input /ma "Mighty Guard" <me>;')
	elseif command == 'blm' then
		send_command('input /macro book 14;');
	elseif command == 'whm' then
		send_command('input /macro book 15;');
	elseif command == 'rdm' then
		send_command('input /macro book 16;');
	elseif command == 'geo' then
		send_command('input /macro book 20;')
	end
end

function file_unload()
	
end
