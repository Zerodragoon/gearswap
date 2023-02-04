include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	BURST_Flag = false
	AFBody_Flag = false
	Occult_Flag = false
	Style_Lock_Id = 13
	
	--Default Macro Set for RNG
	send_command('input /macro book 14;wait .1;input /macro set 1;wait 0.5;input //gs org')
	
	set_style_lock()
	
	--Hands Sets
	Hands_Set_Names = {'Marin', 'Lathi', 'Mpaca', 'Xoanon'}

	sets.Hands = {}	
	
	sets.Hands.Lathi = { 
		main="Lathi",
    	sub="Enki Strap"
	}
	
	sets.Hands.Mpaca = {
		main="Mpaca's Staff",
		sub="Enki Strap"
	}
	
	sets.Hands.Marin = {
		main="Marin Staff +1",
		sub="Enki Strap"
	}
	
	sets.Hands.Xoanon = {
		main="Xoanon",
		sub="Khonsu"
	}

	sets.Hands.Daybreak = { 
		main="Daybreak",
    	sub="Sors Shield"
	}

	sets.Hands.Gada = { 
		main="Gada",
    	sub="Sors Shield"
	}

	--Precast
	sets.precast = {}
	
	sets.precast.FastCast = {
		ammo="Sapience Orb", --2
		head={ name="Merlinic Hood", augments={'"Fast Cast"+7','CHR+6','Mag. Acc.+6','"Mag.Atk.Bns."+14',}}, --15
		body="Shango Robe", --8
		hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+28','"Fast Cast"+7','INT+7',}}, --7
		legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+9','"Fast Cast"+7','MND+1','Mag. Acc.+15',}}, --7
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7',}}, --12
		waist="Witful Belt", --3 --3
		neck="Baetyl Pendant", --4
		left_ear="Malignance Earring", --4
		right_ear="Loquac. Earring", --2
		left_ring="Kishar Ring", --4
		right_ring="Weatherspoon Ring +1", --5 --3
		back="Fi Follet Cape +1" --10
	} --83 --6
	
	sets.precast['Dispelga'] = set_combine(sets.FastCast, {
		main="Daybreak",
		sub="Genmei Shield"
	})
	
	sets.precast['Mana Wall'] = {
		feet="Wicce Sabots +2",
		back="Taranus's Cape"
	}
	
	sets.precast['Manafont'] = {
		body="Archmage's Coat +1"
	}
	
	sets.precast['Impact'] = set_combine(sets.FastCast, {
		head=empty,
		body="Crepuscular Cloak"
	})

	--Midcast Sets
	sets.midcast = {
		
	}

	sets.midcast.Orepheus = {
		waist="Orpheus's Sash"
	}

	sets.midcast.Gishdubar = {
		waist="Gishdubar Sash"
	}

	sets.midcast.Obi = {
		waist="Hachirin-no-Obi"
	}

	sets.midcast.RefreshRec = set_combine(sets.midcast.Gishdubar, {
		waist="Gishdubar Sash",
		feet="Inspirited Boots",
		back="Grapevine Cape"
	})	

	--Black Magic Sets
	sets.midcast.elemental = {
		ammo="Pemphredo Tathlum",
		head="Agwu's Cap", 
		body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1",
		neck="Sorcerer's Stole +1",
		waist="Sacro Cord",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Freke Ring",
		right_ring="Metamorph Ring +1",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10'}}
	}

	sets.midcast.Burst = set_combine(sets.midcast.elemental, {
		head="Ea Hat +1",
    	body="Ea Houppe. +1", --Wicce Coat
		hands="Agwu's Gages",
    	legs="Ea Slops +1", --Wicce Legs
    	feet="Agwu's Pigaches",
		waist="Acuity Belt +1",
		ammo="Ghastly Tathlum +1"
	})
	
	--Ja Spells Sets
	sets.midcast.ja = {
		legs="Wicce Chausses +2"
	}
	
	--AF Body Set
	sets.midcast.afbody = {
		body="Spaekona's Coat +3"
	}
	
	sets.midcast.Occult = set_combine(sets.midcast.elemental, {
		head="Mall. Chapeau +2",
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+10','INT+10','Mag. Acc.+5','"Mag.Atk.Bns."+9',}},
		hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+27','"Occult Acumen"+10','MND+10',}},
		legs="Perdition Slops",
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','"Occult Acumen"+11',}},
		neck="Combatant's Torque",
		waist="Oneiros Rope",
		left_ear="Dedition Earring",
		right_ear="Crep. Earring",
		left_ring="Petrov Ring",
		right_ring="Chirich Ring +1",
		ammo="Seraphic Ampulla",
		back={ name="Taranus's Cape", augments={'INT+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}}
	})

	sets.midcast.enfeeb = set_combine(sets.midcast.elemental, {
		main="Contemplator +1",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		body="Cohort Cloak +1",
		hands="Regal Cuffs",
		legs="Spaekona's Tonban +3", 
		feet="Archmage's Sabots +3",
		neck="Sorcerer's Stole +1",
		waist="Acuity Belt +1",
		ear1="Malignance Earring",
		ear2="Regal Earring",
		ring1="Kishar Ring",
		ring2="Metamorph Ring +1",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10'}}
	})
	
	sets.midcast.Impact = set_combine(sets.midcast.enfeeb, {
		head=empty,
		body="Crepuscular Cloak"
	})
	
	sets.midcast.dark = set_combine(sets.midcast.enfeeb, {
		neck="Erra Pendant",
		hands="Archmage's Gloves +3",
		feet="Archmage's Sabots +3",
		ring1="Archon Ring"
	})
	
	sets.midcast.Drain = set_combine(sets.midcast.dark, {
		head="Pixie Hairpin +1",
		body="Amalric Doublet +1",
		feet="Agwu's Pigaches",
		left_ear="Hirudinea Earring",
        right_ring="Evanescence Ring",
        waist="Fucho-no-obi",	})
	
	sets.midcast['Drain II'] = sets.midcast.Drain
	sets.midcast['Drain III'] = sets.midcast.Drain
	
	sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast['Aspir II'] = sets.midcast.Drain
	sets.midcast['Aspir III'] = sets.midcast.Drain

	sets.midcast.elementaldebuff = set_combine(sets.midcast.enfeeb, {
		hands="Archmage's Gloves +3",
		legs="Archmage's Tonban +3"
	})
	
	sets.midcast.Shock = sets.midcast.elementaldebuff
	sets.midcast.Rasp = sets.midcast.elementaldebuff
	sets.midcast.Choke = sets.midcast.elementaldebuff
	sets.midcast.Frost = sets.midcast.elementaldebuff
	sets.midcast.Burn = sets.midcast.elementaldebuff
	sets.midcast.Drown = sets.midcast.elementaldebuff
	
	sets.midcast['Dispelga'] = set_combine(sets.midcast.enfeeb, {
		main="Daybreak",
		sub="Genmei Shield"
	})
	
	sets.midcast['Dia II'] = set_combine(sets.midcast.enfeeb, {
		ammo="Perfect Lucky Egg",
		waist="Chaac Belt",
		body="Volte Jupon"
	})
	
	--Cure Sets
	sets.midcast.cure = set_combine(sets.Hands.Daybreak, {
		ammo="Staunch Tathlum +1",
		neck="Incanter's Torque",
		feet="Vanya Clogs",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		waist="Rumination Sash",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Oretania's Cape +1" 
	})

	sets.midcast.Cursna = {
		feet="Vanya Clogs",
		back="Oretania's Cape +1",
		ring2="Menelaus's Ring"
	}

	sets.midcast.Enhancing = set_combine(sets.Hands.Gada, {
		sub="Ammurapi Shield",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chasuble", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		back="Fi Follet Cape +1",
		waist="Embla Sash",
		ear1="Mimir Earring",
		ear2="Andoaa Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
	})

	sets.midcast["Refresh"] = set_combine(sets.midcast.Enhancing, {
		head="Amalric Coif +1"
	})
	
	sets.midcast["Aquaveil"] = set_combine(sets.midcast.Enhancing, {
		head="Amalric Coif +1",
		heads="Regal Cuffs",
		legs="Shedir Seraweels",
		waist="Emphatikos Rope"
	})
	
	sets.midcast["Stoneskin"] = set_combine(sets.midcast.Enhancing, {
		legs="Shedir Seraweels",
		ear1="Earthcry Earring",
		neck="Nodens Gorget",
		waist="Siegel Sash"
	})
	
	sets.midcast.Death = set_combine(sets.midcast.elemental, {
		head="Pixie Hairpin +1",
		body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1",
		ring2="Archon Ring",
		waist="Acuity Belt +1",
		neck="Sanctity Necklace",
		ear1="Barkarole Earring",
		ring1="Mephitas's Ring +1"
	})
	
	sets.midcast.DeathBurst = set_combine(sets.midcast.Death, {
		--Wicce Coat +3
		--Agwu's Hands
		--Wicce Legs +3
	})


	--Idle Sets Below
	Idle_Set_Names = {'Normal', 'DT'}
	sets.Idle = {
		ammo="Homiliary",
		head="Volte Beret",
		--body="Jhakri Robe +2",Glo
		body="Shamash Robe",
		hands="Volte Gloves",
		legs="Lengo Pants",
		feet="Herald's Gaiters",
		neck="Loricate Torque +1",
		waist="Fucho-no-obi",
		left_ear="Ethereal Earring",
		right_ear="Infused Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Moonlight Cape",
	}

	sets.Idle.Normal = set_combine(sets.Idle, {})
	
	sets.Idle.Sublimation = set_combine(sets.Idle, {
		waist="Embla Sash"
	})

	sets.Idle.DT = set_combine(sets.Idle, {
		head="Nyame Helm",
		feet="Nyame Sollerets",
		hands="Nyame Gauntlets",
    	right_ring="Defending Ring"
	})
	
	sets.Idle.Manawall = set_combine(sets.Idle.DT, sets.precast['Mana Wall'])

	--Melee Sets
	Melee_Set_Names = {'Standard'}

	sets.Melee = {
		head="Blistering Sallet +1",
		body="Nyame Mail",
		hands="Gazu Bracelets +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Lissome Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Crepuscular Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Taranus's Cape", augments={'INT+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}}
	}

	sets.Melee.Standard = set_combine(sets.Melee, {})
	
	sets.WS = set_combine(sets.Melee, {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",		
		waist="Kentarch Belt +1",
		left_ear="Mache Earring +1",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10'}}
	})
	
	sets.WSMagic = set_combine(sets.Melee, {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",	
		neck="Sibyl Scarf",		
		waist="Orpheus's Sash",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Freke Ring",
		right_ring="Metamorph Ring +1",
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10'}}
	})
	
	sets.precast['Earth Crusher'] = set_combine(sets.WSMagic, {
		neck="Quanpur Necklace"
	})
	
	sets.precast['Rock Crusher'] = set_combine(sets.WSMagic, {
		neck="Quanpur Necklace"
	})
	
	sets.precast['Cataclysm'] = set_combine(sets.WSMagic, {
		head="Pixie Hairpin +1",
		body="Amalric Doublet +1", 
		legs="Amalric Slops +1",
		left_ring="Archon Ring",
	})
	
	sets.precast['Myrkr'] = {
		head="Pixie Hairpin +1",
		body="Amalric Doublet +1", 
		hands="Regal Cuffs",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1",
		neck="Sanctity Necklace",
		waist="Luminary Sash",
		left_ear="Loquacious Earring",
		right_ear="Regal Earring", 
		left_ring="Mephitas's Ring",
		right_ring="Mephitas's Ring +1",
		back="Fi Follet Cape +1"
	} 

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
			equip(sets.WS)
		end
	else 
		equip(sets.precast.FastCast)
    end
end

function midcast(spell)
	if spell.english:find("Ring") then
		return
	end
	
	if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
		
		if spell.english:find("Refresh") and spell.target.name == "Zerodragoon" then
			equip(sets.midcast.RefreshRec)
		end
		
		if spell.english:find("Death") then
			equip(sets.midcast.DeathBurst)
		end
	elseif spell.skill == 'Enhancing Magic' then
		equip(sets.midcast.Enhancing)
	elseif spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast.enfeeb)
	elseif spell.skill == 'Dark Magic' then
		equip(sets.midcast.dark)
	elseif spell.type == "BlackMagic" then
		if BURST_Flag then
			equip(sets.midcast.Burst)
		else 
			equip(sets.midcast.elemental)
		end
		
		if spell.english:match("Stone") or spell.english:match("Quake") then
			equip({neck="Quanpur Necklace"})
		end
		
		if spell.english:match("ja$") then
			equip(sets.midcast.ja)
		end
		
		if AFBody_Flag then
			equip(sets.midcast.afbody)
		end

		if spell.target.distance < 5.0 then
			equip(sets.midcast.Orepheus)
		end

		if  spell.element == world.weather_element or
    			spell.element == world.day_element or 
    			(spell.element == 'Lightning' and buffactive['Thunderstorm']) or 
    			(spell.element == 'Ice' and buffactive['Hailstorm']) or 
    			(spell.element == 'Water' and buffactive['Rainstorm']) or 
    			(spell.element == 'Fire' and buffactive['Firestorm']) or 
    			(spell.element == 'Earth' and buffactive['Sandstorm']) or 
   			(spell.element == 'Wind' and buffactive['Windstorm']) or 
   			(spell.element == 'Light' and buffactive['Aurorastorm']) or 
    			(spell.element == 'Dark' and buffactive['Voidstorm']) then 
 			equip(sets.midcast.Obi)
		end
		
		if Occult_Flag then
			equip(sets.midcast.Occult)
		end
	elseif spell.english:find("Cur") then 
		equip(sets.midcast.cure)       

		if  spell.element == world.weather_element or
    			spell.element == world.day_element or 
			(spell.element == 'Light' and buffactive['Aurorastorm']) then
			equip(sets.midcast.Obi)
		end
	end 
end

function aftercast(spell)	
	if player.status=='Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
		
		if buffactive['Mana Wall'] then
			equip(sets.precast['Mana Wall'])
		end	
	else		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]])
		
		if buffactive['Sublimation: Activated'] then
			equip(sets.Idle.Sublimation)
		end
		
		if buffactive['Mana Wall'] then
			equip(sets.Idle.Manawall)
		end	
	end
	
	equip(sets.Hands[Hands_Set_Names[Hands_Index]])
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
		
		if buffactive['Sublimation: Activated'] then
			equip(sets.Idle.Sublimation)
		end	

		if buffactive['Mana Wall'] then
			equip(sets.Idle.Manawall)
		end			
	elseif new == 'Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]]) 
		
		if buffactive['Mana Wall'] then
			equip(sets.precast['Mana Wall'])
		end	
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
	elseif command:sub(1, 5) == 'melee' then
		Temp_Melee_Index = command:sub(6,8)

		if Temp_Melee_Index == '' then
			Melee_Index = Melee_Index +1
		else 
			Melee_Index = tonumber(Temp_Melee_Index)
		end
	
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
	elseif command == 'burst' then
		add_to_chat(207,'Burst Set: '..tostring(not BURST_Flag)..'')
		BURST_Flag = not BURST_Flag
	elseif command == 'mpnuke' then
		add_to_chat(207,'AF Body Set: '..tostring(not AFBody_Flag)..'')
		AFBody_Flag = not AFBody_Flag
	elseif command == 'occult' then
		add_to_chat(207,'Occult Set: '..tostring(not Occult_Flag)..'')
		Occult_Flag = not Occult_Flag
	elseif command =='element' then
		Nuke_Index = Nuke_Index +1

		if Nuke_Index > #Nuke_Elements then 
			Nuke_Index = 1
		end
		
		add_to_chat(207,'Element Changed to: '..Nuke_Elements[Nuke_Index]..'')
	elseif command:sub(1, 7) == 'nukeaoe' then
		Nuke_Tier = command:sub(8,9)
		
		send_command('input /ma "'..getNukeString(Blm_Aoe_Elements[Nuke_Index], Nuke_Tier)..'" <t> ')
	elseif command:sub(1, 6) == 'nukeja' then
		send_command('input /ma "'..getNukeString(Nuke_Ja_Elements[Nuke_Index], 1)..'" <t> ')
	elseif command:sub(1, 7) == 'nukeanc' then
		Nuke_Tier = command:sub(8,9)
		
		send_command('input /ma "'..getNukeString(Anc_Nuke_Elements[Nuke_Index], Nuke_Tier)..'" <t> ')
	elseif command:sub(1, 4) == 'nuke' then
		Nuke_Tier = command:sub(5,6)
		
		send_command('input /ma "'..getNukeString(Nuke_Elements[Nuke_Index], Nuke_Tier)..'" <t> ')
	elseif command == 'equipidle' then
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif command == 'equipmelee' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	elseif command == 'startup' then
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif command == 'blm' then
		send_command('input /macro book 14;')
	elseif command == 'whm' then
		send_command('input /macro book 15;')
	elseif command == 'rdm' then
		send_command('input /macro book 16;')
	elseif command == 'sch' then
		send_command('input /macro book 19;')
	elseif command == 'geo' then
		send_command('input /macro book 20;')
	end
end

function file_unload()
	
end
