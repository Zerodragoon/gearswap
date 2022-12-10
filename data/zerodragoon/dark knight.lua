include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1

	FellCleaveTH_Flag = false
	--Default Macro Set for DRK
	send_command('input /macro book 4;wait .1;input /macro set 1;wait 0.5;input //gs org')
	
	set_style_lock()
	
	--Precast
	sets.precast = {}
		
	-- Magic Sets Below		
	sets.precast.FastCast = {
		head="Carmine Mask +1",
		body="Sacro Breastplate",
		hands="Leyline Gloves",
		legs="Rawhide Trousers",
		feet="Odyssean Greaves",
		ear1="Loquacious Earring",
		ear2="Enchanter's Earring +1",
		ring1="Prolix Ring",
		ring2="Weatherspoon Ring +1",
		neck="Baetyl Pendant",
		ammo="Sapience Orb" --2
	}
	
	sets.precast['Souleater'] = {
		head="Ignominy Burgeonet +3"
	} 

	sets.precast['Last Resort'] = {
		back="Ankou's Mantle",
		feet="Fallen's Sollerets +2"
	} 
	
	sets.precast['Nether Void'] = {
		legs="Heathen's Flanchard +1"
	}

	sets.precast['Dark Seal'] = {
		legs="Fallen's Burgeonet +3"
	} 	
	
	sets.precast['Weapon Bash'] = {
		hands="Ignominy Gauntlets +3"
	}

	Hands_Set_Names = {'GSword', 'Apocalypse', 'Scythe', 'Sword', 'GAxe', 'Mace'}

	sets.Hands = {}	

	sets.Hands.Sword = { 
		main="Naegling",
		sub="Blurred Shield +1"
	}
	
	sets.Hands.Apocalypse = { 
		main="Apocalypse",
		sub="Utu Grip"
	}
	
	sets.Hands.Scythe = { 
		main="Crepuscular Scythe",
		sub="Utu Grip"
	}
	
	sets.Hands.GAxe = { 
		main="Hepatizon Axe +1",
		sub="Utu Grip"
	}
	
	sets.Hands.GSword = { 
		main="Caladbolg",
		sub="Utu Grip"
	}
	
	sets.Hands.Mace = { 
		main="Loxotic Mace +1",
		sub="Blurred Shield +1"
	}
	
	sets.midcast = {}

	sets.midcast.Magic = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		body="Sacro Breastplate",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Baetyl Pendant",
		waist="Eschan Stone",
		left_ear="Malignance Earring",
		right_ear="Friomisi Earring",
		ring1="Archon Ring",
		ring2="Weatherspoon Ring +1",
		back="Izdubar Mantle",
	}
	
	sets.midcast.MagicDark = set_combine(sets.midcast.Magic, {
		head="Ignominy Burgeonet +3",
		body="Carmine Scale Mail +1",
		hands="Fallen's Finger Gauntlets +3",
		legs="Heathen's Flanchard +1",
		feet="Ratri Sollerets +1",
		neck="Erra Pendant",
		ear2="Enchanter's Earring +1",
		ring2="Evanescence Ring",
		back="Niht Mantle"
	})
	
	sets.midcast.Absorb = set_combine(sets.midcast.MagicDark, {
		ring1="Kishar Ring",
		ring2="Stikini Ring +1"
	})
	
	sets.midcast.Drain = set_combine(sets.midcast.MagicDark, {
		waist="Orpheus's Sash",
		ear1="Hirudinea Earring",
		ranged="Ullr"
	})
	
	sets.midcast['Aspir'] = sets.midcast.Drain
	sets.midcast['Aspir II'] = sets.midcast.Drain
	sets.midcast['Drain II'] = sets.midcast.Drain
	sets.midcast['Drain III'] = sets.midcast.Drain
	
	sets.midcast.Endark = set_combine(sets.midcast.Magic, {
		ring2="Evanescence Ring"
	})
	
	sets.midcast['Endark II'] = sets.midcast.Endark

	sets.midcast['Dread Spikes'] = set_combine(sets.midcast.MagicDark, {
		head="Nyame Helm",	
		body="Heathen's Cuirass +1",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		neck="Unmoving Collar +1",
		ear1="Tuisto Earring",
		ear2="Odnowa Earring +1",
		ring1="Eihwaz Ring",
		ring2="Moonlight Ring",
		back="Moonlight Cape"
	})
	
	sets.midcast["Weapon Bash"] = {
		hands="Ignominy Gauntlets +3"
	}
		
	-- Physical WS Sets Below
	PWS_Set_Names = {'Normal'}
	sets.PWS = {
		head="Nyame Helm",							
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Abyssal Beads +2",
		waist="Fotia Belt",
		ring1="Niqmaddu Ring",
		ring2="Epaminondas's Ring",
		back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		ear1="Moonshade Earring", --Heathen's Earring +2
		ear2="Heathen's Earring +1",
		ammo="Knobkierrie"}
		
	sets.PWS.Normal = set_combine(sets.PWS, {})
		
	sets.MWS = set_combine(sets.midcast.Magic, {
		ear1="Moonshade Earring",
		ring1="Epaminondas's Ring"
	})
	
	sets.PWS.MultiHit = set_combine(sets.PWS, {
		head="Sakpata's Helm",
   		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		ear2="Schere Earring",
		ammo="Coiste Bodhar"
	})
	
	sets.precast['Shockwave'] = set_combine(sets.PWS, {
		ammo="Perfect Lucky Egg",
		body="Odyssean Chestplate",
		waist="Chaac Belt"
	})
	
	sets.precast['Savage Blade'] = set_combine(sets.PWS, {
		ring1="Sroda Ring",
		waist="Sailfi Belt +1"
	})

	sets.precast['Resolution'] = sets.PWS.MultiHit
	sets.precast['Insurgency'] = sets.PWS.MultiHit
	sets.precast['Entropy'] = sets.PWS.MultiHit
	
	sets.precast['Frostbite'] = sets.MWS
	sets.precast['Freezebite'] = sets.MWS
	sets.precast['Herculean Slash'] = sets.MWS
	sets.precast['Dark Harvest'] = sets.MWS
	sets.precast['Shadow of Death'] = sets.MWS
	sets.precast['Infernal Scythe'] = sets.MWS

	--Idle Sets Below
	Idle_Set_Names = {'Normal'}
	sets.Idle = {
		head="Sakpata's Helm",
   		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",
		legs="Carmine Cuisses +1",
		feet="Sakpata's Leggings",
		neck="Loricate Torque +1",
		waist="Gishdubar Sash",
		ring1="Warden's Ring",
		ring2="Defending Ring",
		back="Moonlight Cape",
		ear1="Infused Earring",
		ear2="Telos Earring",
		ammo="Staunch Tathlum +1"}

	sets.Idle.Normal = set_combine(sets.Idle, {})


	Melee_Set_Names = {'DT', 'DTAcc', 'DblAtt', 'SB', 'TH'}

	sets.Melee = {  
		head="Sakpata's Helm",
   		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Abyssal Beads +2",
		waist="Sailfi Belt +1",
		ring1="Niqmaddu Ring",
		ring2="Petrov Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		ear1="Cessance Earring",
		ear2="Telos Earring",
		ammo="Coiste Bodhar"
	}
		
	sets.Melee.DT = set_combine(sets.Melee, {})
	
	sets.Melee.DTAcc = set_combine(sets.Melee, {
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1"
	})
	
	sets.Melee.DblAtt = set_combine(sets.Melee, {
		head="Flamma Zucchetto +2",							
		feet="Flamma Gambieras +2"
	})
	
	sets.Melee.SB = set_combine(sets.Melee, { --33
		head="Sakpata's Helm",
   		body="Dagon Breastplate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Warrior's Bead Necklace +2",
		waist="Sailfi Belt +1",
		ring1="Niqmaddu Ring",
		ring2="Chirich Ring +1",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		ear1="Dignitary's Earring",
		ammo="Coiste Bodhar"
	})
	
	sets.Melee.TH = set_combine(sets.Melee, {
		body="Odyssean Chestplate",
		ammo="Perfect Lucky Egg",
		waist="Chaac Belt",
	})
	
	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')
