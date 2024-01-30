include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	Style_Lock_Id = 19
	BURST_Flag = false

	--Default Macro Set for RNG
	send_command('input /macro book 8;wait .1;input /macro set 1;wait 0.5;input //gs org')
	
	set_style_lock()
	
	send_command('wait 5.0;input //lua l dressup')
	
	--Precast
	sets.precast = {}
	
	sets.precast['Futae'] = {hands="Hattori Tekko +2"}
	sets.precast['Mijin Gakure'] = {legs="Mochizuki Hakama +1"}
	sets.precast['Sange'] = {body="Mochizuki Chainmail +1"}
	sets.precast['Innin'] = {head="Mochizuki Hatsuburi +3"}
	sets.precast['Yonin'] = {head="Mochizuki Hatsuburi +3"}

		
	-- Magic Sets Below		
	sets.precast.FastCast = {
		head={ name="Herculean Helm"},	--7
		body="Dread Jupon", --7
		hands="Leyline Gloves", --8
		legs="Enif Cosciales", --8
		feet="Hattori Kyahan +2",
		neck="Orunmila's Torque", --5
		ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
		ring1="Weatherspoon Ring +1", --6 
		ring2="Prolix Ring", --2
		ammo="Sapience Orb", --2
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	} --59
	
	sets.precast.Utsusemi = set_combine(sets.precast.FastCast,{
		neck="Magoraga Beads", --10
		body="Passion Jacket" --10
	}) --64

	sets.precast['Curing Waltz III'] = {
		--head="Mummu Bonnet +2",
		head="Anwig Salade",
		body="Passion Jacket",
		hands="Slither Gloves +1", --5
		feet="Rawhide Boots", --8
		ring1="Asklepian Ring",
		ring2="Valseur's Ring", --3
		ear1="Handler's Earring +1",
		ear2="Enchanter's Earring +1",
		ammo="Yamarang"
	}

	Hands_Set_Names = {'DD', 'Naegling', 'Crep', 'Tauret', 'Malev'}

	sets.Hands = {}	

	sets.Hands.DD = { 
		main="Heishi Shorinken",
		sub="Kunimitsu"
	}
	
	sets.Hands.Naegling = { 
		main="Naegling",
		sub="Uzura +2"
	}
	
	sets.Hands.Crep = { 
		main="Crepuscular Knife",
		sub="Kunimitsu"
	}
	
	sets.Hands.Tauret = { 
		main="Tauret",
		sub="Kunimitsu"
	}
	
	sets.Hands.Malev = { 
		main="Malevolence",
		sub="Malevolence"
	}
			
	-- Physical WS Sets Below

	PWS_Set_Names = {'Normal'}
	sets.PWS = {
		head="Nyame Helm",								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets", -- Hattori Kyahan +3
		neck="Ninja Nodowa +2",
		waist="Fotia Belt",
		ring1="Epaminondas's Ring",
		ring2="Ephramad's Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		ammo="Crepuscular Pebble"}

	sets.PWS.Normal = set_combine(sets.PWS, {})
	
	sets.precast['Savage Blade'] = set_combine(sets.PWS, {
		ring1="Sroda Ring",
		ear2="Hattori Earring +1"--Hattori Earring +2
	})
	
	sets.precast['Blade: Shun'] = set_combine(sets.PWS, {
		head="Mpaca's Cap",
		body={ name="Mpaca's Doublet", augments={'Path: A',}},
		hands="Adhemar Wristbands +1",
		legs="Mpaca's Hose", 
		feet="Mpaca's Boots",
		ear1="Moonshade Earring",
		ring1="Regal Ring",
		ring2="Gere Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
	})
	
	sets.precast['Blade: Jin'] = set_combine(sets.PWS, {
		head="Adhemar Bonnet +1",
		body="Abnoba Kaftan", 
		hands="Adhemar Wristbands +1",
		legs="Mpaca's Hose", 
		feet="Mpaca's Boots", 
		ear1="Brutal Earring", 
		neck="Fotia Gorget", 
		ring1="Hetairoi Ring", 
		ring2="Gere Ring", 
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	})
	
	sets.precast['Blade: Hi'] = set_combine(sets.PWS, {
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
		body={ name="Mpaca's Doublet", augments={'Path: A',}},
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		ammo="Yetshila +1",
		waist="Sailfi Belt +1",
		right_ear="Odr Earring",
		left_ring="Ilabrat Ring",
		right_ring="Regal Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
	})
	
	sets.precast['Eviseration'] = set_combine(sets.PWS, {
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
		body={ name="Mpaca's Doublet", augments={'Path: A',}},
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		ammo="Yetshila +1",
		waist="Sailfi Belt +1",
		right_ear="Odr Earring",
		left_ring="Ilabrat Ring",
		right_ring="Regal Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
	})
	
	sets.precast['Blade: Ku'] = set_combine(sets.PWS, {
        head="Blistering Sallet +1",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Tatenashi Haidate +1",
		legs="Tatenashi Sune-Ate +1",
		neck="Fotia Gorget",
		ear1="Brutal Earring",
		ear2="Moonshade Earring",
		ring1="Regal Ring",
		ring2="Gere Ring",
        back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
		ammo="Seki Shuriken",
	})
	
	sets.precast['Blade: Ten'] = set_combine(sets.PWS, {
		waist="Kentarch Belt +1"
	})

	-- Magical WS Sets Below
	MWS_Set_Names = {'Normal'}

	sets.MWS  = {
		head="Mochizuki Hatsuburi +3",								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Moonlight Nodowa",
		waist="Orpheus's Sash",
		ring1="Dingir Ring",
		ring2="Epaminondas's Ring",
		back={ name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		ammo="Seething Bomblet +1"}
						
	sets.MWS.Normal = set_combine(sets.MWS, {})
	
	sets.precast['Blade: Retsu'] = set_combine(sets.MWS, {})
	sets.precast['Blade: Teki'] = set_combine(sets.MWS, {})
	sets.precast['Blade: To'] = set_combine(sets.MWS, {})
	sets.precast['Blade: Chi'] = set_combine(sets.MWS, {})
	sets.precast['Blade: Ei'] = set_combine(sets.MWS, {
		head="Pixie Hairpin +1",
		ring2="Archon Ring"
	})
	sets.precast['Blade: Yu'] = set_combine(sets.MWS, {})
	sets.precast['Aeolian Edge'] = set_combine(sets.MWS, {})
	
	sets.Enmity = {
		ammo="Sapience Orb",
		head="Malignance Chapeau",
		body="Emet Harness +1",
		hands="Kurys Gloves",
		legs="Wukong's Hakama +1",
		feet="Ahosi Leggings",
		neck="Unmoving Collar +1",
		waist="Sinew Belt",
		left_ear="Trux Earring",
		right_ear="Cryptic Earring",
		left_ring="Petrov Ring",
		right_ring="Supershear Ring",
		back={ name="Andartia's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Enmity+10','Phys. dmg. taken-8%',}},
	}

	sets.precast.Provoke = sets.Enmity
	sets.precast.Pflug = sets.Enmity
	sets.precast.Vallation = sets.Enmity
	sets.precast.Valiance = sets.Enmity
	sets.precast.Swordplay = sets.Enmity
	sets.precast.Flash = sets.Enmity
	sets.precast.Foil = sets.Enmity
	
	sets.midcast = {}

	sets.midcast.Orepheus = {
		waist="Orpheus's Sash"
	}
	
	--Idle Sets Below
	Idle_Set_Names = {'Normal'}
	sets.Idle = {
		head="Malignance Chapeau",							
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Danzo Sune-ate",
		neck="Loricate Torque +1",
		waist="Platinum Moogle Belt",
		ring1="Warden's Ring",
		ring2="Defending Ring",
		back="Andartia's Mantle",
		ear1="Infused Earring",
		ear2="Telos Earring",
		ammo="Seki Shuriken"}

	sets.Idle.Normal = set_combine(sets.Idle, {})
	
	sets.Idle.Night = {
		feet="Hachiya kyahan +2"
	}

	Melee_Set_Names = {'DblAtt', 'MixedDT', 'DT', 'Mpaca', 'Tank',}

	sets.Melee = {  
		head="Mpaca's Cap",							
		body="Tatenashi Haramaki +1",
		hands="Adhemar Wristbands +1",
		legs="Samnuha Tights",
		feet="Tatenashi Sune-ate +1",
		neck="Ninja Nodowa +2",
		waist="Sailfi Belt +1",
		ring1="Gere Ring",
		ring2="Epona's Ring",
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
		ear1="Cessance Earring", 
		ear2="Telos Earring", --Hattori Earring +2
		ammo="Seki Shuriken"
	}
	
	sets.Melee.MixedDT = set_combine(sets.Melee, {
		head="Malignance Chapeau",
		body="Mpaca's Doublet",	
		hands="Malignance Gloves",
		legs="Mpaca's Hose",
		feet="Malignance Boots"})

	sets.Melee.DT = set_combine(sets.Melee, {
		head="Malignance Chapeau",
		body="Malignance Tabard",	
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots"})
		
	sets.Melee.Mpaca = set_combine(sets.Melee, {
		head="Mpaca's Cap",
		body="Mpaca's Doublet",	
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots"})
		
	sets.Melee.Tank = set_combine(sets.Melee.DT, {
		ammo="Date Shuriken"
	})

	sets.Melee.DblAtt = set_combine(sets.Melee, {})
	
	sets.midcast.Ninjutsu = {
		head="Mochizuki Hatsuburi +3",						
		body="Gyve Doublet",
		hands="Nyame Gauntlets",
		legs="Gyve Trousers",
		feet="Mochizuki Kyahan +3",
		neck="Sibyl Scarf",
		waist="Eschan Stone",
		ring1="Dingir Ring",
		ring2="Acumen Ring",
		back={ name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
		ear1="Friomisi Earring",
		ear2="Crematio Earring",
		ammo="Ghastly Tathlum +1"
    }
	
	sets.midcast.NinjutsuBurst = set_combine(sets.midcast.Ninjutsu, {
		body="Nyame Mail",
		hands="Hattori Tekko +2",
		legs="Nyame Flanchard",
		ring2="Mujin Band"
	})
	
	sets.midcast.NinjutsuBuff = set_combine(sets.Melee.MixedDT, {
		hands="Mochizuki Tekko +3",
		ring1="Defending Ring",
		neck="Loricate Torque +1"
	})
	
	sets.midcast.Utsusemi = set_combine(sets.Melee.NinjutsuBuff, {
		feet="Hattori Kyahan +2",
		back="Andartia's Mantle"
	})
	
	sets.midcast.NinjutsuFutae = {
		hands="Hattori Tekko +2",
	}
	
	sets.midcast['Tonko: Ichi'] = sets.midcast.NinjutsuBuff
	sets.midcast['Tonko: Ni'] = sets.midcast.NinjutsuBuff
	sets.midcast['Monomi: Ichi'] = sets.midcast.NinjutsuBuff
	sets.midcast['Myoushu: Ichi'] = sets.midcast.NinjutsuBuff
	sets.midcast['Migawari: Ichi'] = sets.midcast.NinjutsuBuff
	sets.midcast['Gekka: Ichi'] = sets.midcast.NinjutsuBuff
	sets.midcast['Yain: Ichi'] = sets.midcast.NinjutsuBuff
	sets.midcast['Kakka: Ichi'] = sets.midcast.NinjutsuBuff

	sets.midcast['Utsusemi: Ichi'] = sets.midcast.Utsusemi
	sets.midcast['Utsusemi: Ni'] = sets.midcast.Utsusemi
	sets.midcast['Utsusemi: San'] = sets.midcast.Utsusemi
	
	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')
end

function precast(spell)	
	if sets.precast[spell.english] then
        if checkWSDistance(spell) then
			equip(sets.precast[spell.english])
		end
	elseif spell.type == 'WeaponSkill' then
		if checkWSDistance(spell) then
			equip(sets.PWS[PWS_Set_Names[PWS_Index]])	
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
	if spell.english:find("Ring") then
		return
	end
	
	if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
	elseif spell.type == 'Ninjutsu' then		
		if BURST_Flag then
			equip(sets.midcast.NinjutsuBurst)
		else 
			equip(sets.midcast.Ninjutsu)
		end
		
		if buffactive.Futae then
			equip(sets.midcast.NinjutsuFutae)
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

		if world.time >= 17*60 or world.time < 7*60 then -- Dusk to Dawn time.
            equip(sets.Idle.Night)
        end		
	end
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif new == 'Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])

		if world.time >= 17*60 or world.time < 7*60 then -- Dusk to Dawn time.
            equip(sets.Idle.Night)
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
	elseif command == 'burst' then
		add_to_chat(207,'Burst Set: '..tostring(not BURST_Flag)..'')
		BURST_Flag = not BURST_Flag
	elseif command =='element' then
		Nuke_Index = Nuke_Index +1

		if Nuke_Index > #Nuke_Elements then 
			Nuke_Index = 1
		end
		
		add_to_chat(207,'Element Changed to: '..Nuke_Elements[Nuke_Index]..'')
	elseif command:sub(1, 4) == 'nuke' then
		Nuke_Tier = command:sub(5,6)
		
		send_command('input /ma "'..getNinjaNukeString(Nin_Nuke_Elements[Nuke_Index], Nuke_Tier)..'" <t> ')
	elseif command == 'update' then
		status_change(player.status)
		add_to_chat(207,'Update player status...')
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
	send_command('lua u dressup')
end