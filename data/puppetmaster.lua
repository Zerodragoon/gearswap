include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	Style_Lock_Id = 28

	--Default Macro Set for RNG
	send_command('input /macro book 10;wait .1;input /macro set 3;wait 0.5;input //gs org;wait 1.0;lua l autocontrol;wait .5; autocontrol show')
	
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
	
	sets.precast.Overdrive = {
		body="Pitre Tobe"
	}
	
	sets.precast.Maneuver = {
		main="Midnights",
		body="Kara. Farsetto +1",
		hands="Foire Dastanas +2",
		neck="Bfn. Collar +1",
		back="Visucius's Mantle"
	}
	
	sets.precast['Dark Maneuver'] = sets.precast.Maneuver
	sets.precast['Light Maneuver'] = sets.precast.Maneuver
	sets.precast['Fire Maneuver'] = sets.precast.Maneuver
	sets.precast['Water Maneuver'] = sets.precast.Maneuver
	sets.precast['Ice Maneuver'] = sets.precast.Maneuver
	sets.precast['Earth Maneuver'] = sets.precast.Maneuver
	sets.precast['Wind Maneuver'] = sets.precast.Maneuver
	sets.precast['Thunder Maneuver'] = sets.precast.Maneuver
	
	sets.precast.Repair = {
		--main="Nibiru Sainti",
		head={ name="Taeon Chapeau", augments={'"Repair" potency +5%','Phalanx +3',}},
		body={ name="Taeon Tabard", augments={'"Repair" potency +5%','Phalanx +3',}},
		hands={ name="Taeon Gloves", augments={'"Repair" potency +5%','Phalanx +3',}},
		legs={ name="Taeon Tights", augments={'"Repair" potency +5%','Phalanx +3',}},
		feet="Foire Babouches +2",
		ear1="Pratik Earring",
		ear2="Guignol Earring",
		ring1="Overbearing Ring",
		back="Visucius's Mantle"
	}
	
	sets.precast.Maintenance = sets.precast.Repair

	Hands_Set_Names = {'Vere'}

	sets.Hands = {}	
	
	sets.Hands.Vere = { 
		main="Verethragna"
	}
				
	-- Physical WS Sets Below

	PWS_Set_Names = {'Normal'}
	sets.PWS = {    
		head="Mpaca's Cap",							
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Brutal Earring",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		back="Sacro Mantle"
	}
	
	sets.precast['Raging Fists']    = set_combine(sets.PWS, {})
	sets.precast['Howling Fist']    = set_combine(sets.PWS, {})
	sets.precast['Asuran Fists']    = set_combine(sets.PWS, {neck="Fotia Gorget"})
	sets.precast["Ascetic's Fury"]  = set_combine(sets.PWS, {})
	sets.precast["Victory Smite"]   = set_combine(sets.PWS, {})
	sets.precast['Shijin Spiral']   = set_combine(sets.PWS, {})
	sets.precast['Dragon Kick']     = set_combine(sets.PWS, {})
	sets.precast['Tornado Kick']    = set_combine(sets.PWS, {})
	sets.precast['Spinning Attack'] = set_combine(sets.PWS, {})

	sets.PWS.Normal = set_combine(sets.PWS, {})
	
	sets.PupTank = {
		main="Gnafron's Adargas",
		neck="Shulmanu Collar",
		head="Anwig Salade",
		body={ name="Taeon Tabard", augments={'Pet: Accuracy+17 Pet: Rng. Acc.+17','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		hands={ name="Taeon Gloves", augments={'Pet: Attack+22 Pet: Rng.Atk.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		legs={ name="Taeon Tights", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		feet={ name="Taeon Boots", augments={'Pet: Accuracy+17 Pet: Rng. Acc.+17','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		waist="Isa Belt",
		ring1="Overbearing Ring",
		ring2="C. Palug Ring",
		ear1="Rimeice Earring",
		ear2="Enmerkar Earring",
		back="Visucius's Mantle",
		ranged="Animator P +1",
		ammo="Automat. Oil +3"
	}
	
	sets.PupTankBruiser = set_combine(sets.PupTank, {
		main="Midnights",
		head={ name="Taeon Chapeau", augments={'Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		ring1="Varar Ring +1",
		waist="Incarnation Sash"
	})
	
	sets.PupDD = set_combine(sets.PupTankBruiser, {
		main="Ohtas",
		hands="Mpaca's Gloves",
		feet="Mpaca's Boots",
		ear1="Crepuscular Earring"
	})
	
	sets.PupMagic = set_combine(sets.PupDD, {
		head="Mpaca's Cap",							
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		waist="Ukko Sash"
	})
	
	sets.PupWS = {
		head="Mpaca's Cap",							
		body={ name="Taeon Tabard", augments={'Pet: Accuracy+17 Pet: Rng. Acc.+17','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		hands="Mpaca's Gloves",
		legs={ name="Taeon Tights", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		feet="Mpaca's Boots",
		neck="Shulmanu Collar",
		ring1="Varar Ring +1",
		ring2="C. Palug Ring",
		ear1="Kyrene's Earring",
		ear2="Enmerkar Earring",
		back="Visucius's Mantle",
		waist="Incarnation Sash"
	}
						
	--Idle Sets Below
	Idle_Set_Names = {'Normal', 'NormalMpaca', 'PupTank', 'PupTankBruiser', 'PupDD', 'PupMagic'}
	sets.Idle = {
		main="Verethragna",
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
		ear1="Infused Earring",
		ear2="Karagoz Earring +1",
		ranged="Neo Animator",
		ammo="Automat. Oil +3"}

	sets.Idle.Normal = set_combine(sets.Idle, {})
	
	sets.Idle.NormalMpaca = set_combine(sets.Idle, {
		head="Mpaca's Cap",							
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
	})
	
	sets.Idle.PupTank = set_combine(sets.Idle, sets.PupTank)
	
	sets.Idle.PupTankBruiser = set_combine(sets.Idle, sets.PupTankBruiser)
	
	sets.Idle.PupDD = set_combine(sets.Idle, sets.PupDD)
	
	sets.Idle.PupMagic = set_combine(sets.Idle, sets.PupMagic)

	Melee_Set_Names = {'MasterDT', 'MasterMelee', 'PupTank', 'PupTankBruiser', 'PupDD', 'PupMagic'}

	sets.Melee = {  
		main="Verethragna",
		head="Mpaca's Cap",							
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Shulmanu Collar",
		waist="Moonbow Belt +1",
		left_ear="Crepuscular Earring",
		right_ear="Karagoz Earring +1",
		ring1="Gere Ring",
		ring2="Niqmaddu Ring",
		ranged="Neo Animator",
		back="Visucius's Mantle",
		ammo="Automat. Oil +3"
	}

	sets.Melee.PupTank = set_combine(sets.Melee, sets.PupTank)
	
	sets.Melee.PupTankBruiser = set_combine(sets.Melee, sets.PupTankBruiser)
	
	sets.Melee.PupDD = set_combine(sets.Melee, sets.PupDD)
	
	sets.Melee.PupMagic = set_combine(sets.Melee, sets.PupMagic)
	
	sets.Melee.MasterMelee = set_combine(sets.Melee, {})
	
	sets.Melee.MasterDT = set_combine(sets.Melee, {
		head="Malignance Chapeau",							
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
	})

	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')
end

function precast(spell)	
	if sets.precast[spell.english] then
                equip(sets.precast[spell.english])
	elseif spell.type == 'WeaponSkill' then
		equip(sets.PWS[PWS_Set_Names[PWS_Index]])
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
	elseif command == 'rotatesets' then 
		Idle_Index = Idle_Index +1
		if Idle_Index > #Idle_Set_Names then Idle_Index = 1 end
	
		Melee_Index = Idle_Index
		
		add_to_chat(207,'Idle Set Changed to: '..Idle_Set_Names[Idle_Index]..'')
		add_to_chat(207,'Melee Set Changed to: '..Melee_Set_Names[Melee_Index]..'')
		
		if player.status=='Engaged' then
			equip(sets.Melee[Melee_Set_Names[Melee_Index]])
		else		
			equip(sets.Idle[Idle_Set_Names[Idle_Index]])		
		end
	elseif command == 'petws' then
		equip(sets.PupWS)
	elseif command == 'startup' then
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	end
end

function file_unload()
	send_command('lua u autocontrol')
end