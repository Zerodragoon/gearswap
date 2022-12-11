include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	TP_Index = 1
	Hands_Index = 1
	Idle_Index = 1
	SRODA_Flag = false
	Style_Lock_Id = 6

	--Default Macro Set for PLD
	send_command('input /macro book 2;wait .1;input /macro set 1;wait .1;wait 0.5;input //gs org')
	
	set_style_lock()
	
	sets.magic = {}
	sets.precast = {}
	sets.midcast = {}
	
	sets.magic.Sroda = {
		ear1="Knightly Earring",
		waist="Sroda Belt"
	}
	
	sets.magic.PreCast = {
		head="Carmine Mask +1", --14
		hands="Leyline Gloves", --8
		body="Sacro Breastplate", --10
		legs="Eschite Cuisses", --5
		feet="Odyssean Greaves", --10 --Chevalier's Sabatons +3
		ammo="Sapience Orb", --2
		neck="Baetyl Pendant", --4
		ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
		ring1="Weatherspoon Ring +1", --6 --3
		ring2="Kishar Ring", --4
		back={ name="Rudianos's Mantle", augments={'"Fast Cast"+10'}} --10
	} --77
	
	sets.magic.MidCast = {
		ammo="Staunch Tathlum +1", -- 11
		neck="Loricate Torque +1", --5
		head="Souveran Schaller +1", --20
		body="Souveran Cuirass +1",
		hands="Souveran Handschuhs +1",
		legs="Founder's Hose", --30
		feet="Odyssean Greaves", --20
		waist="Rumination Sash", --10
		ring1="Moonlight Ring",
		ring2="Defending Ring",
		ear1="Nourishing Earring +1",
		ear2="Chevalier's Earring +1",
		back={ name="Rudianos's Mantle", augments={'"Fast Cast"+10'}} 
	} --106
	
	sets.magic.MidCastEnmity = set_combine(sets.magic.MidCast, {
		head="Loess Barbuta +1",
		neck="Moonlight Necklace", --15
		ear1="Knightly Earring", --9
		ear2="Cryptic Earring",
		back="Earthcry Mantle"
	}) --105
	
	sets.magic.MidCastMacc = set_combine(sets.magic.MidCast, {
		ear1="Crepuscular Earring",
		ear2="Enchanter's Earring +1",
		neck="Moonlight Necklace", --15,
		ammo="Pemphredo Tathlum",
		head="Sakpata's Helm",
   		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings", 
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Izdubar Mantle"
	}) --114

	sets.magic.Enmity = {
	--	main="Burtgang",
	--	sub="Srivatsa",
		neck="Moonlight Necklace",
		head="Loess Barbuta +1",							
		body="Souveran Cuirass +1",
		hands="Souveran Handschuhs +1",
		legs="Souveran Diechlings +1",
		feet="Souveran Schuhs +1", --Chevalier's Sabtons +3?
		waist="Creed Baudrier",
		ring1="Apeile Ring +1",
		ring2="Apeile Ring",
		ear1="Trux Earring",
		ear2="Cryptic Earring",
		back="Earthcry Mantle",
		ammo="Sapience Orb"
	}	
	
	sets.precast.Sentinel = set_combine(sets.magic.Enmity, {
		feet = "Caballarius Leggings +3"
	})
	
	sets.precast.Rampart = set_combine(sets.magic.Enmity, {
		head = "Caballarius Coronet +3"
	})
	
	sets.precast.Chivalry = set_combine(sets.magic.Enmity, {
		hands = "Caballarius Gauntlets +3"
	})
	
	sets.precast['Shield Bash'] = set_combine(sets.magic.Enmity, {
		--sub="Aegis",
		hands = "Caballarius Gauntlets +3",
		ear1 = "Knightly Earring"
	})
	
	sets.precast['Holy Circle'] = {
		feet="Reverence Leggings +1"
	}
	
	sets.precast['Cover'] = {
		head="Reverence Coronet +1"
	}
	
	sets.precast['Atonement'] = sets.magic.Enmity
	
	sets.midcast['Flash'] = sets.magic.Enmity
	sets.midcast['Phalanx'] = set_combine(sets.magic.MidCast, {
		main="Sakpata's Sword",
		sub="Priwen",
		head="Yorium Barbuta",
		body="Yorium Cuirass",
		hands="Souveran Handschuhs +1",
		legs="Sakpata's Cuisses",
		neck="Incanter's Torque",
		feet="Souveran Schuhs +1",
		back="Weard Mantle",
		waist="Olympus Sash",
		ear1="Mimir Earring",
		ear2="Andoaa Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1"
	})
	sets.midcast['Blank Gaze'] = sets.magic.MidCastEnmity
	sets.midcast['Jettatura'] = sets.magic.MidCastEnmity
	sets.midcast['Geist Wall'] = sets.magic.MidCastEnmity
	sets.midcast['Sheep Song'] = sets.magic.MidCastEnmity
	sets.midcast['Sandspin'] = sets.magic.MidCastEnmity
	sets.midcast['Fightful Roar'] = sets.magic.MidCastMacc

	sets.midcast["Protect V"] = set_combine(sets.magic.MidCast, {
		sub="Srivatsa",
		hands="Regal Gauntlets",
		ring1="Sheltered Ring"
	})
	
	sets.midcast["Shell IV"] = set_combine(sets.magic.MidCast, {
		hands="Regal Gauntlets",
		ring1="Sheltered Ring"
	})
	
	sets.midcast["Crusade"] = set_combine(sets.magic.MidCast, {
		hands="Regal Gauntlets"
	})
	
	sets.midcast["Reprisal"] = set_combine(sets.magic.MidCast, {
		--sub="Priwen",
		hands="Regal Gauntlets"
	})
	
	sets.midcast["Cocoon"] = set_combine(sets.magic.MidCast, {
		hands="Regal Gauntlets"
	})
	
	sets.midcast["Enlight"] = set_combine(sets.magic.MidCast, {
		hands="Regal Gauntlets"
	})
	
	sets.midcast["Enlight II"] = set_combine(sets.magic.MidCast, {
		hands="Regal Gauntlets"
	})

	Hands_Set_Names = {'Aegis', 'Ochain', 'Srivatsa', 'SAegis', 'SSrivatsa', 'Malevolence'}	

	sets.Hands = {}	

	sets.Hands.Aegis = { 
		main="Burtgang",
		sub="Aegis"
	}
	
	sets.Hands.Ochain = { 
		main="Burtgang",
		sub="Duban"
	}
	
	sets.Hands.Srivatsa = { 
		main="Burtgang",
		sub="Srivatsa"
	}
	
	sets.Hands.SAegis = { 
		main="Naegling",
		sub="Aegis"
	}
	
	sets.Hands.SSrivatsa = { 
		main="Naegling",
		sub="Srivatsa"
	}
	
	sets.Hands.Malevolence = { 
		main={ name="Malevolence", augments={'INT+9','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},
		sub="Srivatsa"
	}
			
	--TP Sets Below
	TP_Set_Names = {'Standard', 'TP', 'Sakpata'}

	sets.TP = { 
		ammo="Staunch Tathlum +1",
		head="Chevalier's Armet +2",
   		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",
		legs="Chevalier's Cuisses +2",
		feet="Sakpata's Leggings",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		ring1="Moonlight Ring",
		ring2="Moonlight Ring",
		back={ name="Rudianos's Mantle", augments={'"Fast Cast"+10'}},
		ear1="Ethereal Earring",
		ear2="Thureous Earring"
	}

	sets.TP.Standard = set_combine(sets.TP, {})
	
	sets.TP.Sakpata = set_combine(sets.TP, {
		head="Sakpata's Helm",
		legs="Sakpata's Cuisses",
	})
	
	sets.TP.TP = set_combine(sets.TP.Sakpata, {
		head="Sakpata's Helm",
		waist = "Sailfi Belt +1",
		ring2="Petrov Ring",
		ammo="Aurgelmir Orb +1",
		neck="Lissome Necklace",
		ear1="Crepuscular Earring",
		ear2="Telos Earring",
		back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}}
	})
 
	sets.WS = {
		ammo="Aurgelmir Orb +1",
		head="Nyame Helm",								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Republican Platinum Medal",
		waist="Windbuffet Belt +1",
		left_ear="Thrud Earring",
		right_ear="Ishvara Earring",
		left_ring="Beithir Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Rudianos's Mantle", augments={'"Weapon Skill Damage "+10'}}
	}

	--Idle Sets Below
	Idle_Set_Names = {'StandardMove', 'Standard', 'Sakpata'}
	sets.Idle = {}
	
	sets.Idle.Standard = set_combine(sets.TP.Standard,{	
		head="Chevalier's Armet +2",
   		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",
		legs="Chevalier's Cuisses +2",
		feet="Sakpata's Leggings",
		ring2="Apeile Ring +1" 
	}) 
	
	sets.Idle.StandardMove = set_combine(sets.Idle.Standard, {
		neck="Loricate Torque +1",
		legs="Carmine Cuisses +1"
	})
	
	sets.Idle.Sakpata = set_combine(sets.Idle.Standard, {
		head="Sakpata's Helm",
		legs="Sakpata's Cuisses",
	})

	send_command('wait 5;input //gs c startup;wait 1;input //gs validate;input //shield on')

end

function precast(spell)	
	if sets.precast[spell.english] then
                equip(sets.precast[spell.english])
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
		equip(sets.magic.Enmity)   	
	end
end

function midcast(spell)
	if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
	elseif spell.type == "WhiteMagic" or spell.type == "BlueMagic" then
		equip(sets.magic.MidCast)   
		
		if spell.english:find("Cur") and SRODA_Flag then
			equip(sets.magic.Sroda)
		end
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
	elseif new == 'Engaged' then
		equip(sets.TP[TP_Set_Names[TP_Index]]) 
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
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
	elseif command == 'sroda' then
		add_to_chat(207,'Sroda Set: '..tostring(not SRODA_Flag)..'')
		SRODA_Flag = not SRODA_Flag
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