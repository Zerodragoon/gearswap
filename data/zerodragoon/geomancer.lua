include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	SIRD_Flag = false
	BURST_FLAG = false
	Loupan_Flag = false
	Style_Lock_Id = 13
	
	--Default Macro Set for RNG
	send_command('input /macro book 20;wait .1;input /macro set 1;wait 0.5;input //gs org;wait 1;input //lua l nostrum; wait 1;input //nos profile geomancer')
	
	set_style_lock()
	
	--Hands Sets
	Hands_Set_Names = {'Idris', 'Bunzi', 'Max', 'Xoanon'}

	sets.Hands = {}

	sets.Hands.Idris = { 
		main="Idris",
    	sub="Genmei Shield"
	}

	sets.Hands.Solstice = { 
		main="Solstice",
    	sub="Genmei Shield"
	}		

	sets.Hands.Daybreak = { 
		main="Daybreak",
    	sub="Genmei Shield"
	}

	sets.Hands.Gada = { 
		main="Gada",
    	sub="Ammurapi Shield"
	}
	
	sets.Hands.Bunzi = { 
		main="Bunzi's Rod",
    	sub="Ammurapi Shield"
	}
	
	sets.Hands.Max = { 
		main="Maxentius",
    	sub="Genmei Shield"
	}
	
	sets.Hands.Max = { 
		main="Maxentius",
    	sub="Genmei Shield"
	}
	
	sets.Hands.Xoanon = {
		main="Xoanon",
		sub="Khonsu"
	}
	
	--Precast
	sets.precast = {}
	
	sets.precast.FastCast = {
		ranged="Dunna", --3
		head={ name="Merlinic Hood", augments={'"Fast Cast"+7','CHR+6','Mag. Acc.+6','"Mag.Atk.Bns."+14',}}, --15
		body="Shango Robe", --8
		hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+28','"Fast Cast"+7','INT+7',}}, --7
		legs="Geomancy Pants +3", --13 
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7',}}, --12
		waist="Witful Belt", --3 --3
		neck="Baetyl Pendant", --4
		left_ear="Malignance Earring", --4
		right_ear="Loquac. Earring", --2
		left_ring="Kishar Ring", --4
		right_ring="Weatherspoon Ring +1", --5 --3
		back="Perimede Cape", --0 --3
		ammo="Sapience Orb" --2
	} --82 --10

	sets.precast.Geomancy = set_combine(sets.precast.FastCast, {
	})
	
	sets.precast.Elemental = set_combine(sets.precast.FastCast, {
	}) --79

	sets.precast.Cure = set_combine(sets.precast.FastCast, {
	}) --86
	
	sets.precast['Dispelga'] = set_combine(sets.FastCast, {
		main="Daybreak",
		sub="Genmei Shield"
	})

	sets.precast['Impact'] = set_combine(sets.FastCast, {
		head=empty,
		body="Crepuscular Cloak"
	})
	
	sets.precast['Full Circle'] = {
		head="Azimuth Hood +2"
	}
	
	sets.precast['Life Cycle'] = {
		body="Geomancy Tunic +3"
	}

	sets.precast.Cursna = sets.precast.FastCast

	sets.precast['Radial Arcana'] = {
		feet="Bagua Sandals +3"
	}
	
	sets.precast['Mending Halation'] = {
		legs="Bagua Pants +3"
	}
	
	sets.precast['Bolster'] = {
		body="Bagua Tunic +3"
	}
	
	--Midcast Sets
	sets.midcast = {
		
	}

	sets.midcast.SIRD = {
		ammo="Staunch Tathlum +1", --11
		body="Telchine Chasuble", --7
		hands="Amalric Gages +1", --11
		legs="Geomancy Pants +3", --22
		feet="Amalric Nails +1", --16
		waist="Rumination Sash", --10
		left_ring="Freke Ring", --10
		back="Fi Follet Cape +1"
	} --104

	sets.midcast.Orepheus = {
		waist="Orpheus's Sash"
	}

	sets.midcast.Gishdubar = {
		waist="Gishdubar Sash"
	} 

	sets.midcast.Obi = {
		waist="Hachirin-no-Obi"
	}

	sets.midcast.RefreshRec = set_combine(sets.midcast.Gishdubar, {
		waist="Gishdubar Sash",
		feet="Inspirited Boots",
		back="Grapevine Cape"
	})	

	--Black Magic Sets
	sets.midcast.elemental = set_combine(sets.Hands.Bunzi, {
		ammo="Pemphredo Tathlum",
		head="Azimuth Hood +2",
		body="Azimuth Coat +2",
		hands="Azimuth Gloves +2",
		legs="Azimuth Tights +2",
		feet="Azimuth Gaiters +2",
		neck="Sibyl Scarf",
		waist="Sacro Cord",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Freke Ring",
		right_ring="Metamorph Ring +1",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
	})

	sets.midcast.Burst = set_combine(sets.midcast.elemental, {
		head="Ea Hat +1", 
		body="Ea Houppe. +1", --Azimuth Body?
		hands="Agwu's Gages", --Awgus Gages
		legs="Ea Slops +1", --Azimuth legs?
		feet="Agwu's Pigaches",
		right_ring="Mujin Band"
	})

	sets.midcast.enfeeb = set_combine(sets.midcast.elemental, {
		main="Contemplator +1",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		body="Cohort Cloak +1",
		hands="Regal Cuffs",
		legs="Geomancy Pants +3",
		feet="Geomancy Sandals +3",
		neck="Bagua Charm +2",
		waist="Acuity Belt +1",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
		ear1="Malignance Earring",
		ear2="Regal Earring",
		ring1="Kishar Ring",
		ring2="Stikini Ring +1",
	})
	
	sets.midcast.Impact = set_combine(sets.midcast.enfeeb, {
		head=empty,
		body="Crepuscular Cloak"
	})
	
	sets.midcast['Dispelga'] = set_combine(sets.midcast.enfeeb, {
		main="Daybreak",
		sub="Genmei Shield"
	})
	
	sets.midcast['Dia II'] = set_combine(sets.midcast.enfeeb, {
		ammo="Perfect Lucky Egg",
		waist="Chaac Belt",
		body="Volte Jupon"
	})
	
	sets.midcast.Aspir = set_combine(sets.midcast.enfeeb, {
		head="Bagua Galero +3",
		body="Geomancy Tunic +3",
		legs="Azimuth Tights +2",
		feet="Agwu's Pigaches",
		left_ear="Hirudinea Earring",
        right_ring="Evanescence Ring",
		neck="Erra Pendant",
        waist="Fucho-no-obi",
	})

	sets.midcast['Aspir II'] = sets.midcast.Aspir
	sets.midcast['Aspir III'] = sets.midcast.Aspir
	
	sets.midcast['Absorb-TP'] = set_combine(set_combine(sets.midcast.enfeeb, {
		head="Azimuth Hood +2",
		body="Geomancy Tunic +3",
		hands="Geomancy Mitaines +3",
		legs="Azimuth Tights +2",
		feet="Geomancy Sandals +3",
		left_ring="Stikini Ring +1",
        right_ring="Evanescence Ring",
		neck="Erra Pendant",
        waist="Acuity Belt +1",
	}), sets.Hands.Bunzi)

	--Cure Sets
	sets.midcast.cure = set_combine(sets.Hands.Daybreak, {
		sub="Sors Shield",
		ammo="Pemphredo Tathlum",
		head="Volte Beret",
		hands="Telchine Gloves",
		feet="Vanya Clogs",
		legs="Geomancy Pants +3",
		neck="Incanter's Torque",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		waist="Rumination Sash",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Oretania's Cape +1"
	})

	sets.midcast.indi = set_combine(sets.Hands.Idris, {
		ranged="Dunna",
		head="Azimuth Hood +2",
		body="Bagua Tunic +3",
		hands="Geomancy Mitaines +3",
		legs="Bagua Pants +3",
		feet="Azimuth Gaiters +2",
		neck="Bagua Charm +2",
		back="Lifestream Cape",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
	})
	
	sets.midcast.geomancy = set_combine(sets.midcast.indi, set_combine(sets.Hands.Idris, {
	}))

	sets.midcast.Cursna = {
		feet="Vanya Clogs",
		back="Oretania's Cape +1",
		neck="Debilis Medallion",
		ring1="Haoma's Ring",
		ring2="Menelaus's Ring"
	}

	sets.midcast.Enhancing = set_combine(sets.Hands.Gada, {
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chasuble", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		waist="Embla Sash",
		neck="Incanter's Torque",
		back="Fi Follet Cape +1",
		ear1="Mimir Earring",
		ear2="Andoaa Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
	})

	sets.midcast["Refresh"] = set_combine(sets.midcast.Enhancing, {
		head="Amalric Coif +1"
	})
	
	sets.midcast["Stoneskin"] = set_combine(sets.midcast.Enhancing, {
		legs="Shedir Seraweels",
		ear1="Earthcry Earring",
		neck="Nodens Gorget",
		waist="Siegel Sash"
	})
	
	sets.midcast["Aquaveil"] = set_combine(sets.midcast.Enhancing, {
		head="Amalric Coif +1",
		hands="Regal Cuffs",
		legs="Shedir Seraweels",
		waist="Emphatikos Rope"
	})
	
	sets.midcast["Protect V"] = set_combine(sets.midcast.Enhancing, {
		ring1="Sheltered Ring"
	})
	sets.midcast["Shell V"] =set_combine(sets.midcast.Enhancing, {
		ring1="Sheltered Ring"
	})
	
	sets.midcast["Sleepga"] = sets.midcast.enfeeb
	sets.midcast["Sleep"] = sets.midcast.enfeeb
	sets.midcast["Sleep II "] = sets.midcast.enfeeb
	
	--Idle Sets Below
	Idle_Set_Names = {'Normal', 'Combat', 'DT', 'Refresh'}
	sets.Idle = {
		ranged="Dunna",
		head="Azimuth Hood +2",
		body="Shamash Robe",
		hands="Geomancy Mitaines +3",
		legs="Nyame Flanchard",
		feet="Geomancy Sandals +3",
		neck="Bagua Charm +2",
		waist="Isa Belt",
		left_ear="Ethereal Earring",
		right_ear="Handler's Earring +1",
		left_ring="Stikini Ring +1",
		right_ring="Defending Ring",
		back={ name="Nantosuelta's Cape", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}}
	}

	sets.Idle.Normal = set_combine(sets.Idle, {})

	sets.Idle.Combat = set_combine(sets.Idle, {
		feet="Bagua Sandals +3"
	})

	sets.Idle.DT = set_combine(sets.Idle.Combat, {
		body="Nyame Mail"
	})

	sets.Idle.Refresh = set_combine(sets.Idle, {
		body="Jhakri Robe +2",
		head="Volte Beret", 
		legs="Lengo Pants",
		left_ring="Stikini Ring +1",
    	right_ring="Stikini Ring +1"
	})

	--Melee Sets
	Melee_Set_Names = {'Standard', 'DT', 'Refresh' }

	sets.Melee = {
		ranged="Dunna",
		head="Blistering Sallet +1",
		body="Nyame Mail",
		hands="Gazu Bracelets +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Lissome Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Crepuscular Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	}

	sets.Melee.Standard = set_combine(sets.Melee, {})

	sets.Melee.DT = set_combine(sets.Melee, {
		ammo="Staunch Tathlum +1",
		sub="Genmei Shield",
		neck="Loricate Torque +1",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		back="Moonlight Cape",
	})

	sets.Melee.Refresh = set_combine(sets.Melee, {
		main="Daybreak",
		head="Volte Beret", 
		sub="Genmei Shield", 
		legs="Lengo Pants",
		left_ring="Stikini Ring +1",
    	right_ring="Stikini Ring +1"
	})
	
	sets.WS = set_combine(sets.Melee, {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",		
		waist="Kentarch Belt +1",
		left_ear="Mache Earring +1",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		 back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	})
	
	sets.WSMagic = set_combine(sets.Melee, {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",	
		neck="Sibyl Scarf",		
		waist="Orpheus's Sash",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Freke Ring",
		right_ring="Weatherspoon Ring +1",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
	})
	
	sets.precast['Earth Crusher'] = set_combine(sets.WSMagic, {
		neck="Quanpur Necklace"
	})
	
	sets.precast['Cataclysm'] = sets.WSMagic
	
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
        if checkWSDistance(spell) then
			equip(sets.precast[spell.english])
		end
	elseif spell.type == 'WeaponSkill' then
		if checkWSDistance(spell) then
			equip(sets.WS) 
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	elseif spell.type == "Geomancy" then
		equip(sets.precast.Geomancy)
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
	elseif spell.skill == 'Enhancing Magic' then
		equip(sets.midcast.Enhancing)
	elseif spell.type == "Geomancy" then
		if spell.english:find("Geo-") then
			equip(sets.midcast.geomancy)
		else
			equip(sets.midcast.indi)
			
			if buffactive['Entrust'] then
				equip(sets.Hands.Solstice)
			end
		end
	elseif spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast.enfeeb)
	elseif spell.type == "BlackMagic" then
		if BURST_Flag then
			equip(sets.midcast.Burst)
		else 
			equip(sets.midcast.elemental)
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
		end
	elseif spell.english:find("Cur") then 
		equip(sets.midcast.cure)       

		if  spell.element == world.weather_element or
    			spell.element == world.day_element or 
			(spell.element == 'Light' and buffactive['Aurorastorm']) then
			equip(sets.midcast.Obi)
		end
	end
