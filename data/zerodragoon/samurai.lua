include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	Ranged_Flag = false
	Style_Lock_Id = 18

	--Default Macro Set for DRG
	send_command('input /macro book 6;wait .1;input /macro set 1;wait 0.5;input //gs org')
	
	set_style_lock()

	sets.Meditate = {
		head="Wakido Kabuto +3",
		hands="Sakonji Kote +3",
		back="Smertrios's Mantle"
	}

	-- Hands Sets
	Hands_Set_Names = {'Masa', 'Shining', 'Doji'}

	sets.Hands = {}	
	
	sets.Hands.Masa = { 
		main="Masamune",
		sub="Utu Grip"
	}

	sets.Hands.Doji = { 
		main="Dojikiri Yasutsuna",
		sub="Utu Grip"
	}

	sets.Hands.Shining = { 
		main="Shining One",
		sub="Utu Grip"
	}
	
	sets.Hands.Kustawi = { 
		main="Kustawi +1"
	}

	--sets.Hands.Soboro = { 
		--main="Soboro Sukehiro",
		--sub="Utu Grip"
	--}
	
	--sets.Hands.Hachimonji = { 
	--	main="Hachimonji",
	--	sub="Utu Grip"
	--}
	
	Weapon_Set_Names = {'Relic', 'Ullr'}

	sets.Weapon = {}	

	sets.Weapon.Relic = {
		ranged="Yoichinoyumi"
	}
	
	sets.Weapon.Ullr = {
		ranged="Ullr"
	}

	Ammo_Set_Names = {
		arrow = {'Yoichi'}
	}

	sets.Ammo = {}

	sets.Ammo.arrow = {
		ammo="Yoichi's Arrow"
	}
	
	sets.precast = {}
	sets.midcast = {}
						
	-- Physical WS Sets Below

	PWS_Set_Names = {'Normal', 'AccMid', 'AccMax'}
	sets.PWS = {
		head="Mpaca's Cap",							
		body="Nyame Mail", 
		hands="Nyame Gauntlets", --Kasuga Kote +3
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Samurai's Nodowa +2",
		waist="Sailfi Belt +1",
		ring1="Epaminondas's Ring",
		ring2="Niqmaddu Ring",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
		ear1="Moonshade Earring", 
		--ear2="Thrud Earring",
		ear2="Kasuga Earring +1",
		ammo="Knobkierrie"}

	sets.PWS.Normal = set_combine(sets.PWS, {})

	sets.PWS.AccMid = set_combine(sets.PWS, {
		head="Sakonji kabuto +3",
		hands="Wakido kote +3",
		feet="Sakonji sune-ate +3"
	})

	sets.PWS.AccMax = set_combine(sets.PWS.AccMid, {
		ring1="Regal Ring",
		ear2="Telos Earring"
	})
	
	sets.RangedWS = set_combine(sets.PWS, {
		ammo="Yoichi's Arrow",
		head="Sakonji Kabuto +3",
		neck="Samurai's Nodowa +2",
		waist="Yemaya Belt",
		ring2="Regal Ring",
		ear2="Ishvara Earring"
	})
	
	sets.precast['Namas Arrow'] = sets.RangedWS
	sets.precast['Apex Arrow'] = sets.RangedWS
	sets.precast['Empyreal Arrow'] = sets.RangedWS
	sets.precast['Tachi: Ageha'] = {
		head="Kasuga Kabuto +2",
		body="Kasuga Domaru +3",
		hands="Kasuga Kote +2",
		legs="Kasuga Haidate +2",
		feet="Kasuga Sune-Ate +2",
		waist="Eschan Stone",
		neck="Samurai's Nodowa +2",
		ear1="Dignitary's Earring",
		ear2="Crep. Earring",
		ring1="Stikini Ring +1",
		ring2="Metamor. Ring +1",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	
	sets.precast['Sengikori'] = {
		feet="Kasuga Sune-Ate +2"
	}
	
	sets.MWS = set_combine(sets.PWS, {
		head="Nyame Helm", 
		body="Nyame Mail", 
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		ear2="Friomisi Earring",
		waist="Orpheus's Sash"
	})
	
	sets.precast['Tachi: Jinpu'] = sets.MWS
	sets.precast['Tachi: Kagero'] = sets.MWS
	sets.precast['Tachi: Goten'] = sets.MWS
	sets.precast['Tachi: Koki'] = sets.MWS

	--Idle Sets Below
	Idle_Set_Names = {'Normal'}
	sets.Idle = {
		head="Kasuga Kabuto +2",
		body="Kasuga Domaru +3",
		hands="Sakonji Kote +3",
		legs="Kasuga Haidate +2",
		feet="Danzo Sune-ate",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		ring1="Defending Ring",
		ring2="Warden's Ring",
		back="Moonlight Cape",
		ear1="Telos Earring",
		ear2="Kasuga Earring +1",
		ammo="Staunch Tathlum +1"}

	sets.Idle.Normal = set_combine(sets.Idle, {})


	Melee_Set_Names = {'DblAtt', 'DT', 'AccMax', 'Tate', 'Zanshin'}

	sets.Melee = {  
		head="Flamma Zucchetto +2",							
		body="Tatenashi Haramaki +1",
		hands="Wakido Kote +3",
		legs="Tatena. Haidate +1",
		feet="Tatenashi Sune-ate +1",
		neck="Samurai's Nodowa +2",
		waist="Sailfi Belt +1",
		ring1="Chirich Ring +1",
		ring2="Niqmaddu Ring",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
		ear1="Telos Earring",
		ear2="Kasuga Earring +1",
		ammo="Aurgelmir Orb +1"
	}

	sets.Melee.DblAtt = set_combine(sets.Melee, {})

	sets.Melee.AccMax = set_combine(sets.Melee.AccMid, {
		head="Kendatsuba jinpachi +1",
		hands="Tatenashi Gote +1",
		waist="Kentarch Belt +1"
	})
	
	sets.Melee.DT = set_combine(sets.Melee, {
		head="Kasuga Kabuto +2",
		body="Kasuga Domaru +3",
		hands="Mpaca's Gloves",
		legs="Kasuga Haidate +2"
	})
	
	sets.Melee.Tate = set_combine(sets.Melee, {
		body="Tatenashi Haramaki +1",
		hands="Tatena. Gote +1",
		legs="Tatena. Haidate +1",
		feet="Tatena. Sune. +1"
	})
	
	sets.Melee.Zanshin = set_combine(sets.Melee.Tate, {
		body="Kasuga Domaru +3",
		neck="Moonlight Nodowa",
		back="Takaha Mantle"
	})
	
	sets.Melee.TH = set_combine(sets.Melee.DblAtt, {
		body="Volte Jupon",
		ammo="Perfect Lucky Egg",
		waist="Chaac Belt"})
		
	--[[sets.Melee.SB = set_combine(sets.Melee.DT, {
		head="Kendatsuba Jinpachi +1", --SB 8
		body="Dagon Breastplate", --SB II 10
		hands="Kendatsuba Tekko +1", --SB 8,
		legs="Mpaca's Hose", --SB II 5 PDT 9
		feet="Ken. Sune-Ate +1", --SB 8
		neck="Defiant Collar", --SB 3
		waist="Sarissaphori Belt", --SB 5
		ring1="Chirich Ring +1", --SB 10
		ring2="Niqmaddu Ring", --SB II 5
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}, --PDT 10
		ear1="Digni. Earring", --SB 5
		ear2="Schere Earring", --SB 3
		ammo="Aurgelmir Orb +1"
	})--SB 50 --SB II 20 --PDT 19]]--

	sets.precast.Ranged = {
		head="Sakonji Kabuto +3",
		body={ name="Acro Surcoat", augments={'"Rapid Shot"+5','"Snapshot"+5',}},
		hands={ name="Acro Gauntlets", augments={'"Rapid Shot"+5','"Snapshot"+5',}},
		legs={ name="Acro Breeches", augments={'"Rapid Shot"+5','"Snapshot"+5',}},
		feet={ name="Acro Leggings", augments={'"Rapid Shot"+5','"Snapshot"+5',}},
		waist="Yemaya Belt",
		ring1="Crepuscular Ring",
		ammo="Yoichi's Arrow"
	}
	
	sets.midcast.Ranged = set_combine(sets.Melee.DblAtt, {
		ranged="Ullr",
		ammo="Yoichi's Arrow",
		head="Sakonji Kabuto +3",
		body="Kendatsuba Samue +1",
		hands="Kendatsuba Tekko +1",
		legs="Nyame Flanchard",
		feet="Kendatsuba Sune-Ate +1",
		waist="Yemaya Belt",
		ring1="Crepuscular Ring",
		ring2="Longshot Ring",
		ear2="Enervating Earring"
	})

	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')
