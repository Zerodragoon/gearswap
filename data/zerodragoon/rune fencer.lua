include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	TP_Index = 1
	Hands_Index = 1
	Idle_Index = 1
	Engaged_Flag = false
	Style_Lock_Id = 29

	--Default Macro Set for PLD
	send_command('input /macro book 13;wait .1;input /macro set 1;wait .1;wait 0.5;input //gs org')

	set_style_lock()
	
	sets.magic = {}
	sets.precast = {}
	sets.midcast = {}
	
	sets.magic.PreCast = {
		head="Carmine Mask +1", --14
		hands="Leyline Gloves", --8
		body="Dread Jupon", --7
		legs="Aya. Cosciales +2", --6
		feet="Carmine Greaves +1", --8
		ammo="Sapience Orb", --2
		neck="Baetyl Pendant", --4
		ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
		ring1="Weatherspoon Ring +1", --5 --3
		ring2="Kishar Ring", --4
		back={ name="Ogma's Cape", augments={'"Fast Cast"+10'}} --10
	} --64

	sets.magic.MidCast = { --10
		ammo="Staunch Tathlum +1", -- 11
		neck="Loricate Torque +1", --5
		head="Erilaz Galea +3", --20
		body="Nyame Mail",
		hands="Regal Gauntlets", --10
		legs="Carmine Cuisses +1", --20
		feet={ name="Taeon Boots", augments={'Spell interruption rate down -10%','Phalanx +3',}}, --10
		waist="Rumination Sash", --10
		ring1="Moonlight Ring",
		ring2="Defending Ring",
		ear1="Trux Earring",
		ear2="Cryptic Earring",
		back={ name="Ogma's Cape", augments={'"Fast Cast"+10'}}  --10
	} --106
	
	sets.magic.MidCastFullDT = set_combine(sets.magic.MidCast, {
		head="Nyame Helm",								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		feet="Nyame Sollerets",
	})	
	
	sets.magic.MidCastEnmity = set_combine(sets.magic.MidCast, {
		ammo="Staunch Tathlum +1",
		--head={ name="Nyame Helm", augments={'Path: B',}},
		head="Halitus Helm",
		body="Emet Harness +1",
		--hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck={ name="Futhark Torque +2", augments={'Path: A',}},
		waist="Kasiri Belt",
		left_ear="Trux Earring",
		right_ear="Cryptic Earring",
		left_ring="Supershear Ring",
		right_ring="Eihwaz Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	})
	
	sets.magic.MidCastCures = set_combine(sets.magic.MidCast, {
		neck="Sacro Gorget",
		waist="Sroda Belt",
		ear1="Mendicant's Earring",
		ear2="Halasz Earring",
		ring1="Evanescence Ring"
	})
	
	sets.precast['Vivacious Pulse'] = set_combine(sets.magic.MidCastEnmity, {
		main="Peord claymore",
		head="Erilaz Galea +3",
		legs="Runeist Trousers +2",
		neck="Incanter's Torque",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1"
	})
	
	sets.precast['Gambit'] = set_combine(sets.magic.MidCastEnmity, {
		hands="Runeist Mitons +3"
	})
	
	sets.precast['Rayke'] = set_combine(sets.magic.MidCastEnmity, {
		feet="Futhark Boots +1"
	})
	
	sets.precast['Valiance'] = set_combine(sets.magic.MidCastEnmity, {
		body="Runeist Coat +3",
		legs="Futhark Trousers +3"
	})
	
	sets.precast['Vallation'] = set_combine(sets.magic.MidCastEnmity, {
		body="Runeist Coat +3",
		legs="Futhark Trousers +3"
	})
	
	sets.precast['Battuta'] = set_combine(sets.magic.MidCastEnmity, {
		head="Futhark Bandeau +3"
	})
	
	sets.precast['Elemental Sforzo'] = set_combine(sets.magic.MidCastEnmity, {
		body="Futhark Coat +3"
	})
	
	sets.precast['Liement'] = set_combine(sets.magic.MidCastEnmity, {
		body="Futhark Coat +3"
	})
	
	sets.midcast['Healing Breeze'] = sets.magic.MidCastCures
	sets.midcast['Magic Fruit'] = sets.magic.MidCastCures
	sets.midcast['Wild Carrot'] = sets.magic.MidCastCures
	sets.midcast['Flash'] = sets.magic.MidCastEnmity
	sets.midcast['Foil'] = sets.magic.MidCastEnmity
	sets.midcast['Blank Gaze'] = sets.magic.MidCastEnmity
	sets.midcast['Jettatura'] = sets.magic.MidCastEnmity
	sets.midcast['Geist Wall'] = sets.magic.MidCastEnmity
	sets.midcast['Sandspin'] = sets.magic.MidCastEnmity
	sets.midcast['Sheep Song'] = sets.magic.MidCast
	sets.midcast['Poisonga'] = sets.magic.MidCast

	sets.midcast.Enhancing = set_combine(sets.magic.MidCast, {
		head="Erilaz Galea +3",
		hands="Regal Gauntlets",
		legs="Futhark Trousers +3",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		ear1="Mimir Earring",
		ear2="Andoaa Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back={ name="Ogma's Cape", augments={'"Fast Cast"+10'}} 
	})
	
	sets.midcast['Phalanx'] = set_combine(sets.magic.Enhancing, {
		head="Futhark Bandeau +3",
		body={ name="Taeon Tabard", augments={'Phalanx +3',}},
		hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
		legs={ name="Taeon Tights", augments={'Phalanx +3',}},
		feet={ name="Taeon Boots", augments={'Phalanx +3',}},
	})
	
	sets.midcast["Stoneskin"] = set_combine(sets.midcast.Enhancing, {
		ear1="Earthcry Earring",
		waist="Siegel Sash"
	})
	
	sets.midcast["Protect IV"] = set_combine(sets.magic.MidCast, {
		ring1="Sheltered Ring",
		head="Nyame Helm",								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
	})
	
	sets.midcast["Shell V"] = set_combine(sets.magic.MidCast, {
		ring1="Sheltered Ring",
		head="Nyame Helm",								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
	})
	
	sets.midcast["Regen IV"] = set_combine(sets.midcast.Enhancing, {
		main="Peord claymore",
		body={ name="Taeon Tabard", augments={'"Cure" potency +5%','"Regen" potency+3',}},
		head="Runeist Bandeau +3",
		feet={ name="Taeon Boots", augments={'"Cure" potency +5%','"Regen" potency+3',}},
		ear2="Erilaz Earring",
		neck="Sacro Gorget",
		waist="Sroda Belt"
	})
	
	sets.midcast["Temper"] = set_combine(sets.midcast.Enhancing, {
		head="Carmine Mask +1",
		hands="Runeist Mitons +3",
		legs="Carmine Cuisses +1"
	})

	Hands_Set_Names = {'EpeoTank', 'EpeoDD', 'Axe'}	

	sets.Hands = {}	

	sets.Hands.EpeoTank = { 
		main="Epeolatry",
		sub="Refined Grip +1"
	}
	
	sets.Hands.EpeoDD = { 
		main="Epeolatry",
		sub="Utu Grip"
	}
	
	sets.Hands.Axe = { 
		main="Hepatizon Axe +1",
		sub="Utu Grip"
	}

	--TP Sets Below
	TP_Set_Names = {'Standard', 'Magic', 'Resistance', 'Hybrid', 'DD'}

	sets.TP = { 
		ammo="Staunch Tathlum +1",
		head="Nyame Helm",							
		body="Nyame Mail",
		hands="Turms Mittens +1",
		legs="Erilaz Leg Guards +3",
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",
		waist="Flume Belt +1",
		ring1="Moonlight Ring",
		ring2="Moonlight Ring",
		ear1="Ethereal Earring",
		ear2="Erilaz Earring",
		back={ name="Ogma's Cape", augments={'"Enmity"+10'}} -- HP +60, M.Eva. +20, Eva. +20, Enmity +10, M.Eva +10, Phys. dmg. taken -10
	}

	sets.TP.Standard = set_combine(sets.TP, {})
	
	sets.TP.Magic = set_combine(sets.TP, {
		hands="Nyame Gauntlets",
		feet="Erilaz Greaves +3",
		ring2="Shadow Ring"
	})
	
	sets.TP.Resistance = set_combine(sets.TP.Magic, {
		neck="Warder's Charm +1",
		body="Runeist Coat +3",
		feet="Erilaz Greaves +3",
		waist="Engraved Belt",
	--	ring1="Archon Ring"
	})
	
	sets.TP.Hybrid = set_combine(sets.TP, {
		hands="Nyame Gauntlets",
		feet="Nyame Sollerets",
		waist="Sailfi Belt +1",
		neck="Anu Torque",
		ear1="Sherida Earring",
		ear2="Telos Earring",
		ring2="Chirich Ring +1",
		ammo="Aurgelmir Orb +1",
		back={ name="Ogma's Cape", augments={'"Dbl.Atk."+10'}} -- STR +30, Acc +20, Attk +20, Double Attk +10, PDT -10
	})

	sets.TP.DD = set_combine(sets.TP, {
		ammo="Coiste Bodhar",
  		head="Ashera Harness",	
   		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Samnuha Tights",
		feet={ name="Herculean Boots", augments={'Quadruple Attack +3'}},
		neck="Anu Torque",
		waist="Sailfi Belt +1",
		left_ear="Cessance Earring",
		right_ear="Sherida Earring",
		left_ring="Moonlight Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's Cape", augments={'"Dbl.Atk."+10'}} -- STR +30, Acc +20, Attk +20, Double Attk +10, PDT -10
	})

	sets.WS = {
		ammo="Knobkierrie",
		head="Nyame Helm",								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Ilabrat Ring",
		back={ name="Ogma's Cape", augments={'"Weapon skill Damage"+10'}} --DEX +30, Acc/Atk +20, WSD +10
	}
	
	sets.AxeAcc = {
		ammo="Knobkierrie",
		head="Nyame Helm",								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Lissome Necklace",
		waist="Kentarch Belt +1",
		left_ear="Telos Earring",
		right_ear="Mache Earring +1",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Ogma's Cape", augments={'"Weapon skill Damage"+10'}} --DEX +30, Acc/Atk +20, WSD +10
	}
	
	sets.precast['Steel Cyclone'] = sets.AxeAcc
	sets.precast['Upheaval'] = sets.AxeAcc
	sets.precast['Full Break'] = sets.AxeAcc

	--Idle Sets Below
	Idle_Set_Names = {'DTMove', 'DT', 'DTMagic', 'DTResistance'}
	sets.Idle = {}
	
	sets.Idle.DT = sets.TP.Standard
	sets.Idle.DTMagic = sets.TP.Magic
	sets.Idle.DTResistance = sets.TP.Resistance
	sets.Idle.DTMove  = set_combine(sets.TP.Standard, {
		legs="Carmine Cuisses +1",
		ring2="Defending Ring"
	})
	
	send_command('wait 5;input //gs c startup;wait 1;input //gs validate;input //shield on')

end

function precast(spell)	
	if spell.english == 'Valiance' and buffactive.Vallation then
		cast_delay(0.2)
		send_command('cancel Vallation')  
	end

	if sets.precast[spell.english] then
        equip(sets.precast[spell.english])
		
		if spell.english == "Gambit" then
            send_command('timers delete "Gambit"')
            send_command('timers create "Gambit" 96 down;wait 66;input /party Gambit [WEARING OFF IN 30 SEC.];wait 30;input /party Gambit [OFF];timers delete "Gambit"')
		end
		
		if spell.english == "Rayke" then
            send_command('timers delete "Rayke"')
            send_command('timers create "Rayke" 47 down;wait 32;input /party Rayke [WEARING OFF IN 15 SEC.];wait 15;input /party Rayke [OFF];timers delete "Rayke"')
		end
	elseif spell.type == 'WeaponSkill' then
        equip(sets.WS)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')        
	elseif spell.type == "WhiteMagic" or spell.type == "BlueMagic" then
		equip(sets.magic.PreCast)
	elseif spell.type == "Trust" then
		equip(sets.magic.PreCast)
	elseif spell.type == "JobAbility" then
		equip(sets.magic.MidCastEnmity)   	
	end
end

function midcast(spell)
	if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
		
		if spell.skill == 'Enhancing Magic' and Engaged_Flag then
			equip(sets.magic.MidCastFullDT)
		end
	elseif spell.skill == 'Enhancing Magic' then
		equip(sets.midcast.Enhancing)
		if Engaged_Flag then
			equip(sets.magic.MidCastFullDT)
		end
	elseif spell.type == "WhiteMagic" or spell.type == "BlueMagic" then
		equip(sets.magic.MidCast)   
	end
end

function aftercast(spell)	
	if player.status=='Engaged' then
		equip(sets.TP[TP_Set_Names[TP_Index]]) 
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])	
	else		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]])	
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])			
	end		
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
		Engaged_Flag = false		
	elseif new == 'Engaged' then
		equip(sets.TP[TP_Set_Names[TP_Index]]) 
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
		Engaged_Flag = true
	end	