end

function pet_change(pet,gain) 
	Loupan_Flag = gain
	
	if player.status ~= 'Engaged' then
		if gain then
			equip(set_combine(sets.Idle[Idle_Set_Names[Idle_Index]],{
				feet="Bagua Sandals +3"
			}))
		else 
			equip(sets.Idle[Idle_Set_Names[Idle_Index]])
		end
	end
end

function pet_status_change(new,old) 
	if new:contains('dead') then
		Loupan_Flag = false
	end
end

function aftercast(spell)	
	equip(sets.Hands[Hands_Set_Names[Hands_Index]])

	if player.status=='Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	else		
		if Loupan_Flag then
			equip(set_combine(sets.Idle[Idle_Set_Names[Idle_Index]],{
				feet="Bagua Sandals +3"
			}))
		else 
			equip(sets.Idle[Idle_Set_Names[Idle_Index]])
		end
	end
end

function status_change(new,old)
	equip(sets.Hands[Hands_Set_Names[Hands_Index]])

	if T{'Idle','Resting'}:contains(new) then		
		if Loupan_Flag then
			equip(set_combine(sets.Idle[Idle_Set_Names[Idle_Index]],{
				feet="Bagua Sandals +3"
			}))
		else 
			equip(sets.Idle[Idle_Set_Names[Idle_Index]])
		end
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
	elseif command == 'sird' then
		SIRD_Flag = not SIRD_Flag
	elseif command == 'burst' then
		add_to_chat(207,'Burst Set: '..tostring(not BURST_Flag)..'')

		BURST_Flag = not BURST_Flag
	elseif command =='element' then
		Nuke_Index = Nuke_Index +1

		if Nuke_Index > #Nuke_Elements then 
			Nuke_Index = 1
		end
		
		add_to_chat(207,'Element Changed to: '..Nuke_Elements[Nuke_Index]..'')
	elseif command:sub(1, 7) == 'nukeaoe' then
		Nuke_Tier = command:sub(8,9)
		
		send_command('input /ma "'..getNukeString(Geo_Aoe_Elements[Nuke_Index], Nuke_Tier)..'" <t> ')
	elseif command:sub(1, 4) == 'nuke' then
		Nuke_Tier = command:sub(5,6)
		
		send_command('input /ma "'..getNukeString(Nuke_Elements[Nuke_Index], Nuke_Tier)..'" <t> ')
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