end

function precast(spell)	
	if sets.precast[spell.english] then
        equip(sets.precast[spell.english])
	elseif spell.type == 'WeaponSkill' then
		equip(sets.PWS)	
	elseif spell.type == "Ninjutsu" or spell.type == "BlackMagic" then
		equip(sets.precast.FastCast)
	elseif spell.type == "Trust" then
		equip(sets.precast.FastCast)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')        
    end
end

function midcast(spell)
	if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
		
		if buffactive['Dark Seal'] then
			equip({head="Fallen's Burgeonet +3"})						
		end
	elseif spell.type == "Ninjutsu" or spell.type == "BlackMagic" then
		equip(sets.midcast.Magic)
		
		if spell.target.distance < 5.0 then
			equip(sets.midcast.Orepheus)
		end
    end
end

function aftercast(spell)
	if player.status=='Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
		
		if GK_Flag == true then
			equip(sets.GK)
		elseif Katana_Flag == true then
			equip(sets.Katana)
		end
	else		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]])		
	end
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif new == 'Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])

		if GK_Flag == true then
			equip(sets.GK)
		elseif Katana_Flag == true then
			equip(sets.Katana)
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
	elseif command == 'equiptf' then
		equip(sets.MWS[MWS_Set_Names[MWS_Index]])
	elseif command == 'gk' then
		equip(sets.GK)
	elseif command == 'katana' then
		equip(sets.Katana)
	elseif command == 'fcth' then
		FellCleaveTH_Flag = not FellCleaveTH_Flag
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