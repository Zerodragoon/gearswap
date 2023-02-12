include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	ATT_Cap_Flag = false
	Absorb_Weapon_Flag = true

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
	
	sets.precast['Impact'] = set_combine(sets.FastCast, {
		head=empty,
		body="Crepuscular Cloak"
	})
	
	sets.precast['Souleater'] = {
		head="Ignominy Burgeonet +3"
	} 

	sets.precast['Last Resort'] = {
		back="Ankou's Mantle",
		feet="Fallen's Sollerets +2"
	} 
	
	sets.precast['Nether Void'] = {
		legs="Heathen's Flanchard +2"
	}

	sets.precast['Dark Seal'] = {
		legs="Fallen's Burgeonet +3"
	} 	
	
	sets.precast['Weapon Bash'] = {
		hands="Ignominy Gauntlets +3"
	}

	Hands_Set_Names = {'GSword', 'Apocalypse', 'Scythe', 'Sword', 'GAxe', 'Mace', 'Anguta'}

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
	
	sets.Hands.Anguta = { 
		main="Anguta",
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
	
	sets.Hands.Absorb = {
		main="Shukuyu's Scythe",
		sub="Khonsu"
	}
	
	sets.midcast = {}

	sets.midcast.Magic = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		body="Sacro Breastplate",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sibyl Scarf",
		waist="Eschan Stone",
		left_ear="Malignance Earring",
		right_ear="Friomisi Earring",
		ring1="Archon Ring",
		ring2="Weatherspoon Ring +1",
		back="Izdubar Mantle",
	}
	
	sets.midcast.Impact = set_combine(sets.midcast.enfeeb, {
		sub="Khonsu",
		head=empty,
		body="Crepuscular Cloak",
		neck="Erra Pendant",
		ring1="Stikini Ring +1",
		ring2="Metamorph Ring +1",
		ear2="Heathen's Earring +1",
		ranged="Ullr"
	})
	
	sets.midcast.MagicDark = set_combine(sets.midcast.Magic, {
		head="Ignominy Burgeonet +3",
		body="Carmine Scale Mail +1",
		hands="Fallen's Finger Gauntlets +3",
		legs="Heathen's Flanchard +2",
		feet="Ratri Sollerets +1",
		neck="Erra Pendant",
		ear2="Enchanter's Earring +1",
		ring2="Evanescence Ring",
		back="Niht Mantle"
	})
	
	sets.midcast.Absorb = set_combine(sets.midcast.MagicDark, {
		hands="Pavor Gauntlets",
		back="Chuparrosa Mantle",
		ring1="Kishar Ring",
		ring2="Stikini Ring +1"
	})
	
	sets.midcast['Absorb-MND'] = sets.midcast.Absorb
	sets.midcast['Absorb-VIT'] = sets.midcast.Absorb
	sets.midcast['Absorb-CHR'] = sets.midcast.Absorb
	sets.midcast['Absorb-INT'] = sets.midcast.Absorb
	sets.midcast['Absorb-DEX'] = sets.midcast.Absorb
	sets.midcast['Absorb-STR'] = sets.midcast.Absorb
	sets.midcast['Absorb-ACC'] = sets.midcast.Absorb
	sets.midcast['Absorb-Attri'] = sets.midcast.Absorb
	sets.midcast['Absorb-TP'] = set_combine(sets.midcast.Absorb, {
		hands="Heathen's Gauntlets +2"
	})


	sets.midcast.Drain = set_combine(sets.midcast.MagicDark, {
		waist="Orpheus's Sash",
		ear1="Hirudinea Earring"
	})
	
	sets.midcast['Aspir'] = sets.midcast.Drain
	sets.midcast['Aspir II'] = sets.midcast.Drain
	sets.midcast['Drain II'] = sets.midcast.Drain
	sets.midcast['Drain III'] = sets.midcast.Drain
	
	sets.midcast.Endark = set_combine(sets.midcast.MagicDark, {
		ring2="Evanescence Ring"
	})
	
	sets.midcast['Endark II'] = sets.midcast.Endark

	sets.midcast['Dread Spikes'] = set_combine(sets.midcast.MagicDark, {
		head="Nyame Helm",	
		body="Heathen's Cuirass +2",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		neck="Unmoving Collar +1",
		ear1="Tuisto Earring",
		ear2="Odnowa Earring +1",
		ring1="Moonlight Ring",
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
		feet="Nyame Sollerets", --Heathen's Sollerts +3
		neck="Abyssal Beads +2",
		waist="Fotia Belt",
		ring1="Niqmaddu Ring",
		ring2="Epaminondas's Ring",
		back={ name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		ear1="Moonshade Earring",
		ear2="Heathen's Earring +1",
		ammo="Knobkierrie"}
		
	sets.PWS.Normal = set_combine(sets.PWS, {})
		
	sets.MWS = set_combine(sets.midcast.Magic, {
		ear1="Moonshade Earring",
		ring1="Archon Ring",
		neck="Sibyl Scarf"
	})
	
	sets.PWS.MultiHit = set_combine(sets.PWS, {
		head="Heathen's Burgeonet +2",
   		body="Nyame Mail",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Heathen's Sollerts +2",
		ammo="Coiste Bodhar",
		waist="Fotia Belt",
		ring2="Regal Ring"
	})

	
	sets.PWS.Savage = set_combine(sets.PWS, {
		ring1="Sroda Ring",
		waist="Sailfi Belt +1"
	})
	
	sets.PWS.SavageCap = set_combine(sets.PWS.Savage, {
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses"
	})
	
	sets.PWS.TorcleaverCap = set_combine(sets.PWS.Savage, {
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		waist="Sailfi Belt +1"
	})
	
	sets.precast['Shockwave'] = set_combine(sets.PWS, {
		ammo="Perfect Lucky Egg",
		body="Odyssean Chestplate",
		waist="Chaac Belt"
	})
	
	sets.precast['Cataclysm'] = set_combine(sets.PWS, {
		waist="Sailfi Belt +1"
	})
	
	sets.precast['Cross Reaper'] = set_combine(sets.PWS, {
		waist="Sailfi Belt +1"
	})
	
	sets.precast['Quietus'] = set_combine(sets.PWS, {
		waist="Sailfi Belt +1"
	})
	
	sets.precast['Scourge'] = set_combine(sets.PWS, {
		ear1="Thurd Earring"
	})
	
	sets.precast['Resolution'] = 	sets.precast['Entropy'] = set_combine(sets.PWS.MultiHit, {
		body="Sakpata's Breastplate",
		feet="Sakpata's Leggings",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		ear2="Brutal Earring"
	})
	
	sets.precast['Insurgency'] = set_combine(sets.PWS.MultiHit, {
		waist="Sailfi Belt +1",
		ring2="Regal Ring"
	})
	
	sets.precast['Entropy'] = set_combine(sets.PWS.MultiHit, {
		body="Dagon Breastplate",
		neck="Fotia Gorget",
		waist="Fotia Belt"
	})
	
	sets.precast['Frostbite'] = sets.MWS
	sets.precast['Freezebite'] = sets.MWS
	sets.precast['Herculean Slash'] = sets.MWS
	sets.precast['Dark Harvest'] = sets.MWS
	sets.precast['Shadow of Death'] = set_combine(sets.MWS, {
		head="Pixie Hairpin +1",
	})
	sets.precast['Infernal Scythe'] = set_combine(sets.MWS, {
		head="Pixie Hairpin +1"
	})

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


	Melee_Set_Names = {'DT', 'DTAcc', 'DblAtt', 'SB', 'FullSB', 'TH'}

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
	
	sets.Melee.SB = set_combine(sets.Melee, { --Assumes Auspice ~25-29 SB
		head="Sakpata's Helm",
   		body="Dagon Breastplate", --SB II 10
		hands="Sakpata's Gauntlets", --SB 8
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings", --SB 13 R25 15 R30
		waist="Sailfi Belt +1",
		ring1="Niqmaddu Ring", --SB II 5
		ring2="Chirich Ring +1", --SB 10
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		ammo="Coiste Bodhar"
	})
	
	sets.Melee.FullSB = set_combine(sets.Melee, {
		head="Sakpata's Helm",
   		body="Dagon Breastplate", --SB II 10
		hands="Sakpata's Gauntlets", --SB 8
		legs="Volte Tights", --SB 8
		feet="Sakpata's Leggings", --SB 13 R25 15 R30
		waist="Sarissaphoroi Belt", --SB 5
		ring1="Niqmaddu Ring", --SB II 5
		ring2="Chirich Ring +1", --SB 10
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		ear1="Dignitary's Earring", --SB 5
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
        if checkWSDistance(spell) then
			equip(sets.precast[spell.english])
		end
	elseif spell.type == 'WeaponSkill' then
		if checkWSDistance(spell) then
			if spell.name == "Torcleaver" then
				if ATT_Cap_Flag then
					equip(sets.PWS.TorcleaverCap)
				else 
					equip(sets.PWS)
				end
			elseif spell.name == "Savage Blade" or spell.name == "Judgment" or spell.name == "Black Halo" then
				if ATT_Cap_Flag then
					equip(sets.PWS.SavageCap)
				else 
					equip(sets.PWS.Savage)
				end
			else
				equip(sets.PWS)	
			end
		end
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
		
		if spell.english:find("Absorb") and Absorb_Weapon_Flag then
			equip(sets.Hands.Absorb)
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
	elseif command == 'attcap' then
		add_to_chat(207,'Attack Cap Set: '..tostring(not ATT_Cap_Flag)..'')

		ATT_Cap_Flag = not ATT_Cap_Flag
	elseif command == 'absorbweapon' then
		add_to_chat(207,'Absorb Weapon Set: '..tostring(not Absorb_Weapon_Flag)..'')

		Absorb_Weapon_Flag = not Absorb_Weapon_Flag
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