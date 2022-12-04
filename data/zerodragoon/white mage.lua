include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	Cure_Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	SIRD_Flag = false
	BURST_Flag = false
	CUREDT_Flag = false
	Style_Lock_Id = 13

	--Default Macro Set for RNG
	send_command('input /macro book 15;wait .1;input /macro set 1;wait 0.5;input //gs org;wait 1;input //lua l nostrum; wait 1;input //nos profile default')
	
	set_style_lock()
	
	--Hands Sets
	Hands_Set_Names = {'Daybreak', 'Chatoyant', 'Yagrush', 'Raetic'}
	Cure_Hands_Set_Names = {'Chatoyant', 'Daybreak', 'Raetic'}

	sets.Hands = {}	

	sets.Hands.Daybreak = { 
		main="Daybreak",
		sub="Genmei Shield"
	}
	
	sets.Hands.Gada = { 
		main="Gada"
	}
	
	sets.Hands.Bolelabunga = { 
		main="Bolelabunga"
	}
	
	sets.Hands.Yagrush = { 
		main="Yagrush"
	}
	
	sets.Hands.Chatoyant = {
		main="Chatoyant Staff",
		sub="Enki Strap"
	}
	
	sets.Hands.Raetic = { 
		main="Raetic Rod +1",
		sub="Genmei Shield"
	}

	--Precast
	sets.precast = {}
	
	sets.precast.FastCast = { --10 Light Arts
		ammo="Sapience Orb", --2
		head="Volte Beret", --6
		body="Inyanga Jubbah +2", --14
		hands="Fanatic Gloves", --7 
		legs="Ayanmo Cosciales +2", --6
		feet="Chironic Slippers", --5
		waist="Witful Belt", --3 --3
		neck="Cleric's Torque +2", --10
		left_ear="Malignance Earring", --4
		right_ear="Loquac. Earring", --2
		left_ring="Kishar Ring", --4
		right_ring="Weatherspoon Ring +1", --5 --3
		back="Fi Follet Cape +1" --10
	} -- --6
	
	sets.precast['Benediction'] =  {
		body="Piety Bliaut +3"
	}
	
	sets.precast['Dispelga'] = set_combine(sets.FastCast, {
		main="Daybreak",
		sub="Genmei Shield"
	})
	
	--Midcast Sets
	sets.midcast = {
		
	}

	sets.midcast.SIRD = {
		ammo="Staunch Tathlum +1", --11
		head="Kaykaus Mitra +1", --12
		body="Kaykaus Bliaut +1", --12
		hands="Telchine Gloves" , --10
		legs="Querkening Brais", --15
		feet="Vanya Clogs", --15
		waist="Rumination Sash", --10
		left_ring="Freke Ring", --10
		back="Fi Follet Cape +1" --5
	} --100

	sets.midcast.Gishdubar = {
		waist="Gishdubar Sash"
	}

	sets.midcast.Obi = {
		waist="Hachirin-no-Obi"
	}
	
	sets.midcast.Twilight = {
		back="Twilight Cape"
	}

	sets.midcast.RefreshRec = set_combine(sets.midcast.Gishdubar, {
		waist="Gishdubar Sash",
		feet="Inspirited Boots",
		back="Grapevine Cape"
	})	

	sets.midcast.enfeeb = {
		main="Contemplator +1",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		body="Cohort Cloak +1",
		hands="Piety Mitts +3",
		legs="Inyanga Shalwar +2",
		feet="Theophany Duckbills +3",
		neck="Incanter's Torque",
		waist="Obstinate Sash",
		ear1="Regal Earring",
		ear2="Dignitary's Earring",
		ring1="Kishar Ring",
		ring2="Stikini Ring +1",
		back="Izdubar Mantle"
	}
	
	sets.midcast['Dispelga'] = set_combine(sets.midcast.enfeeb, {
		main="Daybreak",
		sub="Genmei Shield"
	})
	
	sets.midcast.elemental = set_combine(sets.Hands.Daybreak, {
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		body="Cohort Cloak +1",
		hands="Fanatic Gloves",
		legs="Lengo Pants",
		feet="Chironic Slippers",
		neck="Baetyl Pendant",
		waist="Sacro Cord",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Freke Ring",
		right_ring="Weatherspoon Ring +1",
		back="Izdubar Mantle"
	})

	--Cure Sets
	sets.midcast.cure = {
		ammo="Pemphredo Tathlum",
		head="Kaykaus Mitra +1",
		hands="Kaykaus Cuffs +1",
		neck="Cleric's Torque +2",
		body="Ebers Bliaut +2",
		feet="Kaykaus Boots +1",
		legs="Ebers Pantaloons +2",
		left_ear="Glorious Earring",
		right_ear="Ebers Earring +1",
		waist="Rumination Sash",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Alaunus's Cape"
	}
	
	sets.midcast.curaga = set_combine(sets.midcast.cure, {
		body="Kaykaus Bliaut +1",
		back="Twilight Cape"
	})
	
	sets.midcast.curedt = {
		ammo="Staunch Tathlum +1",
		head="Nyame Helm", 
		body="Ebers Bliaut +2",
		hands="Bunzi's Gloves",
		legs="Ebers Pant. +2",
		feet="Kaykaus Boots +1",
		neck="Cleric's Torque +2",
		waist="Luminary Sash",
		left_ear="Glorious Earring",
		right_ear="Ebers Earring +1",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		back="Alaunus's Cape"
	}
	
	sets.midcast.curagadt = set_combine(sets.midcast.curedt, {
		body="Kaykaus Bliaut +1"
	})
	
	sets.midcast.status = set_combine(sets.midcast.cure, set_combine(sets.Hands.Yagrush, {
		hands="Ebers Mitts +2",
		legs="Ebers Pantaloons +2"
	}))

	sets.midcast.Cursna =  set_combine(sets.midcast.status, { --25 (From Cape)
		head="Kaykaus Mitra +1",
		hands="Fanatic Gloves", --15
		legs="Theophany Pantaloons +3", --21
		feet="Vanya Clogs", --5
		neck="Debilis Medallion", --15
		ring1="Haoma's Ring", --15
		ring2="Menelaus's Ring" --20
	})
	
	sets.midcast.Erase = sets.midcast.status
	sets.midcast.Poisona = sets.midcast.status
	sets.midcast.Paralyna = sets.midcast.status
	sets.midcast.Blindna = sets.midcast.status
	sets.midcast.Silena = sets.midcast.status
	sets.midcast.Viruna = sets.midcast.status
	sets.midcast.Stona = sets.midcast.status
	sets.midcast.Esuna = sets.midcast.status
	
	sets.midcast.Enhancing = set_combine(sets.Hands.Gada, {
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
	})

	sets.midcast["Regen IV"] = set_combine(sets.midcast.Enhancing, set_combine(sets.Hands.Bolelabunga, {
		head="Inyanga Tiara +2",
		hands="Ebers Mitts +2",
		body="Piety Bliaut +3",
		feet="Bunzi's Sabots",
		legs="Theophany Pantaloons +3" --Add in Bunzi Feet Once Auged
	}))
	
	sets.midcast["Stoneskin"] = set_combine(sets.midcast.Enhancing, {
		legs="Shedir Seraweels",
		feet="Theophany Duckbills +3",
		ear1="Earthcry Earring",
		neck="Nodens Gorget",
		waist="Siegel Sash"
	})
	
	sets.midcast["Aquaveil"] = set_combine(sets.midcast.Enhancing, {
		legs="Shedir Seraweels",
		hands="Regal Cuffs",
		waist="Emphatikos Rope"
	})

	sets.midcast["Refresh"] = sets.midcast.Enhancing
	
	sets.midcast["Protectra V"] = set_combine(sets.midcast.Enhancing, {
		ring1="Sheltered Ring"
	})
	sets.midcast["Shellra V"] = set_combine(sets.midcast.Enhancing, {
		ring1="Sheltered Ring"
	})
	sets.midcast["Protect V"] = set_combine(sets.midcast.Enhancing, {
		ring1="Sheltered Ring"
	})
	sets.midcast["Shell V"] = set_combine(sets.midcast.Enhancing, {
		ring1="Sheltered Ring"
	})
	sets.midcast["Auspice"] = set_combine(sets.midcast.Enhancing, {
		feet="Ebers Duckbills +2"
	})
	
	sets.midcast.Barspell = set_combine(sets.midcast.Enhancing,{
		sub="Ammurapi Shield",
		head="Ebers Cap +2",
		body="Ebers Bliaut +2",
		hands="Ebers Mitts +2",
		legs="Piety Pantaln. +3",
		feet="Ebers Duckbills +2"
	})
	
	sets.midcast.BarspellDebuff = set_combine(sets.midcast.Barspell ,{
		neck="Sroda Necklace",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chasuble", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
	})
	
	sets.midcast.Barstonra = sets.midcast.Barspell
	sets.midcast.Barwatera = sets.midcast.Barspell
	sets.midcast.Baraera = sets.midcast.Barspell
	sets.midcast.Barfira = sets.midcast.Barspell
	sets.midcast.Barblizzara = sets.midcast.Barspell
	sets.midcast.Barthundra = sets.midcast.Barspell

	sets.midcast.Barvira = sets.midcast.BarspellDebuff
	sets.midcast.Barpetra = sets.midcast.BarspellDebuff
	sets.midcast.Baramnesra = sets.midcast.BarspellDebuff
	sets.midcast.Barpoisonra = sets.midcast.BarspellDebuff
	sets.midcast.Barparalyzra = sets.midcast.BarspellDebuff
	sets.midcast.Barsilencera = sets.midcast.BarspellDebuff
	sets.midcast.Barsleepra = sets.midcast.BarspellDebuff
	sets.midcast.Barblindra = sets.midcast.BarspellDebuff

	--Idle Sets Below
	Idle_Set_Names = {'Normal', 'Move', 'Sublimation', 'DT'}
	sets.Idle = {
		ammo="Homiliary",
		sub="Genmei Shield",
		head="Inyanga Tiara +2",
		body="Shamash Robe",
		hands="Inyanga Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet="Inyanga Crackows +2",
		neck="Loricate Torque +1",
		waist="Fucho-no-obi",
		left_ear="Ethereal Earring",
		right_ear="Infused Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Moonlight Cape",
	}

	sets.Idle.Normal = set_combine(sets.Idle, {})
	
	sets.Idle.Move = set_combine(sets.Idle, {
		feet="Herald's Gaiters" 
	})
	
	sets.Idle.Sublimation = set_combine(sets.Idle, {
		waist="Embla Sash"
	})

	sets.Idle.DT = set_combine(sets.Idle, {
		ammo="Staunch Tathlum +1",
		neck="Loricate Torque +1",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		back="Moonlight Cape",
	})

	--Melee Sets
	Melee_Set_Names = {'Standard'}
	
	sets.Melee = {
		head="Ayanmo Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Bunzi's Gloves",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Lissome Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
		right_ear="Dedition Earring",
		left_ring="Ilabrat Ring",
		right_ring="Petrov Ring"
	}

	sets.Melee.Standard = set_combine(sets.Idle, {})
	
	sets.WS = {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Clr. Torque +2",
		waist="Fotia Belt",
		left_ear="Regal Earring",
		right_ear="Moonshade Earring",
		left_ring="Ilabrat Ring",
		right_ring="Epaminondas's Ring",
		--back="Atheling Mantle"
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
        equip(sets.precast[spell.english])
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
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
	
	if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
		
		if spell.english:find("Refresh") and spell.target.name == "Zerodragoon" then
			equip(sets.midcast.RefreshRec)
		end
	elseif spell.type == 'WeaponSkill' then
		equip(sets.WS)
	elseif spell.skill == 'Divine Magic' or spell.type == 'BlackMagic' then
		equip(sets.midcast.elemental) 
	elseif spell.skill == 'Enhancing Magic' then
		equip(sets.midcast.Enhancing)
	elseif spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast.enfeeb)
	elseif spell.english:find("Cur") then 
		if CUREDT_Flag then
			equip(sets.midcast.curedt)

			if spell.english:find("Curaga") then 
				equip(sets.midcast.curagadt)
			end
		else
			equip(sets.midcast.cure)

			if spell.english:find("Curaga") then 
				equip(sets.midcast.curaga)		
			end
		end
		
		equip(sets.Hands[Cure_Hands_Set_Names[Cure_Hands_Index]])
	
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
	else		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]])
		
		if buffactive['Sublimation: Activated'] then
			equip(sets.Idle.Sublimation)
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
	elseif command:sub(1, 9) == 'curehands' then
		Temp_Hands_Index = command:sub(10,12)

		if Temp_Hands_Index == '' then
			Cure_Hands_Index = Cure_Hands_Index +1
		else 
			Cure_Hands_Index = tonumber(Temp_Hands_Index)
		end
		
		if Cure_Hands_Index > #Cure_Hands_Set_Names then Cure_Hands_Index = 1 end
		add_to_chat(207,'Cure Hands Set Changed to: '..Cure_Hands_Set_Names[Cure_Hands_Index]..'')
	elseif command == 'sird' then
		SIRD_Flag = not SIRD_Flag
	elseif command == 'burst' then
		add_to_chat(207,'Burst Set: '..tostring(not BURST_Flag)..'')
		BURST_Flag = not BURST_Flag
	elseif command == 'curedt' then
		add_to_chat(207,'CureDT Set: '..tostring(not CUREDT_Flag)..'')
		CUREDT_Flag = not CUREDT_Flag
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
	elseif command == 'smn' then
		send_command('input /macro book 11;')
	end
end

function file_unload()
	send_command('input //lua u nostrum')
end