end

--Toggle Self Commands with //gs c [command name] 
--Example type in chat //gs c tp (case sensitive)
--Example Make a macro /console gs c tp (case sensitive)
function self_command(command)
	if command:sub(1, 2) == 'tp' then
		Temp_TP_Index = command:sub(3,5)
		
		if Temp_TP_Index == '' then
			TP_Index = TP_Index +1
		else 
			TP_Index = tonumber(Temp_TP_Index)
		end
		
		if TP_Index > #TP_Set_Names then TP_Index = 1 end
		add_to_chat(207,'TP Set Changed to: '..TP_Set_Names[TP_Index]..'')
		status_change(player.status)
	elseif command:sub(1, 4) == 'idle' then
		Temp_Idle_Index = command:sub(5,7)
		
		if Temp_Idle_Index == '' then
			Idle_Index = Idle_Index +1
		else 
			Idle_Index = tonumber(Temp_Idle_Index)
		end
	
		if Idle_Index > #Idle_Set_Names then Idle_Index = 1 end
		add_to_chat(207,'Idle Set Changed to: '..Idle_Set_Names[Idle_Index]..'')
		equip(sets.Idle[Idle_Set_Names[Idle_Index]])
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
	elseif command == 'startup' then
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
		equip(sets.Idle[Idle_Set_Names[Idle_Index]])
	elseif command == 'forcesets' then
		if player.status=='Engaged' then
			equip(sets.TP[TP_Set_Names[TP_Index]]) 
			equip(sets.Hands[Hands_Set_Names[Hands_Index]])	
		else		
			equip(sets.Idle[Idle_Set_Names[Idle_Index]])	
			equip(sets.Hands[Hands_Set_Names[Hands_Index]])			
		end	
	end
end

function file_unload()
	send_command('shield off')
end