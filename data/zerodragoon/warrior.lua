include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	GK_Flag = false
	Katana_Flag = false
	FellCleaveTH_Flag = false
	ATT_Cap_High = false
	ATT_Cap_Flag = false
	
	--Default Macro Set for WAR
	send_command('input /macro book 5;wait .1;input /macro set 1;wait 0.5;input //gs org')
	
	set_style_lock()
	
	organizer_items = {
		tomahawk="Throwing Tomahawk"
	}
	
	--Precast
	sets.precast = {}
		
	-- Magic Sets Below		
	sets.precast.FastCast = {
		body="Sacro Breastplate",
		hands="Leyline Gloves",
		feet="Odyssean Greaves",
		ear1="Loquacious Earring",
		ear2="Enchanter's Earring +1",
		ring1="Prolix Ring",
		ring2="Weatherspoon Ring +1",
		neck="Baetyl Pendant",
		ammo="Sapience Orb" --2
	}
	
	sets.precast['Curing Waltz III'] = {
		head="Mummu Bonnet +2",
		body="Passion Jacket",
		ring1="Asklepian Ring",
		waist="Gishdubar Sash",
	}
		
	sets.precast['Berserk'] = {
		body="Pummeler's Lorica +3",
		feet="Agoge Calligae +3",
		back="Cichol's Mantle" 
	} 
	
	sets.precast['Warcry'] = {
		head="Agoge Mask +3"
	}
	
	sets.precast['Aggressor'] = {
		head="Pummeler's Mask +3",
		hands="Agoge Lorica +3"
	}
	
	sets.precast['Retaliation'] = {
		hands="Pummeler's Mufflers +3",
		feet="Boii Calligae +3"
	}
	
	sets.precast['Defender'] = {
		hands="Agoge Mufflers +3"
	}
	
	sets.precast['Restraint'] = {
		hands="Boii Mufflers +3"
	}
	
	sets.precast['Blood Rage'] = {
		body="Boii Lorica +3"
	}
	
	sets.precast['Mighty Strikes'] = {
		hands="Agoge Mufflers +3"
	}
	
	sets.precast['Tomahawk'] = {
		ammo="Throwing Tomahawk",
		feet="Agoge Calligae +3",
	}

	Hands_Set_Names = {'Sword', 'GAxe', 'Spear', 'GSword', 'Mace', 'Knife', 'Staff', 'Ukon'}

	sets.Hands = {}	

	sets.Hands.Sword = { 
		main="Naegling",
		sub="Blurred Shield +1"
	}
	
	sets.Hands.GAxe = { 
		main="Chango",
		sub="Utu Grip"
	}
	
	sets.Hands.Spear = { 
		main="Shining One",
		sub="Utu Grip"
	}
	
	sets.Hands.GSword = { 
		main="Montante +1",
		sub="Utu Grip"
	}
	
	sets.Hands.Mace = { 
		main="Loxotic Mace +1",
		sub="Blurred Shield +1"
	}
	
	sets.Hands.Knife = { 
		main="Malevolence",
		sub="Blurred Knife +1"
	}
	
	sets.Hands.Staff = { 
		main="Xoanon",
		sub="Utu Grip"
	}
	
	sets.Hands.Ukon = { 
		main="Ukonvasara",
		sub="Utu Grip"
	}
	   
	sets.GK = {
		neck="Combatant's Torque",
		head="Fazheluo Helm"
	}
	
	sets.Katana = {
		neck="Combatant's Torque"
	}
	
	sets.Org = {
		main="Bronze Dagger"
	}
	
	sets.Org2 = {
		main="Wax Sword",
	}
	
	sets.Org3 = {
		main="Claymore",
	}
	
	sets.Org4 = {
		main="Bronze Zaghnal",
	}
	
	sets.Org5 = {
		main="Harpoon",
	}
	
	sets.Org6 = {
		main="Debahocho +1",
	}
	
	sets.Org7 = {
		main="Mutsunokami",
	}
	
	sets.Org8 = {
		main="Ash Club",
	}
	
	sets.Org9 = {
		main="Ash Staff"
	}
	
	sets.Magic = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		body="Sacro Breastplate",
		hands="Leyline Gloves",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		left_ear="Crematio Earring",
		right_ear="Friomisi Earring",
		left_ring="Warden's Ring",
		right_ring="Weatherspoon Ring +1",
		back="Izdubar Mantle",
	}
		
	-- Physical WS Sets Below
	PWS_Set_Names = {'Normal'}
	sets.PWS = {
		head="Agoge Mask +3",							
		body="Nyame Mail",
		hands="Boii Mufflers +3",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Warrior's Bead Necklace +2",
		waist="Sailfi Belt +1",
		ring1="Regal Ring",
		ring2="Epaminondas's Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		ammo="Knobkierrie"}
		
	sets.MWS = set_combine(sets.Magic, {
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		ear1="Moonshade Earring",
		ring1="Epaminondas's Ring"
	})
		
	sets.precast['Tachi: Koki'] = set_combine(sets.PWS, sets.GK)
	
	sets.precast['Tachi: Jinpu'] = set_combine(sets.PWS, sets.GK)
	
	sets.precast['Blade: Ei'] = set_combine(sets.PWS, sets.Katana)
	
	sets.precast['Herculean Slash'] = sets.MWS
	sets.precast['Burning Blade'] = sets.MWS
	sets.precast['Red Lotus Blade'] = sets.MWS
	sets.precast['Seraph Blade'] = sets.MWS
	sets.precast['Earth Crusher'] = sets.MWS
	sets.precast['Cataclysm'] = sets.MWS
	sets.precast['Aeolian Edge'] = sets.MWS
			
	sets.PWS.Impulse = set_combine(sets.PWS, {
		feet="Boii Calligae +3"
	})

	sets.PWS.ImpulseCap = set_combine(sets.PWS.Impulse, {
		legs="Boii Cuisses +3",
		ring1="Sroda Ring"
	})
	
	sets.PWS.Ukkos = set_combine(sets.PWS, {
		legs="Boii Cuisses +3",
		feet="Boii Calligae +3",
		ring1="Niqmaddu Ring",
		ring2="Sroda Ring",
		ear1="Schere Earring",
		ear2="Boii Earring +1",
		ammo="Yetshila +1",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}
	})
	
	sets.PWS.UkkosCap = set_combine(sets.PWS.Ukkos, {
		body="Sakpata's Breastplate",
	})
	
	sets.PWS.Upheaval = set_combine(sets.PWS, {
		legs="Boii Cuisses +3",
		ring1="Niqmaddu Ring",
		back={ name="Cichol's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	})
	
	sets.PWS.UpheavalCap = set_combine(sets.PWS.Upheaval, {
		body="Sakpata's Breastplate",
		ring2="Sroda Ring"
	})
	
	sets.PWS.Savage = set_combine(sets.PWS, {
		ring1="Sroda Ring"
	})
	
	sets.PWS.SavageCap = set_combine(sets.PWS.Savage, {
		legs="Boii Cuisses +3"
	})
	
	sets.PWS.SavageCapHigh = set_combine(sets.PWS.SavageCap, {
		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",
	})
	
	sets.PWS.Normal = set_combine(sets.PWS, {})
	
	sets.FellCleaveTH = set_combine(sets.PWS, {
		body="Odyssean Chestplate",
		ammo="Perfect Lucky Egg",
		waist="Chaac Belt"})
	
	--Idle Sets Below
	Idle_Set_Names = {'Normal', 'Regen', 'Pull'}
	sets.Idle = {
		head="Sakpata's Helm",
   		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Hermes' Sandals",
		neck="Loricate Torque +1",
		waist="Gishdubar Sash",
		ring1="Warden's Ring",
		ring2="Defending Ring",
		back="Moonlight Cape",
		ear1="Infused Earring",
		ear2="Telos Earring",
		ammo="Staunch Tathlum +1"}

	sets.Idle.Normal = set_combine(sets.Idle, {})
	
	sets.Idle.Regen = set_combine(sets.Idle.Normal,{	
		neck="Lissome Necklace",
		body="Sacro Breastplate",
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1",
		ear2="Infused Earring"
	})
	
	sets.Idle.Pull = set_combine(sets.Idle.Normal, {
		ranged="Halakaala",
		ammo=""
	})

	Melee_Set_Names = {'Boii', 'Sakpata', 'SB', 'TripleAtt', 'TH', 'DoubleAttackDamage', 'Experimental'}

	sets.Melee = {  
		
	}

	sets.Melee.TripleAtt = set_combine(sets.Melee, {		
		head="Flamma Zucchetto +2",
		body="Tatenashi Haramaki +1",
		hands="Tatena. Gote +1",
		legs="Tatena. Haidate +1",
		feet="Tatena. Sune. +1",
		neck="Warrior's Bead Necklace +2",
		waist="Sailfi Belt +1",
		ring1="Niqmaddu Ring",
		ring2="Chirich Ring +1",
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		ear1="Brutal Earring", --Boii Earring +2
		ear2="Schere Earring", 
		ammo="Coiste Bodhar"})
		
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
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, --10
		ear1="Schere Earring",
		ear2="Boii Earring +1",
		ammo="Coiste Bodhar"
	})
	
	sets.Melee.Sakpata = set_combine(sets.Melee, { --33
		head="Sakpata's Helm", --5
   		body="Sakpata's Breastplate", --8
		hands="Sakpata's Gauntlets", --6
		legs="Sakpata's Cuisses", --7
		feet="Sakpata's Leggings", --4
		neck="Warrior's Bead Necklace +2", --7 
		waist="Sailfi Belt +1", --5
		ring1="Niqmaddu Ring",
		ring2="Petrov Ring", --1
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, --10
		ear1="Brutal Earring", --5
		ear2="Schere Earring", --6 
		ammo="Coiste Bodhar" --3
	}) --100
	
	sets.Melee.Boii = set_combine(sets.Melee.Sakpata, { --33
		head="Boii Mask +3", --7
   		body="Boii Lorica +3", 
		hands="Sakpata's Gauntlets", --6
		legs="Sakpata's Cuisses", --7
		feet="Flamma Gambieras +2", --6
		neck="Warrior's Bead Necklace +2", --7 
		waist="Ioskeha Belt +1", --9
		ring1="Niqmaddu Ring",
		ring2="Chirich Ring +1",
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, --10
		ear1="Schere Earring", --6
		ear2="Boii Earring +1", --8
		ammo="Coiste Bodhar" --3
	}) --102
	
	sets.Melee.DoubleAttackDamage = set_combine(sets.Melee.Sakpata, { --33
		head="Sakpata's Helm", --5
   		body="Sakpata's Breastplate", --8
		hands="Sakpata's Gauntlets", --6
		legs="Agoge Cuisses +3", --5
		feet="Boii Calligae +3",
		neck="Warrior's Bead Necklace +2", --7 
		waist="Ioskeha Belt +1", --9
		ring1="Niqmaddu Ring",
		ring2="Moonlight Ring",
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, --10
		ear1="Schere Earring", --6
		ear2="Boii Earring +1", --8
		ammo="Coiste Bodhar" --3
	}) --100
	
	sets.Melee.Experimental = set_combine(sets.Melee.Sakpata, {
		head="Hjarrandi Helm",
		body="Boii Lorica +3",
		hands="Sakpata's Gauntlets",
		legs="Pummeler's Cuisses +2",
		feet="Pummeler's Calligae +3",
		neck="Vim Torque +1",
		ear1="Schere Earring",
		ear2="Dedition Earring",
		ring1="Niqmaddu Ring",
		ring2="Moonlight Ring",
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%',}},
		waist="Sailfi Belt +1",
		ammo="Coiste Bodhar",
	})

	sets.Melee.TH = set_combine(sets.Melee.Sakpata, {
		body="Odyssean Chestplate",
		ammo="Perfect Lucky Egg",
		waist="Chaac Belt",
		ear1="Schere Earring",
		ear2="Boii Earring +1"})
		
	sets.Melee.Pull = set_combine(sets.Melee.TH, {
		ranged="Halakaala",
		ammo=""})

	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')
end

function precast(spell)	
	if sets.precast[spell.english] then
        if checkWSDistance(spell) then
			equip(sets.precast[spell.english])
		end
	elseif spell.type == 'WeaponSkill' then
		if checkWSDistance(spell) then
			if (spell.name == "Fell Cleave" or spell.name == "Shockwave") and FellCleaveTH_Flag then
				equip(sets.FellCleaveTH)
			elseif spell.name == "Upheaval" then
				if ATT_Cap_Flag then
					equip(sets.PWS.UpheavalCap)
				else 
					equip(sets.PWS.Upheaval)
				end
			elseif spell.name == "Impulse Drive" then
				if ATT_Cap_Flag then
					equip(sets.PWS.ImpulseCap)
				else 
					equip(sets.PWS.Impulse)
				end
			elseif spell.name == "Ukko's Fury" then
				if ATT_Cap_Flag then
					equip(sets.PWS.UkkosCap)
				else 
					equip(sets.PWS.Ukkos)
				end
			elseif spell.name == "Savage Blade" or spell.name == "Judgment" or spell.name == "Black Halo" then
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
				equip(sets.PWS)	
			end
		end
	elseif spell.type == "Ninjutsu" then
		equip(sets.precast.FastCast)
	elseif spell.type == "Trust" then
		equip(sets.precast.FastCast)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')        
    end
end

function midcast(spell)
	if spell.type == 'Ninjutsu' then
		equip(sets.Magic)
	end
end

function aftercast(spell)
	if spell.english == 'Berserk' then
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
	end
	
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
	elseif command == 'attcap' then
		if ATT_Cap_Flag and not ATT_Cap_High then
			add_to_chat(207,'Attack Cap High Set: '..tostring(not ATT_Cap_High)..'')

			ATT_Cap_High = not ATT_Cap_High
		else 
			add_to_chat(207,'Attack Cap Set: '..tostring(not ATT_Cap_Flag)..'')

			ATT_Cap_Flag = not ATT_Cap_Flag
			ATT_Cap_High = false
		end
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
		enable('head', 'neck')
		equip(sets.GK)
	elseif command == 'katana' then
		enable('neck')
		equip(sets.Katana)
	elseif command == 'tomahawk' then
		equip(sets.precast.Tomahawk)
	elseif command == 'fcth' then
		FellCleaveTH_Flag = not FellCleaveTH_Flag
	elseif command == 'equipws' then
		equip(sets.PWS[PWS_Set_Names[PWS_Index]])
	elseif command == 'equipidle' then
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif command == 'equipmelee' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	elseif command == 'disable' then
		disable('head', 'body', 'hands', 'legs', 'feet', 'back', 'waist', 'neck', 'ear1', 'ear2', 'ring1', 'ring2', 'ammo')
	elseif command == 'enable' then
		enable('head', 'body', 'hands', 'legs', 'feet', 'back', 'waist', 'neck', 'ear1', 'ear2', 'ring1', 'ring2', 'ammo')
	elseif command == 'startup' then
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	end
end

function file_unload()
	
end