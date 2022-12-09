include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	Instrument_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	Lullaby_Short = false
	BURST_Flag = false
	Dummy_Flag = false
	Style_Lock_Id = 20

	--Default Macro Set for RNG
	send_command('input /macro book 18;wait .1;input /macro set 1;wait .1;input //lua load singer;wait 0.5;input //gs org;wait 2.0; input /lockstyleset 20')
	
	set_style_lock()
	
	--Hands Sets
	Hands_Set_Names = {'CarnShield', 'CarnDual', 'NaeglingCrep', 'NaeglingTP', 'NaeglingShield', 'Twashtar', 'TwashtarCrep', 'TwashtarTP', 'TwashtarShield', 'NaeglingKraken', 'CarnKraken', 'TwashKraken', 'AeneasKraken'}

	sets.Hands = {}	
	
	sets.Hands.Twashtar = { 
		main="Twashtar",
		sub="Aeneas"
	}
	
	sets.Hands.TwashtarCrep = { 
		main="Twashtar",
		sub="Crepuscular Knife"
	}
	
	sets.Hands.TwashtarTP = { 
		main="Twashtar",
		sub="Fusetto +2"
	}
	
	sets.Hands.TwashtarShield = { 
		main="Twashtar",
		sub="Genmei Shield"
	}
	
	sets.Hands.CarnShield = { 
		main="Carnwenhan",
		sub="Genmei Shield"
	}
	
	sets.Hands.CarnDual = { 
		main="Carnwenhan",
		sub="Crepuscular Knife"
	}
	
	sets.Hands.NaeglingCrep = { 
		main="Naegling",
		sub="Crepuscular Knife"
	}

	sets.Hands.NaeglingTP = { 
		main="Naegling",
		sub="Fusetto +2"
	}
	
	sets.Hands.NaeglingShield = { 
		main="Naegling",
		sub="Genmei Shield"
	}
	
	sets.Hands.NaeglingKraken = { 
		main="Naegling",
		sub="Kraken Club"
	}
	
	sets.Hands.CarnKraken = { 
		main="Carnwenhan",
		sub="Kraken Club"
	}
	
	sets.Hands.TwashKraken = { 
		main="Twashtar",
		sub="Kraken Club"
	}
	
	sets.Hands.AeneasKraken = { 
		main="Aeneas",
		sub="Kraken Club"
	}

	sets.Hands.Daybreak = {
		main="Daybreak"
	}

	--Instrument Sets
	Instrument_Set_Names = {'Gjallarhorn', 'Daurdabla', 'Blurred', 'Marsyas'}

	sets.Instruments = {}	
	
	sets.Instruments.Gjallarhorn = { 
		ranged="Gjallarhorn"
	}

	sets.Instruments.Blurred = { 
		ranged="Blurred Harp +1"
	}
	
	sets.Instruments.Daurdabla = {
		ranged="Daurdabla"
	}
	
	sets.Instruments.Marsyas = {
		ranged="Marsyas"
	}
	
	sets.Instruments.Prime = {
		ranged="Prime Horn"
	}
	
	--Precast
	sets.precast = {}
	
	sets.Waltz = {
		legs="Dashing Subligar",
		ring1="Asklepian Ring",
		ring2="Valseur's Ring", --3
		ear1="Enchanter's Earring +1",
		ear2="Handler's Earring +1",
		waist="Gishdubar Sash"
	}
		
	sets.precast.SongCast = { --5
		head="Fili Calot +1", --14
		body="Inyanga Jubbah +2", --14
		hands="Leyline Gloves", --8
		legs="Ayanmo Cosciales +2", --6
		feet="Chironic Slippers", --5
		waist="Witful Belt", --3 --3
		neck="Baetyl Pendant", --4
		left_ear="Enchanter's Earring +1", --2
		right_ear="Loquac. Earring", --2
		left_ring="Kishar Ring", --4
		right_ring="Weatherspoon Ring +1", --5 --3
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}} --10
	} --82 --6
	
	sets.precast.FastCast = set_combine(sets.precast.SongCast, {
		ammo="Sapience Orb", --2
		head="Volte Beret" --6
	}) --76 --6
	
	sets.precast['Curing Waltz III'] = sets.Waltz
	
	sets.precast['Soul Voice'] = {
		legs="Bihu Cannions +3"
	}
	
	sets.precast['Troubadour'] = {
		body="Bihu Justaucorps +3"
	}
	
	sets.precast['Nightingale'] = {
		feet="Bihu Slippers +3"
	}
	
	sets.precast['Dispelga'] = set_combine(sets.FastCast, {
		main="Daybreak",
		sub="Genmei Shield"
	})
	

	--Midcast Sets
	sets.midcast = {
		
	}
	
	sets.midcast['Soul Voice'] = {
		legs="Bihu Cannions +3"
	}
	
	sets.midcast['Troubadour'] = {
		body="Bihu Justaucorps +3"
	}
	
	sets.midcast['Nightingale'] = {
		feet="Bihu Slippers +3"
	}
	
	sets.midcast['Curing Waltz III'] = sets.Waltz

	sets.midcast.Gishdubar = {
		waist="Gishdubar Sash"
	}

	sets.midcast.Obi = {
		waist="Hachirin-no-Obi"
	}
	
	sets.midcast.Song = {
		main="Carnwenhan",
		sub="Kali",
		head="Fili Calot +1",
		body="Fili Hongreline +1",
		hands="Fili Manchettes +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		neck="Moonbow Whistle +1",
		waist="Obstinate Sash",
		ear1="Regal Earring",
		ear2="Dignitary's Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}}
	}
	
	sets.midcast.Ballad = set_combine(sets.midcast.Song, {
		legs="Fili Rhingrave +1"
	})
	
	sets.midcast.Minne = set_combine(sets.midcast.Song, {
		legs="Mousai Seraweels +1"
	})
	
	sets.midcast.Scherzo = set_combine(sets.midcast.Song, {
		feet="Fili Cothurnes +1"
	})
	
	sets.midcast.Carol = set_combine(sets.midcast.Song, {
		hands="Mousai Gages +1"
	})
	
	sets.midcast.Paeon = set_combine(sets.midcast.Song, {
		head="Brioso Roundlet +3"
	})
	
	sets.midcast.Mambo = set_combine(sets.midcast.Song, {
		feet="Mousai Crackows +1"
	})
	
	sets.midcast.Etude = set_combine(sets.midcast.Song, {
		head="Mousai Turban +1"
	})
	
	sets.midcast.Lullaby = set_combine(sets.midcast.Song, {
		head="Bihu Roundlet +3",
		hands="Brioso Cuffs +3"
	})
	
	sets.midcast.SongEnfeeb = set_combine(sets.midcast.Song, {
		head="Brioso Roundlet +3",
		body="Brioso Justaucorps +3",
		hands="Brioso Cuffs +3",
		legs="Brioso Cannions +3",
		waist="Luminary Sash",
	})
	
	sets.midcast['Foe Requiem VII'] = sets.midcast.SongEnfeeb
	sets.midcast['Pining Nocturne'] = sets.midcast.SongEnfeeb
	sets.midcast['Carnage Elegy'] = sets.midcast.SongEnfeeb
	sets.midcast['Light Threnody II'] = sets.midcast.SongEnfeeb
	sets.midcast['Dark Threnody II'] = sets.midcast.SongEnfeeb
	sets.midcast['Earth Threnody II'] = sets.midcast.SongEnfeeb
	sets.midcast['Wind Threnody II'] = sets.midcast.SongEnfeeb
	sets.midcast['Water Threnody II'] = sets.midcast.SongEnfeeb
	sets.midcast['Fire Threnody II'] = sets.midcast.SongEnfeeb
	sets.midcast['Ice Threnody II'] = sets.midcast.SongEnfeeb
	sets.midcast['Ltng. Threnody II'] = sets.midcast.SongEnfeeb

	sets.midcast.enfeeb = {
		main="Contemplator +1",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		body="Cohort Cloak +1",
		hands="Inyanga Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		neck="Incanter's Torque",  
		waist="Luminary Sash",
		ear1="Regal Earring",
		ear2="Dignitary's Earring",
		ring1="Kishar Ring",
		ring2="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%',}}
	}
	
	sets.midcast['Dispelga'] = set_combine(sets.midcast.enfeeb, {
		main="Daybreak",
		sub="Genmei Shield"
	})
	--Cure Sets
 
	sets.midcast.cure = set_combine(sets.Hands.Daybreak, {
		sub="Sors Shield",
		ammo="Pemphredo Tathlum",
		head="Kaykaus Mitra +1",
		hands="Kaykaus Cuffs +1",
		neck="Incanter's Torque",
		body="Kaykaus Bliaut +1",
		feet="Kaykaus Boots +1",
		legs="Kaykaus Tights +1",
		left_ear="Enchanter's Earring +1",
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

	sets.midcast.Enhancing = {
		sub="Ammurapi Shield",
		neck="Incanter's Torque",
		hands="Inyanga Dastanas +2",
		body="Telchine Chasuble",
		back="Fi Follet Cape +1",
		waist="Embla Sash",
		ear1="Mimir Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
	}
	
	sets.midcast.Erase = set_combine(sets.midcast.Enhancing, {
		
	})

	--Idle Sets Below
	Idle_Set_Names = {'DTMove', 'DT', 'Move', 'Normal'}
	sets.Idle = {
		head="Inyanga Tiara +2",
		body="Kaykaus Bliaut +1",
		hands="Inyanga Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet="Inyanga Crackows +2",
		neck="Loricate Torque +1",
		waist="Fucho-no-obi",
		left_ear="Ethereal Earring",
		right_ear="Infused Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		range={ name="Linos", augments={'Accuracy+19','"Store TP"+4','Quadruple Attack +3',}},
		back="Moonlight Cape",
	}

	sets.Idle.Normal = set_combine(sets.Idle, {})
	
	sets.Idle.Move = set_combine(sets.Idle, {
		feet="Fili Cothurnes +1"
	})

	sets.Idle.DT = set_combine(sets.Idle, {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		back="Moonlight Cape"
	})
	
	sets.Idle.DTMove = set_combine(sets.Idle.DT, {
		feet="Fili Cothurnes +1"
	})

	--Melee Sets
	Melee_Set_Names = {'Standard', 'Single', 'TH', 'Kraken'}

	sets.Melee = {
		head="Ayanmo Zucchetto +2",
		body="Ashera Harness",
		hands="Bunzi's Gloves",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Bard's Charm +2",
		waist="Sailfi Belt +1",
		left_ear="Telos Earring",
		right_ear="Dedition Earring",
		left_ring="Moonlight Ring",
		right_ring="Chirich Ring +1",
		range={ name="Linos", augments={'Accuracy+19','"Store TP"+4','Quadruple Attack +3',}},
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	}

	sets.Melee.Standard = set_combine(sets.Melee, {})
	
	sets.Melee.TH = set_combine(sets.Melee, {
		ammo="Perfect Lucky Egg",
		waist="Chaac Belt"
	})
	
	sets.Melee.Single = set_combine(sets.Melee, {  
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10'}}
	})
	
	sets.Melee.Kraken = set_combine(sets.Melee, {  
		waist="Olseni Belt",
		ear1="Crepuscular Earring",
		hands="Gazu Bracelet +1"
	})
	
	sets.WS = {
		head="Bihu Roundlet +3",
		body="Bihu Justaucorps +3",
		hands="Bihu Cuffs +3",
		legs="Nyame Flanchard",
		feet="Bihu Slippers +3",
		neck="Bard's Charm +2",
		waist="Sailfi Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Ishvara Earring",
		left_ring="Ilabrat Ring",
		right_ring="Epaminondas's Ring",
		range={ name="Linos", augments={'Attack+20','Weapon skill damage +3%','STR+6 DEX+6',}},
		back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}}
	}
	
	sets.precast['Savage Blade'] = set_combine(sets.WS, {
		head="Nyame Helm",								
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		left_ring="Sroda Ring"
	})
	
	sets.precast["Rudra's Storm"] = set_combine(sets.WS, {
		head="Nyame Helm",								
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		left_ring="Sroda Ring"
	})
	
	sets.precast['Aeolian Edge'] = set_combine(sets.WS, {
		head="Nyame Helm",								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Baetyl Pendant",
		waist="Orpheus's Sash",
		right_ear="Friomisi Earring"
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
        equip(sets.precast[spell.english])
	elseif spell.type == 'WeaponSkill' then
		equip(sets.WS) 
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	elseif spell.type == 'BardSong' then
		equip(sets.precast.SongCast)
		
		if spell.english:find("Lullaby") then
			if Lullaby_Short then
				equip(sets.Instruments.Gjallarhorn)
			else 
				equip(sets.Instruments.Blurred)
			end
		elseif spell.english:find("Paeon") then
			equip(sets.Instruments.Daurdabla)
		elseif spell.english:find("Mambo") then
			equip(sets.Instruments.Daurdabla)
		elseif spell.english:find("Honor March") then 
			equip(sets.Instruments.Marsyas)
		else 
			equip(sets.Instruments.Gjallarhorn)
		end
	else 
		equip(sets.precast.FastCast)
    end
end

function midcast(spell)
	if spell.english:find("Ring") then
		return
	end
	
	if spell.type == 'WeaponSkill' then
		return
	end
	
	if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
	elseif spell.type == 'BardSong' then
		if Dummy_Flag == true then
			equip(sets.Idle.DT)
		elseif spell.english:find("Ballad") then
			equip(sets.midcast.Ballad)
		elseif spell.english:find("Minne") then
			equip(sets.midcast.Minne)
		elseif spell.english:find("Scherzo") then
			equip(sets.midcast.Scherzo)
		elseif spell.english:find("Carol") then
			equip(sets.midcast.Carol)
		elseif spell.english:find("Paeon") then
			equip(sets.midcast.Paeon)
		elseif spell.english:find("Mambo") then
			equip(sets.midcast.Mambo)
		elseif spell.english:find("Etude") then
			equip(sets.midcast.Etude)
		elseif spell.english:find("Lullaby") then
			equip(sets.midcast.Lullaby)
		else 
			equip(sets.midcast.Song)
		end
	elseif spell.skill == 'Enhancing Magic' then
		equip(sets.midcast.Enhancing)
	elseif spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast.enfeeb)
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
	elseif command:sub(1, 10) == 'instrument' then
		Temp_Instrument_Index = command:sub(11,13)
		
		if Temp_Instrument_Index == '' then
			Instrument_Index = Instrument_Index +1
		else 
			Instrument_Index = tonumber(Temp_Instrument_Index)
		end
		
		if Instrument_Index > #Instrument_Set_Names then Instrument_Index = 1 end
		add_to_chat(207,'Instrument Set Changed to: '..Instrument_Set_Names[Instrument_Index]..'')
		equip(sets.Instruments[Instrument_Set_Names[Instrument_Index]])
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
	elseif command == 'burst' then
		BURST_Flag = not BURST_Flag
	elseif command == 'dummy' then
		add_to_chat(207,'Dummy Flag Set: '..tostring(not Dummy_Flag)..'')
		Dummy_Flag = not Dummy_Flag
	elseif command == 'lullaby' then
		add_to_chat(207,'Lullaby Short Set: '..tostring(not Lullaby_Short)..'')
		Lullaby_Short = not Lullaby_Short
	elseif command == 'equipidle' then
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif command == 'equipmelee' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	elseif command == 'startup' then
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
		equip(sets.Instruments[Instrument_Set_Names[Instrument_Index]])
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
	send_command('lua u singer')
end

include('organizer-lib')