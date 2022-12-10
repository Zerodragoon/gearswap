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
		main="Instigator",
		sub="Utu Grip",
		body="Pummeler's Lorica +2",
		feet="Agoge Calligae +1",
		back="Cichol's Mantle" 
	} 
	
	sets.precast['Warcry'] = {
		head="Agoge Mask +3"
	}
	
	sets.precast['Aggressor'] = {
		head="Pummeler's Mask +2",
		hands="Agoge Lorica +1"
	}
	
	sets.precast['Retaliation'] = {
		hands="Pummeler's Mufflers +1",
		feet="Boii Calligae +2"
	}
	
	sets.precast['Restraint'] = {
		hands="Boii Mufflers +2"
	}
	
	sets.precast['Blood Rage'] = {
		body="Boii Lorica +2"
	}
	
	sets.precast['Mighty Strikes'] = {
		hands="Agoge Mufflers"
	}
	
	sets.precast['Tomahawk'] = {
		ammo="Throwing Tomahawk",
		feet="Agoge Calligae +1",
	}

	Hands_Set_Names = {'Sword', 'GAxe', 'Spear', 'GSword', 'Mace', 'Knife', 'Staff'}

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
		neck="Baetyl Pendant",
		waist="Orpheus's Sash",
		left_ear="Hecate's Earring",
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
		hands="Nyame Gauntlets", --Boii Mufflers +3
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
	
	sets.PWS.Savage = set_combine(sets.PWS, {
		ring1="Sroda Ring"
	})
	
	sets.PWS.SavageCap = set_combine(sets.PWS.Savage, {
		legs="Boii Cuisses +2"
	})
	
	sets.PWS.SavageCapHigh = set_combine(sets.PWS.SavageCap, {
		hands="Sakpata's Gauntlets",
		feet="Sakpata's Leggings"
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

	Melee_Set_Names = {'Sakpata', 'Boii', 'SB', 'TripleAtt', 'TH'}

	sets.Melee = {  
		
	}

	sets.Melee.TripleAtt = set_combine(sets.Melee, {head="Flamma Zucchetto +2",			
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
		ear1="Brutal Earring",
		ear2="Schere Earring", --Boii Earring +2
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
		ear1="Dignitary's Earring",
		ear2="Boii Earring",
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
	})
	
	sets.Melee.Boii = set_combine(sets.Melee.Sakpata, { --33
		head="Boii Mask +2", --6
   		body="Boii Lorica +2", 
		hands="Sakpata's Gauntlets", --6
		legs="Sakpata's Cuisses", --7
		feet="Flamma Gambieras +2", --6
		neck="Warrior's Bead Necklace +2", --7 
		waist="Ioskeha Belt +1", --9
		ring1="Niqmaddu Ring",
		ring2="Chirich Ring +1",
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}, --10
		ear1="Schere Earring", --6
		ear2="Boii Earring", --7
		ammo="Coiste Bodhar" --3
	})

	sets.Melee.TH = set_combine(sets.Melee.Sakpata, {
		body="Odyssean Chestplate",
		ammo="Perfect Lucky Egg",
		waist="Chaac Belt",
		ear1="Schere Earring",
		ear2="Boii Earring"})
		
	sets.Melee.Pull = set_combine(sets.Melee.TH, {
		ranged="Halakaala",
		ammo=""})

	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')
end

function precast(spell)	
	if spell.type == 'WeaponSkill' and spell.target.distance > 4.0  then						
		--add_to_chat(167,''..spell.target.name..' is too far can not use '..spell.name..'!!!. Cancelling WeaponSkill ')                           
		--cancel_spell()
		--return	
	end 
	
	if sets.precast[spell.english] then
        equip(sets.precast[spell.english])
	elseif spell.type == 'WeaponSkill' then
		if (spell.name == "Fell Cleave" or spell.name == "Shockwave") and FellCleaveTH_Flag then
            equip(sets.FellCleaveTH)
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
		elseif spell.name == "Judgment" then
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
	elseif command == 'pdt' then
		if sets.pdt == pdt.on then
			equip(pdt.off)
			equip(sets.Hands[Hands_Set_Names[Hands_Index]])
			sets.pdt = pdt.off
			enable('head','neck','ear1','ear2','body','hands','ring1','ring2','back','waist','legs','feet')
			status_change(player.status)
			add_to_chat(207,'>>>>> PDT Set Unlocked! <<<<<')
		else				
			equip(pdt.on)
			sets.pdt = pdt.on
			disable('head','neck','ear1','ear2','body','hands','ring1','ring2','back','waist','legs','feet')
			add_to_chat(66,'>>>>> PDT Set Locked! <<<<<')
		end
	elseif command == 'pws' then
		PWS_Index = PWS_Index +1
		if PWS_Index > #PWS_Set_Names then PWS_Index = 1 end
		add_to_chat(207,'Physical WS Set Changed to: '..PWS_Set_Names[PWS_Index]..'')
	elseif command == 'attcap' then
		add_to_chat(207,'Attack Cap Set: '..tostring(not ATT_Cap_Flag)..'')

		ATT_Cap_Flag = not ATT_Cap_Flag
	elseif command == 'attcaphigh' then
		add_to_chat(207,'Attack Cap High Set: '..tostring(not ATT_Cap_High)..'')

		ATT_Cap_High = not ATT_Cap_High
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