end

function precast(spell)
	if sets.precast[spell.english] then
        equip(sets.precast[spell.english])
		
		if buffactive['Sengikori'] then
			equip(sets.precast['Sengikori'])
		end
	elseif spell.english == 'Meditate' then
		equip(sets.Meditate)
	elseif spell.type == 'WeaponSkill' then
		if Ranged_Flag == true then 
			equip(set_combine(sets.PWS[PWS_Set_Names[PWS_Index]], set_combine(sets.Weapon.Ullr, sets.Ammo.arrow)))
		else 
			equip(sets.PWS[PWS_Set_Names[PWS_Index]])
		end
	elseif spell.name == "Ranged" then
		equip(sets.Ammo.arrow)
	elseif spell.type == "Trust" then
		equip(sets.Melee)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')        
    end
end

function midcast(spell)
	if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
	end
end

function aftercast(spell)
	if player.status=='Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	else		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]])		
	end
	
	if Ranged_Flag == true then 
		equip(sets.Weapon.Ullr)
		equip(sets.Ammo.arrow)
	end
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif new == 'Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]]) 
	end
	
	if Ranged_Flag == true then 
		equip(sets.Weapon.Ullr)
		equip(sets.Ammo.arrow)
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
		equip(sets.PWS[PWS_Set_Names[PWS_Index]])
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
	elseif command == 'ranged' then
		Ranged_Flag = not Ranged_Flag
		 
		if Ranged_Flag == true then
			equip(sets.Weapon.Ullr)
			equip(sets.Ammo.arrow)

			send_command('input //dp Bow')
		elseif Ranged_Flag == false then
			if player.status=='Engaged' then
				equip(sets.Melee[Melee_Set_Names[Melee_Index]])
			else		
				equip(sets.Idle[Idle_Set_Names[Idle_Index]])		
			end
		end
	elseif command == 'startup' then
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	end
end

function file_unload()
	
end