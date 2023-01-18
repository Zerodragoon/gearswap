include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	Buff_Swaps_flag = true

	--Default Macro Set for RNG
	send_command('input /macro book 10;wait .1;input /macro set 1;wait 0.5;input //gs org')
	
	set_style_lock()
	
	--Precast
	sets.precast = {}
		
	-- Magic Sets Below		
	sets.precast.FastCast = {
		head="Carmine Mask +1", --14
		hands="Leyline Gloves", --6
		body="Dread Jupon", --7
		legs="Rawhide Trousers", --5
		feet="Malignance Boots", 
		neck="Baetyl Pendant", --4
		ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
		ring1="Weatherspoon Ring +1", --5
		ring2="Prolix Ring", --2
		ammo="Sapience Orb" --2
	}
	
	sets.precast.Utsusemi = set_combine(sets.precast.FastCast,{})

	sets.precast['Curing Waltz III'] = {
		head="Anwig Salade",
        body="Passion Jacket", --13
		hands="Slither Gloves +1", --5
		feet="Rawhide Boots", --8
        ring1="Asklepian Ring",
		ring2="Valseur's Ring", --3
		ear1="Handler's Earring +1",
		ear2="Enchanter's Earring +1",
        waist="Gishdubar Sash"
    }
		
	sets.precast['Boost'] = {
		hands="Anchorite's Gloves +3",
		waist="Ask Sash"
	}
	
	sets.precast['Chakra'] = {
		hands="Hesychast's Gloves +1",
		body="Anchorite's Cyclas +2"
	}
	
	sets.precast['Dodge'] =  {
		feet="Anchorite's Gaiters +3"
	}
	
	sets.precast['Footwork'] = {
		feet="Shukuyu Sune-ate" --Bhikku Gaiters +3
	}
	
	sets.precast['Hundred Fists'] = {
		legs = "Hesychast's Hose +3"
	}
	
	sets.precast['Chi Blast'] = {
		head="Hesychast's Crown +3"
	}
	
	sets.Footwork = {
		neck="Monk's Nodowa +1",
		legs="Bhikku Hose +2",
		feet="Anchorite's Gaiters +3"
	}
	
	sets.FootworkDT = {
		neck="Monk's Nodowa +1",
		legs="Bhikku Hose +2",
		feet="Bhikku Gaiters +2"
	}
	
	sets.Impetus = {
		body="Bhikku Cyclas +2"
	}

	Hands_Set_Names = {'Vere', 'Pole', 'Godhands'}

	sets.Hands = {}	
	
	sets.Hands.Vere = { 
		main="Verethragna"
	}

	sets.Hands.Godhands = { 
		main="Godhands"
	}
	
	sets.Hands.Karambit = { 
		main="Karambit"
	}
	
	sets.Hands.Pole = {
		main="Malignance Pole"
	}

	-- Physical WS Sets Below

	PWS_Set_Names = {'Normal'}
	sets.PWS = {    
		ammo="Knobkierrie",
		head="Mpaca's Cap",							
		body="Ken. Samue +1",
		hands="Mpaca's Gloves",
		legs="Ken. Hakama +1",
		feet="Ken. Sune-Ate +1",
		neck="Monk's Nodowa +1",
		waist="Moonbow Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Schere Earring",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken-5%',}}
	}
	
	sets.precast['Raging Fists']    = set_combine(sets.PWS, {})
	sets.precast['Howling Fist']    = set_combine(sets.PWS, {hands="Anchorite's Gloves +3",head="Hes. Crown +3",back="Sacro Mantle"})
	sets.precast['Asuran Fists']    = set_combine(sets.PWS, {neck="Fotia Gorget",})
	sets.precast["Ascetic's Fury"]  = set_combine(sets.PWS, {})
	sets.precast["Victory Smite"]   = set_combine(sets.PWS, {head="Adhemar Bonnet +1", ear1="Sherida Earring"})
	sets.precast['Shijin Spiral']   = set_combine(sets.PWS, {ammo="Aurgelmir Orb +1"})
	sets.precast['Dragon Kick']     = set_combine(sets.PWS, {legs = "Hesychast's Hose +3", feet="Anchorite's Gaiters +3", back="Sacro Mantle"}) --Bhikku Hose +3
	sets.precast['Tornado Kick']    = set_combine(sets.PWS, {legs = "Hesychast's Hose +3", feet="Anchorite's Gaiters +3"}) --Bhikku Hose +3
	sets.precast['Spinning Attack'] = set_combine(sets.PWS, {hands="Anchorite's Gloves +3",head="Hes. Crown +3",back="Sacro Mantle"})
	sets.precast['Final Heaven'] = set_combine(sets.PWS, {
		head="Hes. Crown +3",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		back="Sacro Mantle"})

	sets.PWS.Normal = set_combine(sets.PWS, {})
						
	--Idle Sets Below
	Idle_Set_Names = {'Normal', 'Refresh'}
	sets.Idle = {
		head="Malignance Chapeau",							
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Hermes' Sandals",
		neck="Loricate Torque +1",
		waist="Gishdubar Sash",
		ring1="Warden's Ring",
		ring2="Defending Ring",
		back="Moonlight Cape",
		ear1="Telos Earring",
		ear2="Infused Earring",
		ammo="Staunch Tathlum +1"}

	sets.Idle.Normal = set_combine(sets.Idle, {})
	
	sets.Idle.Refresh = set_combine(sets.Idle, {
		head="Rawhide Mask",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1"
	})

	Melee_Set_Names = {'DT', 'DTAcc', 'MpacaDT', 'FullMpacaDT', 'Standard', 'StandardAcc', 'Crit', 'CritAcc', 'DTTH', 'SB'}

	sets.Melee = {  
		head="Adhemar Bonnet +1",							
		body="Tatenashi Haramaki +1",
		hands="Tatenashi Gote +1",
		legs="Samnuha Tights",
		feet="Tatenashi Sune-Ate +1",
		neck="Moonlight Nodowa",
		waist="Moonbow Belt +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Damage taken-5%',}},
		ear1="Telos Earring",
		ear2="Sherida Earring",
		ammo="Aurgelmir Orb +1"
	}

	sets.Melee.DT = set_combine(sets.Melee, {
		head="Malignance Chapeau",
		body="Mpaca's Doublet",	
		hands="Malignance Gloves",
		legs="Bhikku Hose +2",
		feet="Malignance Boots"})
		
	sets.Melee.DTAcc = set_combine(sets.Melee.DT, {
		waist="Kentarch Belt +1",
		ear1="Mache Earring +1",
		ring1="Regal Ring",
		ring2="Chirich Ring +1"})
		
	sets.Melee.MpacaDT = set_combine(sets.Melee.DT, {
		body="Mpaca's Doublet",	
		hands="Mpaca's Gloves",
		ear2="Schere Earring",
		ammo="Coiste Bodhar"})
		
	sets.Melee.FullMpacaDT = set_combine(sets.Melee.DT, {
		head="Mpaca's Cap",		
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		ear2="Schere Earring",
		ammo="Coiste Bodhar"})
		
	sets.Melee.DTTH = set_combine(sets.Melee.DT, {
		ammo="Perfect Lucky Egg",
		feet={ name="Herculean Boots", augments={'"Treasure Hunter"+2',}},
		waist="Chaac Belt"})

	sets.Melee.Crit = set_combine(sets.Melee, {
		head="Kendatsuba jinpachi +1",
		body="Kendatsuba Samue +1",
		hands="Kendatsuba tekko +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba sune-ate +1",
		ear2="Odr Earring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10','Damage taken-5%',}}
		})
		
	sets.Melee.SB = set_combine(sets.Melee, {
		head="Malignance Chapeau",
		body="Mpaca's Doublet",
		hands="Kendatsuba tekko +1",
		legs="Kendatsuba Hakama +1",
		feet="Kendatsuba sune-ate +1"
	})

	sets.Melee.CritAcc = set_combine(sets.Melee.Crit, {
		waist="Kentarch Belt +1",
		ear1="Mache Earring +1",
		ring1="Regal Ring",
		ring2="Chirich Ring +1"})

	sets.Melee.Standard = set_combine(sets.Melee, {})
	
	sets.Melee.StandardAcc = set_combine(sets.Melee, {
		head="Kendatsuba jinpachi +1",
		legs="Tatenashi Haidate +1"
	})

	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')
