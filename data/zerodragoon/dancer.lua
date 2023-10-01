include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	ATT_Cap_Flag = false

	--Default Macro Set for RNG
	send_command('input /macro book 3;wait .1;input /macro set 1;wait 0.5;input //gs org')
	
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
		neck="Magoraga Beads", --10,
		body="Passion Jacket" --10
	})

	sets.precast.Waltz = {
		head="Anwig Salade",
		body="Maxixi Casaque +3", --17
		hands="Nyame Gauntlets",
		legs="Dashing Subligar", --10
		feet="Maxixi Toe Shoes +3", --14
		ring1="Moonlight Ring",
		ring2="Defending Ring",
		ear1="Sjofn Earring", --10
		ear2="Handler's Earring +1",
		back="Moonlight Cape",
		waist="Platinum Moogle Belt",
		ammo="Staunch Tathlum +1"
	} --67
		
	sets.precast.Jig = {
		legs="Horos Tights +3",
		feet="Maxixi Toe Shoes +3"
	}
	
	sets.precast.Step = {
		head="Maxixi Tiara +3",
		body="Maxixi Casaque +3",
		hands="Maxixi Bangles +3",
		legs="Horos Tights +3",
		feet="Horos Toe Shoes +3",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
		ammo="Yamarang",
		neck="Lissome Necklace",
		waist="Olseni Belt",
		ring1="Regal Ring",
		ring2="Chirich Ring +1",
		ear1="Mache Earring +1",
		ear2="Telos Earring"
	}

	sets.precast.Samba = {
		head="Maxixi Tiara +3",
		back="Senuna's Mantle"
	}

	sets.precast['Curing Waltz'] = sets.precast.Waltz
	sets.precast['Curing Waltz II'] = sets.precast.Waltz
	sets.precast['Curing Waltz III'] = sets.precast.Waltz	
	sets.precast['Curing Waltz IV'] = sets.precast.Waltz
	sets.precast['Curing Waltz V'] = sets.precast.Waltz
	sets.precast['Divine Waltz'] = sets.precast.Waltz
	sets.precast['Divine Waltz II'] = sets.precast.Waltz
	sets.precast['Healing Waltz'] = sets.precast.Waltz
	sets.precast['Chocobo Jig II'] = sets.precast.Jig
	sets.precast['Spectral Jig'] = sets.precast.Jig
	sets.precast['Quickstep'] = sets.precast.Step
	sets.precast['Box Step'] = sets.precast.Step
	sets.precast['Stutter Step'] = sets.precast.Step
	sets.precast['Feather Step'] = set_combine(sets.precast.Step, {
		feet="Maculele Toe Shoes +2"
	})
	sets.precast['Haste Samba'] = sets.precast.Samba
	sets.precast['Drain Samba'] = sets.precast.Samba
	sets.precast['Drain Samba II'] = sets.precast.Samba
	sets.precast['Drain Samba III'] = sets.precast.Samba
	sets.precast['Aspir Samba'] = sets.precast.Samba
	sets.precast['Aspir Samba II'] = sets.precast.Samba
	sets.precast['No Foot Rise'] = {body="Horos Casaque +3"}
	sets.precast['Climactic Flourish'] = {head = "Maculele Tiara +3"}
	sets.precast['Striking Flourish'] = {body = "Maculele Casaque +2"}
	sets.precast['Reverse Flourish'] = {
		hands = "Maculele Bangles +2",
		back="Toetapper Mantle"
	}
	sets.precast['Violent Flourish'] = {
		head="Nyame Helm",							
		body="Horos Casaque +3",
		hands="Nyame Gauntlets",
		legs="Horos Tights +3",
		feet="Nyame Sollerets",
		neck="Nefarious Collar +1",
		waist="Eschan Stone",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		ammo="Yamarang",
		back="Sacro Mantle",
		ear1="Dignitary's Earring",
		ear2="Crepuscular Earring"}
		
	sets.precast.ranged = {
		head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}}, --10		
		feet="Meghanada Jambeaux +2",--10		
		ring1="Crepuscular Ring", --3
		waist="Yemaya Belt"
	}

	Hands_Set_Names = {'Twashtar', 'TwashtarTP', 'Tauret', 'Aeneas', 'AeneasTP', 'TwashtarFencer', 'TwashtarA'}

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
		sub="Gleti's Knife"
	}
	
	sets.Hands.TwashtarTP = { 
		main="Twashtar",
		sub="Fusetto +2"
	}
	
	sets.Hands.TwashtarFencer = { 
		main="Twashtar",
		sub="Airy Buckler"
	}
	
	sets.Hands.TwashtarA = { 
		main="Twashtar",
		sub="Aeneas"
	}
	
	sets.Hands.Tauret = { 
		main="Tauret",
		sub="Gleti's Knife",
	}
						
	-- Physical WS Sets Below

	PWS_Set_Names = {'Normal'}
	sets.PWS = {
		head="Maculele Tiara +3",		 			
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Etoile Gorget +2",
		waist="Fotia Belt",
		ring1="Ephramad's Ring",
		ring2="Epaminondas's Ring",
		ammo="Aurgelmir Orb +1",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		ear1="Moonshade Earring",
		ear2="Ishvara Earring"}

	sets.PWS.Normal = set_combine(sets.PWS, {})
	
	sets.Rudras = set_combine(sets.PWS, {
		waist="Kentarch Belt +1"
	})
	
	sets.RudrasCap = set_combine(sets.Rudras, {
		body="Gleti's Cuirass",
		ear2="Maculele Earring +1",
		ammo="Crepuscular Pebble"
	})
	
	sets.Pyrrhic = set_combine(sets.PWS, {
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		ammo="Coiste Bodhar",
		ring1="Regal Ring",
		ring2="Gere Ring",
		ear1="Sherida Earring",
		ear2="Mache Earring +1"
	})
	
	sets.PyrrhicCap = set_combine(sets.Rudras, {
		head="Gleti's Mask",
		ear2="Maculele Earring +1",
		ammo="Crepuscular Pebble"
	})

	-- Magical WS Sets Below
	MWS_Set_Names = {'Normal'}

	sets.MWS  = {
		head="Nyame Helm",								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		ring1="Metamorph Ring +1",
		ring2="Epaminondas's Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
		ear1="Friomisi Earring",
		ear2="Ishvara Earring"}
						
	sets.MWS.Normal = set_combine(sets.MWS, {})
	
	sets.precast['Aeolian Edge'] = set_combine(sets.MWS, {

	})

	sets.Evis = {
		head="Adhemar Bonnet +1",
		body="Gleti's Cuirass",
		hands="Mummu Wrists +2",
		legs="Gleti's Breeches",
		feet="Mummu Gamashes +2",
		waist="Fotia Belt",
		neck="Fotia Gorget",
		ear1="Odr Earring",
		ear2="Sherida Earring",
		ammo="Aurgelmir Orb +1",
		ring1="Regal Ring",
		ring2="Mummu Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10','Phys. dmg. taken-10%',}},
	}
	
	--Idle Sets Below
	Idle_Set_Names = {'Normal', 'Pull'}
	sets.Idle = {
		head="Malignance Chapeau",							
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Tandava Crackows",
		neck="Loricate Torque +1",
		waist="Platinum Moogle Belt",
		ring1="Warden's Ring",
		ring2="Defending Ring",
		back="Moonlight Cape",
		ear1="Infused Earring",
		ear2="Telos Earring",
		ammo="Staunch Tathlum +1"}

	sets.Idle.Normal = set_combine(sets.Idle, {})
	sets.Idle.Pull = set_combine(sets.Idle, {
		ranged="Halakaala"
	})

	Melee_Set_Names = {'DT', 'DblAtt', 'Crit', 'DTFull'}

	sets.Melee = {  
		head="Adhemar Bonnet +1",							
		body="Horos Casaque +3",
		hands="Adhemar Wristbands +1",
		legs="Samnuha Tights",
		feet="Horos Toe Shoes +3",
		neck="Etoile Gorget +2",
		waist="Sailfi Belt +1",
		ring1="Gere Ring",
		ring2="Epona's Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
		ear1="Sherida Earring",
		ear2="Telos Earring",
		ammo="Aurgelmir Orb +1"
	}

	sets.Melee.DT = set_combine(sets.Melee, {
		head="Malignance Chapeau",
		body="Malignance Tabard",	
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Maculele Toe Shoes +2"})
		
	sets.Melee.DTFull = set_combine(sets.Melee.DT, {
		ring1="Moonlight Ring",
		ring2="Moonlight Ring"})

	sets.Melee.Crit = set_combine(sets.Melee, {
		head="Mummu Bonnet +2",
		body="Abnoba Kaftan",	
		hands="Mummu Wrists +2",
		legs="Mummu Kecks +2",
		feet="Mummu Gamashes +2",
		ring1="Mummu Ring",
		ear2="Odr Earring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10','Phys. dmg. taken-10%',}}})

	sets.Melee.DblAtt = set_combine(sets.Melee, {})

	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')
end

function precast(spell)	
	if sets.precast[spell.english] then
		if checkWSDistance(spell) then
			equip(sets.precast[spell.english])
			
			if spell.english == 'Feather Step' then
				send_command('timers create "Feather Step" 120 down')
			end
			
			if spell.english == 'Box Step' then
				send_command('timers create "Box Step" 120 down')
			end
			
			if spell.english == 'Spectral Jig' and buffactive.Sneak then
				cast_delay(0.2)
				send_command('cancel Sneak')        
			end
		end		
	elseif spell.type == 'WeaponSkill' then
		if checkWSDistance(spell) then
			if spell.name == "Aeolian Edge" then
				equip(sets.MWS[MWS_Set_Names[MWS_Index]])
			elseif spell.name == "Rudra's Storm" then
				if ATT_Cap_Flag then
					equip(sets.RudrasCap)
				else 
					equip(sets.Rudras)
				end
				
				if buffactive['Climactic Flourish'] then
					equip(sets.precast['Climactic Flourish'])
				end
			elseif spell.name == "Pyrrhic Kleos" then
				if ATT_Cap_Flag then
					equip(sets.PyrrhicCap)
				else 
					equip(sets.Pyrrhic)
				end

				if buffactive['Striking Flourish'] then
					equip(sets.precast['Striking Flourish'])
				end
			elseif spell.name == "Evisceration" or spell.name == 'Dancing Edge' then
				equip(sets.Evis)
			else
				equip(sets.PWS[PWS_Set_Names[PWS_Index]])
			end
		end
	elseif spell.type == "Ninjutsu" then
		if string.find(spell.english,'Utsusemi') then
			equip(sets.precast.Utsusemi)
		else
			equip(sets.precast.FastCast)
		end
	elseif spell.name == "Ranged" then
		equip(sets.precast.ranged)
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
	elseif command == 'attcap' then
		add_to_chat(207,'Attack Cap Set: '..tostring(not ATT_Cap_Flag)..'')

		ATT_Cap_Flag = not ATT_Cap_Flag
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