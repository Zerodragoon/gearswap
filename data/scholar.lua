include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	SIRD_Flag = false
	BURST_Flag = false
	Weak_Helix_Flag = false
	Occult_Flag = false
	
	--Default Macro Set for RNG
	send_command('input /macro book 19;wait .1;input /macro set 1;wait 0.5;input //gs org;wait 2.0; input /lockstyleset 13;wait 1;input //lua l nostrum; wait 1;input //nos profile scholar')
	
	--Hands Sets
	Hands_Set_Names = {'Daybreak', 'Bunzi', 'Marin', 'Xoanon'}

	sets.Hands = {}	

	sets.Hands.Daybreak = { 
		main="Daybreak",
    	sub="Genmei Shield"
	}

	sets.Hands.Gada = { 
		main="Gada",
    	sub="Genmei Shield"
	}
	
	sets.Hands.Musa = { 
		main="Musa",
    	sub="Enki Strap"
	}
	
	sets.Hands.Bunzi = { 
		main="Bunzi's Rod",
    	sub="Genmei Shield"
	}
	
	sets.Hands.Chatoyant = {
		main="Chatoyant Staff",
		sub="Enki Strap"
	}
	
	sets.Hands.Marin = {
		main="Marin Staff +1",
		sub="Enki Strap"
	}
	
	sets.Hands.Xoanon = {
		main="Xoanon",
		sub="Khonsu"
	}

	--Precast
	sets.precast = {}
	
	sets.precast.FastCast = { --25
		main="Musa", --10
		sub="Enki Strap",
		ammo="Sapience Orb", --2
		head="Pedagogy mortarboard +3", --13
		body="Shango Robe", --8 --Pinga Tunic +1
		hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+28','"Fast Cast"+7','INT+7',}}, --7
		legs="Pinga Pants", --11  --Ping Pants +1
		feet="Academic's Loafers +3", --12
		waist="Witful Belt", --3 --3
		neck="Baetyl Pendant", --4
		left_ear="Malignance Earring", --4
		right_ear="Loquac. Earring", --2
		left_ring="Kishar Ring", --4
		right_ring="Weatherspoon Ring +1", --6 --4
		back="Fi Follet Cape +1" --10
	} --100 --7
	
	sets.precast.Elemental = set_combine(sets.precast.FastCast, {
		
	})

	sets.precast.Cure = set_combine(sets.precast.FastCast, {
	}) --85

	sets.precast.Cursna = sets.precast.FastCast

	sets.precast.Altruism = {
		head={ name="Peda. M.Board +3", augments={'Enh. "Altruism" and "Focalization"',}}
	}

	sets.precast.Focalization = {
		head={ name="Peda. M.Board +3", augments={'Enh. "Altruism" and "Focalization"',}}
	}

	sets.precast.Sublimation = {
		head="Academic's Mortarboard +3",
		body="Pedagogy Gown +3"
	}

	sets.precast.Enlightenment = {
		body="Pedagogy Gown +3"
	}
	
	sets.precast['Dispelga'] = set_combine(sets.FastCast, {
		main="Daybreak",
		sub="Genmei Shield"
	})
	

	--Midcast Sets
	sets.midcast = {
		
	}

	sets.midcast.SIRD = {
		ammo="Staunch Tathlum +1", --11
		head="Kaykaus Mitra +1", --12
		body="Kaykaus Bliaut +1", --12
		hands="Amalric Gages +1" , --11
		legs="Querkening Brais", --15
		feet="Amalric Nails +1", --16
		waist="Rumination Sash", --10
		left_ring="Freke Ring", --10
		back="Fi Follet Cape +1" --5
	} --102

	sets.midcast.Orepheus = {
		waist="Orpheus's Sash"
	}

	sets.midcast.Gishdubar = {
		waist="Gishdubar Sash"
	}

	sets.midcast.Obi = {
		waist="Hachirin-no-Obi"
	}
	
	sets.midcast.Twilight = {
		back="Twilight Cape"
	}

	sets.midcast.RefreshRec = set_combine(sets.midcast.Gishdubar, {
		waist="Gishdubar Sash",
		feet="Inspirited Boots",
		back="Grapevine Cape"
	})	

	--Black Magic Sets
	sets.midcast.elemental = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head="Pedagogy Mortarboard +3",
		body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		legs="Amalric Slops +1",
		feet="Arbatel Loafers +3", -- Arbatel Loafers +3
		neck="Argute Stole +2",
		waist="Sacro Cord",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Freke Ring",
		right_ring="Metamorph Ring +1",
		back="Lugh's Cape"
	}
	
	sets.midcast.Helix = set_combine(sets.midcast.elemental, {
		head="Agwu's Cap",
		body="Agwu's Robe", --Arbatel Gown +3
		hands="Arbatel Bracers +3",
		legs="Agwu's Slops", --Arbatel Pants +3
		feet="Arbatel Loafers +3",
		ear2="Arbatel Earring +1"
	})
	
	sets.midcast.HelixWeak = {
		main="Malignance Pole",
		sub="Khonsu",
		ammo="Sapience Orb",
		head="Telchine Cap",
		body="Shango Robe",
		hands="Telchine Gloves",
		legs="Psycloth Lappas",
		feet="Telchine Pigaches",
		waist="Witful Belt",
		neck="Incanter's Torque",
		left_ear="Enchanter's Earring +1",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1",
		back="Fi Follet Cape +1"
	}

	sets.midcast.Burst = set_combine(sets.midcast.elemental, {
		head="Pedagogy Mortarboard +3",
		body="Agwu's Robe",
		hands="Amalric Gages +1",
		legs="Agwu's Slops",
		feet="Arbatel Loafers +3",	
		right_ring="Mujin Band"
	})

	sets.midcast.enfeeb = set_combine(sets.midcast.elemental, {
		main="Contemplator +1",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		body="Cohort Cloak +1",
		hands="Pedagogy Bracers +3", 
		legs="Psycloth Lappas", --Arbatel Pants +3
		feet="Medium's Sabots",
		neck="Argute Stole +2",
		waist="Obstinate Sash",
		ear1="Regal Earring",
		ear2="Malignance Earring",
		ring1="Kishar Ring",
		ring2="Stikini Ring +1",
		back="Lugh's Cape"
	})
	
	sets.midcast.Occult = set_combine(sets.midcast.elemental, {
		head="Mall. Chapeau +2",
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Occult Acumen"+10','INT+10','Mag. Acc.+5','"Mag.Atk.Bns."+9',}},
		hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+27','"Occult Acumen"+10','MND+10',}},
		legs="Perdition Slops",
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','"Occult Acumen"+11',}},
		neck="Combatant's Torque",
		waist="Oneiros Rope",
		left_ear="Dedition Earring",
		right_ear="Crep. Earring",
		left_ring="Petrov Ring",
		right_ring="Chirich Ring +1",
		ammo="Seraphic Ampulla"
	})
	
	sets.midcast['Dispelga'] = set_combine(sets.midcast.enfeeb, {
		main="Daybreak",
		sub="Genmei Shield"
	})

	--Cure Sets

	sets.midcast.cure = set_combine(sets.Hands.Chatoyant, {
		ammo="Esper Stone +1",
		head="Kaykaus Mitra +1",
		hands="Pedagogy Bracers +3",
		neck="Incanter's Torque",
		body="Kaykaus Bliaut +1",
		feet="Kaykaus Boots +1",
		legs="Kaykaus Tights +1",
		left_ear="Mendicant's Earring",
		right_ear="Regal Earring",
		waist="Rumination Sash",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Oretania's Cape +1"
	})

	sets.midcast.Cursna = {
		feet="Vanya Clogs",
		back="Oretania's Cape +1",
		neck="Debilis Medallion",
		ring1="Haoma's Ring",
		ring2="Haoma's Ring"
	}

	sets.midcast.Enhancing = set_combine(sets.Hands.Gada, {
		sub="Ammurapi Shield",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		body="Pedagogy Gown +3",
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		back="Fi Follet Cape +1",
		waist="Embla Sash",
		ear1="Mimir Earring",
		ear2="Andoaa Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
	})

	sets.midcast["Regen V"] = set_combine(sets.Hands.Musa, {
		head="Arbatel Bonnet +3",
		neck="Incanter's Torque",
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chasuble",  augments={'"Regen" potency+3',}},
		legs={ name="Telchine Braconi",  augments={'"Regen" potency+3',}},
		feet={ name="Telchine Pigaches",  augments={'"Regen" potency+3',}},
		back="Bookworm's Cape",
		waist="Embla Sash",
		ear1="Mimir Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1", 
	})
	
	sets.midcast["Refresh"] = set_combine(sets.midcast.Enhancing, {
		head="Amalric Coif +1"
	})
	
	sets.midcast["Aquaveil"] = set_combine(sets.midcast.Enhancing, {
		head="Amalric Coif +1",
		hands="Regal Cuffs",
		legs="Shedir Seraweels",
		waist="Emphatikos Rope"
	})
	
	sets.midcast["Stoneskin"] = set_combine(sets.midcast.Enhancing, {
		legs="Shedir Seraweels",
		ear1="Earthcry Earring",
		neck="Nodens Gorget",
		waist="Siegel Sash"
	})

	sets.midcast["Protect V"] = set_combine(sets.midcast.Enhancing, {
		ring1="Sheltered Ring"
	})
	sets.midcast["Shell V"] =set_combine(sets.midcast.Enhancing, {
		ring1="Sheltered Ring"
	})
	
	sets.midcast.Perpetuance = {
		hands="Arbatel Bracers +3"
	}

	sets.midcast.Immanence = {
		hands="Arbatel Bracers +3"
	}

	sets.midcast.Ebullience = {
		head="Arbatel Bonnet +3"
	}
	
	sets.midcast.Klimaform = {
		feet="Arbatel Loafers +3"
	}

	sets.midcast.Rapture = {
		head="Arbatel Bonnet +3"
	}

	--Idle Sets Below
	Idle_Set_Names = {'Normal', 'Sublimation', 'DT'}
	sets.Idle = {
    		ammo="Homiliary",
    		head="Volte Beret",
    		body="Jhakri Robe +2", --Arbatel Gown +3
    		hands="Nyame Gauntlets",
    		legs="Lengo Pants",
    		feet="Herald's Gaiters",
    		neck="Loricate Torque +1",
    		waist="Fucho-no-obi",
    		left_ear="Ethereal Earring",
    		right_ear="Infused Earring",
    		left_ring="Stikini Ring +1",
    		right_ring="Stikini Ring +1",
    		back="Moonlight Cape",
	}

	sets.Idle.Normal = set_combine(sets.Idle, {})
	
	sets.Idle.Sublimation = set_combine(sets.Idle, {
		head="Academic's Mortarboard +3",
		body="Pedagogy Gown +3",
		waist="Embla Sash"
	})

	sets.Idle.DT = set_combine(sets.Idle, {
		head="Nyame Helm",
		hands="Nyame Gauntlets",
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
    	right_ring="Defending Ring",
    	back="Moonlight Cape",
	})

	--Melee Sets
	Melee_Set_Names = {'Standard'}

	sets.Melee = {
		ammo="Oshasha's Treatise",
		head={ name="Blistering Sallet +1", augments={'Path: A',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands="Gazu Bracelet +1",
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Lissome Necklace",
		waist="Olseni Belt",
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back="Moonlight Cape",
	}


	sets.Melee.Standard = set_combine(sets.Melee, {})
	
	sets.precast['Earth Crusher'] = {
		ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Quanpur Necklace",
		waist="Hachirin-no-Obi",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Freke Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
	
	sets.precast['Myrkr'] = {
		head="Pixie Hairpin +1",
		body="Amalric Doublet +1", 
		hands="Regal Cuffs",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1",
		neck="Nodens Gorget",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Loquacious Earring", 
		left_ring="Supershear Ring",
		right_ring="Prolix Ring",
		back="Fi Follet Cape +1"
	} 

	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')
end

function precast(spell)	
	if spell.english:find("Ring") then
		return
	end
	
	if spell.type == 'Misc' then
		return
	end
	
	if sets.precast[spell.english] then
                equip(sets.precast[spell.english])
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	elseif spell.english:find("Cur") then 
		equip(sets.precast.Cure)       
	elseif spell.skill == "Elemental Magic" then
		equip(sets.precast.Elemental)
	else 
		equip(sets.precast.FastCast)
    	end
end

function midcast(spell)
	if spell.english:find("Ring") then
		return
	end
	
	if sets.midcast[spell.english] then
                equip(sets.midcast[spell.english])
		
		if spell.english:find("Refresh") and spell.target.name == "Zerodragoon" then
			equip(sets.midcast.RefreshRec)
		end
		
		if buffactive.Perpetuance then
			equip(sets.midcast.Perpetuance)
		end
	elseif spell.skill == 'Enhancing Magic' then
		equip(sets.midcast.Enhancing)

		if buffactive.Perpetuance then
			equip(sets.midcast.Perpetuance)
		end
		
		if buffactive.Rapture then
			equip(sets.midcast.Rapture)
		end
	elseif spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast.enfeeb)
	elseif spell.type == "BlackMagic" then
		if spell.english:find("helix") then
			if Weak_Helix_Flag then
				equip(sets.midcast.HelixWeak)
				return
			else 
				equip(sets.midcast.Helix)
			end
		else
			equip(sets.midcast.elemental)
			
			if BURST_Flag then 
				equip(sets.midcast.Burst)
			end
		end
		
		if buffactive.Immanence then
			equip(sets.midcast.Immanence)
		end

		if buffactive.Ebullience then
			equip(sets.midcast.Ebullience)
		end

		if spell.target.distance < 5.0 then
			equip(sets.midcast.Orepheus)
		end
		
		if spell.english:match("Stone") or spell.english:match("Quake") then
			equip({neck="Quanpur Necklace"})
		end

		if  spell.element == world.weather_element or
    			spell.element == world.day_element or 
    			(spell.element == 'Lightning' and buffactive['Thunderstorm']) or 
    			(spell.element == 'Ice' and buffactive['Hailstorm']) or 
    			(spell.element == 'Water' and buffactive['Rainstorm']) or 
    			(spell.element == 'Fire' and buffactive['Firestorm']) or 
    			(spell.element == 'Earth' and buffactive['Sandstorm']) or 
   			(spell.element == 'Wind' and buffactive['Windstorm']) or 
   			(spell.element == 'Light' and buffactive['Aurorastorm']) or 
    			(spell.element == 'Dark' and buffactive['Voidstorm']) then 
 			equip(sets.midcast.Obi)
			equip(sets.midcast.Twilight)
			
			if buffactive['Klimaform'] then
				equip(sets.midcast.Klimaform)
			end
		end
		
		if Occult_Flag then
			equip(sets.midcast.Occult)
		end
	elseif spell.english:find("Cur") then 
		equip(sets.midcast.cure)       

		if buffactive.Rapture then
			equip(sets.midcast.Rapture)
		end

		if  spell.element == world.weather_element or
    			spell.element == world.day_element or 
			(spell.element == 'Light' and buffactive['Aurorastorm']) then
			equip(sets.midcast.Obi)
			equip(sets.midcast.Twilight)
		else 
			equip(sets.Hands.Daybreak)
		end
	end 
end

function aftercast(spell)	
	if player.status=='Engaged' then
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	else		
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
		equip(sets.Idle[Idle_Set_Names[Idle_Index]])
		
		if buffactive['Sublimation: Activated'] then
			equip(sets.Idle.Sublimation)
		end	
	end
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
		
		if buffactive['Sublimation: Activated'] then
			equip(sets.Idle.Sublimation)
		end		
	elseif new == 'Engaged' then
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
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
	elseif command:sub(1, 7) =='element' then
		Temp_Nuke_Index = command:sub(8,9)

		if Temp_Nuke_Index == '' then
			Nuke_Index = Nuke_Index +1
		else 
			Nuke_Index = tonumber(Temp_Nuke_Index)
		end

		if Nuke_Index > #Nuke_Elements then 
			Nuke_Index = 1
		end
		
		add_to_chat(207,'Element Changed to: '..Nuke_Elements[Nuke_Index]..'')
	elseif command:sub(1, 4) == 'nuke' then
		Nuke_Tier = command:sub(5,6)
		
		send_command('input /ma "'..getNukeString(Nuke_Elements[Nuke_Index], Nuke_Tier)..'" <t> ')
	elseif command == 'sird' then
		SIRD_Flag = not SIRD_Flag
	elseif command == 'burst' then
		add_to_chat(207,'Burst Set: '..tostring(not BURST_Flag)..'')
		BURST_Flag = not BURST_Flag
	elseif command == 'weak_helix' then
		add_to_chat(207,'Helix Weak Set: '..tostring(not Weak_Helix_Flag)..'')
		Weak_Helix_Flag = not Weak_Helix_Flag
	elseif command == 'occult' then
		add_to_chat(207,'Occult Set: '..tostring(not Occult_Flag)..'')
		Occult_Flag = not Occult_Flag
	elseif command == 'equipidle' then
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif command == 'equipmelee' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	elseif command == 'startup' then
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif command == 'blm' then
		send_command('input /macro book 14;')
	elseif command == 'whm' then
		send_command('input /macro book 15;')
	elseif command == 'rdm' then
		send_command('input /macro book 16;')
	elseif command == 'sch' then
		send_command('input /macro book 19;')
	elseif command == 'geo' then
		send_command('input /macro book 20;')
	end
end

function file_unload()
	send_command('input //lua u nostrum')
end