end

function precast(spell)	
	if sets.precast[spell.english] then
		if checkWSDistance(spell) then
			equip(sets.precast[spell.english])
		
			if buffactive['Impetus'] and Buff_Swaps_flag then
				equip(sets.Impetus)
			end
		end
	elseif spell.type == 'WeaponSkill' then
		if checkWSDistance(spell) then
			equip(sets.PWS[PWS_Set_Names[PWS_Index]])
		
			if buffactive['Impetus'] and Buff_Swaps_flag then
				equip(sets.Impetus)
			end
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

end

function aftercast(spell)	
	if player.status=='Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
		
		if Buff_Swaps_flag then
			if spell.name == 'Footwork' or buffactive['Footwork'] then
				if Melee_Set_Names[Melee_Index]:contains('DT') then
					equip(sets.FootworkDT)
				else
					equip(sets.Footwork)
				end
			end
			
			if spell.name == 'Impetus' or buffactive['Impetus'] then
				equip(sets.Impetus)
			end
		end
	else		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]])		
	end
	
	if spell.name == 'Boost' or buffactive['Boost'] then
		equip({
			waist="Ask Sash"
		})
	end
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif new == 'Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]]) 
		
		if Buff_Swaps_flag then
			if buffactive['Footwork'] then
				if Melee_Set_Names[Melee_Index]:contains('DT') then
					equip(sets.FootworkDT)
				else
					equip(sets.Footwork)
				end
			end
			
			if buffactive['Impetus'] then
				equip(sets.Impetus)
			end
		end
	end
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
	elseif command == 'buffswaps' then
		add_to_chat(207,'Buff Swaps : '..tostring(not Buff_Swaps_flag)..'')
		Buff_Swaps_flag = not Buff_Swaps_flag
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
	end
end

function file_unload()
	
end