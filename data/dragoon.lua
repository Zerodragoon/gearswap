include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	ATT_Cap_High = false
	ATT_Cap_Flag = false

	--Default Macro Set for DRG
	send_command('input /macro book 7;wait .1;input /macro set 1;wait 0.5;input //gs org;wait 2.0; input /lockstyleset 10')

	-- Hands Sets
	Hands_Set_Names = {'Trishula', 'Shining', 'Naegling', 'Malig'}
	
	organizer_items = {
		angon="Angon"
	}
	
	sets.precast = {}
	sets.Hands = {}	

	sets.Hands.Shining = { 
		main="Shining One",
		sub="Utu Grip"
	}

	sets.Hands.Trishula = { 
		main="Trishula",
		sub="Utu Grip"
	}
	
	sets.Hands.Naegling = { 
		main="Naegling",
		sub="Kraken Club"
	}
	
	sets.Hands.Malig = {
		main="Malignance Pole",
		sub="Utu Grip"
	}
						
	-- Physical WS Sets Below

	PWS_Set_Names = {'Normal'}

	sets.PWS = {
		head="Nyame Helm", --Peltast's Mezail +3					
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		ring1="Niqmaddu Ring",
		ring2="Regal Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		ammo="Knobkierrie"}

	sets.PWS.Normal = set_combine(sets.PWS, {})

	sets.PWS.Impulse = set_combine(sets.PWS, {
		head="Blistering Sallet +1", --Peltast Mezail +3
		neck="Dragoon's Collar +2",
		body="Gleti's Cuirass",
		waist="Sailfi Belt +1" --Legs Peltast's Cuissots +3?
	})
	
	sets.PWS.ImpulseCap = set_combine(sets.PWS.Impulse, {
		hands="Gleti's Gauntlets",
		feet="Gleti's Boots"
	})
	
	sets.PWS.Savage = set_combine(sets.PWS, {
		neck="Dragoon's Collar +2",
		ring1="Epaminondas's Ring",
		ring2="Sroda Ring",
		waist="Sailfi Belt +1"
	})
	
	sets.PWS.SavageCap = set_combine(sets.PWS.Savage, {
		--feet="Gleti's Boots"
		ear2="Peltast's Earring"
	})
	
	sets.PWS.SavageCapHigh = set_combine(sets.PWS.SavageCap, {
		head="Gleti's Mask",
		hands="Gleti's Gauntlets",
		--body="Gleti's Cuirass",
		--ammo="Crepuscular Pebble"
	})
	
	sets.precast["Camlann's Torment"] = set_combine(sets.PWS, {
		ear2="Ishvara Earring",
		neck="Dragoon's Collar +2",
	})
	
	sets.precast["Drakesbane"] = set_combine(sets.PWS, {
		ehead="Blistering Sallet +1",
		neck="Dragoon's Collar +2",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",  --Legs Peltast's Cuissots +3?
		feet="Gleti's Boots",
		waist="Sailfi Belt +1"
	})

	-- Magical WS Sets Below
	MWS_Set_Names = {'Normal'}

	sets.MWS = sets.PWS
						
	sets.MWS.Normal = set_combine(sets.MWS, {})
	
	--Idle Sets Below
	Idle_Set_Names = {'Normal'}
	sets.Idle = {
		head="Hjarrandi Helm",							
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Carmine Cuisses +1",
		feet="Gleti's Boots",
		neck="Loricate Torque +1",
		waist="Gishdubar Sash",
		ring1="Warden's Ring",
		ring2="Defending Ring",
		back="Moonlight Cape",
		ear1="Infused Earring",
		ear2="Telos Earring",
		ammo="Staunch Tathlum +1"}

	sets.Idle.Normal = set_combine(sets.Idle, {})

	Melee_Set_Names = {'DT', 'PetDT', 'Acc', 'DblAtt', 'Kraken'}

	sets.Melee = {  
		head="Flamma Zucchetto +2",							
		body="Gleti's Cuirass",
		hands="Sulevia's Gauntlets +2",
		legs={ name="Valorous Hose", augments={'"Dbl.Atk."+5','AGI+9','Accuracy+10','Attack+8',}},
		feet="Flamma Gambieras +2",
		neck="Anu Torque",
		waist="Sailfi Belt +1",
		ring1="Niqmaddu Ring",
		ring2="Petrov Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
		ear1="Sherida Earring",
		ear2="Schere Earring",
		ammo="Aurgelmir Orb +1"
	}

	sets.Melee.DblAtt = set_combine(sets.Melee, {})

	sets.Melee.DT = set_combine(sets.Melee, {
		head="Hjarrandi Helm",							
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",})
	
	sets.Melee.PetDT = set_combine(sets.Melee.DT, {
		neck="Dragoon's Collar +2"
	})
	
	sets.Melee.Acc = set_combine(sets.Melee.DT, {
		neck="Shulmanu Collar",
		ring1="Regal Ring",
		ring2="Chirich Ring +1",
		ear1="Mache Earring +1",
		ear2="Telos Earring"
	})
	
	sets.Melee.Kraken = set_combine(sets.Melee.DT, {
		head="Sulevia's Mask +2",
		body="Hjarrandi Breastplate",
		neck="Vim Torque +1",
		legs="Pteroslaver Brais +3",
		waist="Klouskap Sash +1",
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1",
		ear1="Crep. Earring",
		ear2="Digni. Earring",
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	})
 
	sets.Melee.Jump = set_combine(sets.Melee, {
		neck="Vim Torque +1",
		body="Vishap Mail +3",
		hands="Vishap Finger Gauntlets +3",
		legs="Pteroslaver Brais +3",
		feet="Ostro Greaves",
		ear2="Telos Earring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	})

	sets.precast['Jump'] = sets.Melee.Jump
	sets.precast['Super Jump'] = sets.Melee.Jump
	sets.precast['Soul Jump'] = sets.Melee.Jump 
	
	sets.precast['High Jump'] = set_combine(sets.Melee.Jump, {
		legs="Vishap Brais +3",
	})
	
	sets.precast['Spirit Jump'] = set_combine(sets.Melee.Jump, {
		feet="Peltast's Schynbalds +1",
	})
	
	sets.precast['Spirit Link'] = {
			head="Vishap Armet +1",
			hands="Peltast's Vambraces +1",
			ear1="Pratik Earring"
	}
	
	sets.precast['Angon'] = {
		ammo="Angon",
		hands="Ptero. Fin. G. +3"
	}
	
	sets.precast['Ancient Circle'] = {
		legs="Vishap Brais +3"
	}

	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')
end

function precast(spell)	
	if sets.precast[spell.english] then
                equip(sets.precast[spell.english])
	elseif spell.type == 'WeaponSkill' then
		if spell.name == "Impulse Drive" then
			if ATT_Cap_Flag then
			    equip(sets.PWS.ImpulseCap)
			else 
				equip(sets.PWS.Impulse)
			end
		elseif spell.name == "Savage Blade" then
			if ATT_Cap_Flag then
				if ATT_Cap_High then
					equip(sets.PWS.SavageCapHigh)
				else 
					equip(sets.PWS.SavageCap)
				end
			else 
				equip(sets.PWS.Savage)
			end
		else 
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
	elseif command == 'attcap' then
		add_to_chat(207,'Attack Cap Set: '..tostring(not ATT_Cap_Flag)..'')

		ATT_Cap_Flag = not ATT_Cap_Flag
	elseif command == 'attcaphigh' then
		add_to_chat(207,'Attack Cap High Set: '..tostring(not ATT_Cap_High)..'')

		ATT_Cap_High = not ATT_Cap_High
	elseif command == 'angon' then
		equip(sets.precast.Angon)
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