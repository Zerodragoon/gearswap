include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	AeolianTH_Flag = false

	--Default Macro Set for RNG
	send_command('input /macro book 9;wait .1;input /macro set 1;wait 0.5;input //gs org')
	
	set_style_lock()
	
	--Precast
	sets.precast = {}
		
	-- Magic Sets Below		
	sets.precast.FastCast = {
		head="Carmine Mask +1", --14
		hands="Leyline Gloves", --6
		body="Dread Jupon", --7
		legs="Rawhide Trousers", --5
		feet="Carmine Greaves +1", --8
		neck="Baetyl Pendant", --4
		ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
		ring1="Weatherspoon Ring +1", --5
		ring2="Prolix Ring", --2
		ammo="Sapience Orb" --2
	}
	
	sets.precast.Utsusemi = set_combine(sets.precast.FastCast,{
		--neck="Magoraga Beads", --10,
		body="Passion Jacket" --10
	})

	sets.precast['Curing Waltz III'] = {
		--head="Mummu Bonnet +2",
		head="Anwig Salade",
        body="Passion Jacket", --13
		hands="Slither Gloves +1", --5
		legs="Dashing Subligar", --10
		feet="Rawhide Boots", --8 
        ring1="Asklepian Ring",
		ring2="Valseur's Ring", --3
		ear2="Handler's Earring +1",
        waist="Gishdubar Sash",
		ammo="Yamarang"
    }

	sets.precast['Hide'] = {
		body="Pillager's Vest +3"
	}
	
	sets.precast['Feint'] = {
		legs="Plunderer's Culottes +3"
	}
	
	sets.precast["Assassin's Charge"] = {
		feet="Plunderer's Poulaines +3"
	}
	
	sets.precast["Perfect Dodge"] = {
		hands="Plunderer's Armlets +3"
	}
	
	sets.precast["Flee"] = {
		feet="Pillager's Poulaines +3"
	}
	
	sets.precast["Steal"] = {
		ammo="Barathrum",
		feet="Pillager's Poulaines +3"
	}
	
	sets.precast["Despoil"] = {
		ammo="Barathrum",
		legs="Skulker's Culottes +1",
		feet="Skulker's Poulaines +1"
	}
	
	sets.precast["Accomplice"] = {
		head="Skulker's Bonnet +1"
	}
	
	sets.precast["Collaborator"] = {
		head="Skulker's Bonnet +1"
	}
	
	sets.precast["Sneak Attack"] = {
		hands="Skulker's Armlets +1"
	}
	
	sets.precast["Sneak Attack"] = {
		hands="Skulker's Armlets +1"
	}
	
	sets.precast["Trick Attack"] = {
		body="Plunderer's Vest +3",
		hands="Pillager's Armlets +3"
	}

	Hands_Set_Names = {'Twashtar', 'TwashtarTP', 'Tauret', 'Aeneas', 'AeneasTP'}

	sets.Hands = {}	

	sets.Hands.Aeneas = { 
		main="Aeneas",
		sub="Twashtar"
	}
	
	sets.Hands.AeneasTP = { 
		main="Aeneas",
		sub="Fusetto +2"
	}
	
	sets.Hands.Twashtar = { 
		main="Twashtar",
		sub="Aeneas"
	}
	
	sets.Hands.TwashtarTP = { 
		main="Twashtar",
		sub="Fusetto +2"
	}
	
	sets.Hands.Tauret = { 
		main="Tauret",
		sub="Gleti's Knife",
	}
						
	-- Physical WS Sets Below

	PWS_Set_Names = {'Normal'}
	sets.PWS = {
		head="Nyame Helm",							
		body="Nyame Mail", --Skulker's Vest +3
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Assassin's Gorget +2",
		waist="Fotia Belt",
		ring1="Regal Ring",
		ring2="Epaminondas's Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		ammo="Yetshila +1"
	}

	sets.PWS.Normal = set_combine(sets.PWS, {})
	
	sets.precast["Rudra's Storm"] = set_combine(sets.PWS, {	
		legs="Plunderer's Culottes +3",
		waist="Kentarch Belt +1",
		ring1="Ilabrat Ring", 
		ear1="Sherida Earring"
	})
	
	sets.precast['Mandalic Stab'] = set_combine(sets.PWS, {	
		head="Nyame Helm",
		waist="Kentarch Belt +1",
		ring1="Ilabrat Ring",
		ear1="Sherida Earring"
	})
	
	sets.precast['Evisceration'] = set_combine(sets.PWS, {
		head="Adhemar Bonnet +1",	
		body="Plunderer's Vest +3",
		hands="Adhemar Wristbands +1",
		legs="Gleti's Breeches",
		feet="Mummu Gamashes +2",
		waist="Fotia Belt",
		neck="Fotia Gorget",
		ear1="Odr Earring",
		ear2="Sherida Earring",
		ring1="Regal Ring",
		ring2="Ilabrat Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%',}},
		ammo="Yetshila +1"
	})
	
	sets.precast['Savage Blade'] = set_combine(sets.PWS, {	
		head="Nyame Helm",						
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		waist="Sailfi Belt +1",
		neck="Anu Torque",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		ring1="Regal Ring",
		ring2="Epaminondas's Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		ammo="Aurgelmir Orb +1"
	})

	-- Magical WS Sets Below
	MWS_Set_Names = {'Normal'}

	sets.MWS  = {
		head="Nyame Helm",						
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Baetyl Pendant",
		waist="Orpheus's Sash",
		ring1="Dingir Ring",
		ring2="Epaminondas's Ring",
		back="Sacro Mantle",
		ear1="Friomisi Earring",
		ear2="Moonshade Earring",
		ammo="Seething Bomblet +1"}
						
	sets.MWS.Normal = set_combine(sets.MWS, {})
	
	sets.AeolianTH = set_combine(sets.MWS, {
		ammo="Perfect Lucky Egg",
		hands="Plunderer's Armlets +3"}) --Feet Skulker's Poulaines +3
	
	--Idle Sets Below
	Idle_Set_Names = {'Normal'}
	sets.Idle = {
		head="Malignance Chapeau",							
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Pillager's Poulaines +3",
		neck="Loricate Torque +1",
		waist="Gishdubar Sash",
		ring1="Warden's Ring",
		ring2="Defending Ring",
		back="Moonlight Cape",
		ear1="Infused Earring",
		ear2="Telos Earring",
		ammo="Staunch Tathlum +1"}

	sets.Idle.Normal = set_combine(sets.Idle, {})
	
	sets.hastesambawaist = {waist="Sailfi Belt +1"}

	Melee_Set_Names = {'DT', 'DTTH', 'DblAtt', 'Ambush', 'Crit', 'MaxTH'}

	sets.Melee = {  
		head="Adhemar Bonnet +1", --Skulker's Bonnet +3							
		body="Pillager's Vest +3",
		hands="Gleti's Gauntlets",
		legs="Samnuha Tights",
		feet="Plunderer's Poulaines +3",
		neck="Assassin's Gorget +2",
		waist="Reiki Yotai",
		ring1="Gere Ring",
		ring2="Hetairoi Ring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
		ear1="Sherida Earring",
		ear2="Skulker's Earring",
		ammo="Aurgelmir Orb +1"
	}
	
	sets.Melee.Ambush = set_combine(sets.Melee, {
		body="Plunderer's Vest +3"
	})
	
	sets.Melee.MaxTH = set_combine(sets.Melee, {
		hands="Plunderer's Armlets +3",
		feet="Skulker's Poulaines +1",
		waist="Chaac Belt",
		ammo="Perfect Lucky Egg"
	})

	sets.Melee.DT = set_combine(sets.Melee, {
		head="Malignance Chapeau",
		body="Malignance Tabard",	
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots"})

	sets.Melee.DTTH = set_combine(sets.Melee.DT, {	
		hands="Plunderer's Armlets +3",
		ammo="Perfect Lucky Egg"}) --Feet Skulker's Poulaines +3

	sets.Melee.Crit = set_combine(sets.Melee, {
		head="Gleti's Mask",
		body="Gleti's Cuirass",	
		hands="Mummu Wrists +2",
		legs="Mummu Kecks +2", -- Skulker's Culottes
		feet="Mummu Gamashes +2",
		ring1="Mummu Ring",
		ear2="Odr Earring",
		back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}})

	sets.Melee.DblAtt = set_combine(sets.Melee, {})


	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')
end

function precast(spell)	
	if sets.precast[spell.english] then
        equip(sets.precast[spell.english])
	elseif spell.type == 'WeaponSkill' then
		if spell.name == "Aeolian Edge" then
			if AeolianTH_Flag then
				equip(sets.AeolianTH)
			else
				equip(sets.MWS[MWS_Set_Names[MWS_Index]])
			end
		else
			equip(sets.PWS[PWS_Set_Names[PWS_Index]])
		end
		
		if buffactive['Trick Attack'] then
			equip(sets.precast["Trick Attack"])
		end
		
		if buffactive['Sneak Attack'] then
			equip(sets.precast["Sneak Attack"])
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
		
		if spell.name == 'Haste Samba' or buffactive['Haste Samba'] then
			equip(sets.hastesambawaist)
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
		
		if buffactive['Haste Samba'] then
			equip(sets.hastesambawaist)
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
	elseif command == 'equiptf' then
		equip(sets.MWS[MWS_Set_Names[MWS_Index]])
	elseif command == 'equipws' then
		equip(sets.PWS[PWS_Set_Names[PWS_Index]])
	elseif command == 'aeth' then
		AeolianTH_Flag = not AeolianTH_Flag
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