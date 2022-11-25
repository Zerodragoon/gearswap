include('organizer-lib')
include('custom_functions.lua')

organizer_items = {
	cards="Trump Card"
}

function get_sets()
	TP_Index = 1
	Idle_Index = 1	
	Melee_Index = 1
	Midshot_Index = 1
	Barrage_Index = 1
	Hands_Index = 1
	Flurry_Index = 1
	Weapon_Index = 1
	LS_Index = 1
	LeadenSalute_Index = 1
	Ammo_Index = 1
	RollRange_Flag = true
	DI_flag = false
	ATT_Cap_Flag = false
	Style_Lock_Id = 4

	--Default Macro Set for RNG
	send_command('input /macro book 12;wait .1;input /macro set 1;wait .1;wait .1;input //dp Gun;wait 0.1;input //lua load roller;wait 0.5;input //gs org;wait 1.0;input //lua l ar')
	
	set_style_lock()
	
	--PreSets Below (Snapshot/JA's)
	sets.precast = {}
	sets.precast.Standard = {}

	sets.precast['Random Deal'] = {body="Lanun Frac +3"}
	sets.precast['Loaded Deck'] = {body="Lanun Frac +3"}
	sets.precast['Fold'] = {hands="Lanun Gants +3"}
	sets.precast['Wild Card'] = {feet="Lanun Bottes +3"}

	Flurry_Set_Names = {'PreShotF2', 'PreShotF1'}
			
	sets.precast.Standard.PreShot = { --10
		head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}}, --10
		neck="Commodore Charm +2", --4
		body="Oshosi Vest +1", --14						
		hands="Carmine Finger Gauntlets +1", --8 --11
		legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, --10 --13
		feet="Meghanada Jambeaux +2",--10ww
		waist="Yemaya Belt", --0 --5
		ring1="Crepuscular Ring", --3
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Snapshot"+10','Damage taken-5%',}} -- 10
	} --79 --33

	sets.precast.Standard.PreShotF1 = set_combine(sets.precast.Standard.PreShot, { --25
		head="Chasseur's Tricorne +2", --14,
		body="Laksamana's Frac +3" --18
	}) --70 --65

	sets.precast.Standard.PreShotF2  = set_combine(sets.precast.Standard.PreShotF1, { --40
		feet="Pursuer's Gaiters" --10
	}) --75 --75

	-- Magic Sets Below		
	sets.precast.FastCast = {
		head="Carmine Mask +1", --14
		hands="Leyline Gloves", --8
		body="Dread Jupon", --7
		legs="Rawhide Trousers", --5
		feet="Carmine Greaves +1", --8
		neck="Baetyl Pendant", --4
		ear1="Loquacious Earring", --2
		ear2="Enchanter's Earring +1", --2
		ring1="Weatherspoon Ring +1", --5
		ring2="Kishar Ring", --4
		--ammo="Sapience Orb" --2
	} --59
	
	sets.precast.Utsusemi = set_combine(sets.precast.FastCast,{
		neck="Magoraga Beads", --10
		body="Passion Jacket" --10
	}) --63

	sets.precast['Curing Waltz III'] = {
		--head="Mummu Bonnet +2",
        head="Anwig Salade",
		body="Passion Jacket",
		hands="Slither Gloves +1",
		legs="Dashing Subligar", --10
		feet="Rawhide Boots", --8 
        ring1="Asklepian Ring",
		ring2="Valseur's Ring",
		ear1="Handler's Earring",
		ear2="Handler's Earring +1",
        waist="Gishdubar Sash"
    }

	sets.precast.roll = {
		main={ name="Rostam", augments={'Path: C',}},
		head="Lanun Tricorne +3",
		body="Chasseur's Frac +2",
		hands="Chasseur's Gants +2",
		legs="Desultor Tassets",
		ranged="Compensator",
		neck="Regal Necklace",
		ring1="Defending Ring",
		ring2="Luzaf's Ring",
		back="Camulus's Mantle"
	}
	
	sets.precast.rollshort = set_combine(sets.precast.roll, {
		ring2="Warden's Ring"
	})

	Weapon_Set_Names = {'DeathPenalty', 'Fomalhaut', 'Armageddon', 'Anarchy'}

	set.Weapon = {}	

	set.Weapon.DeathPenalty = {
		set={ 
			ranged="Death Penalty"
		},
		ammoType="bullet",
		preshot="Standard"
	}

	set.Weapon.Fomalhaut = {
		set={ 
			ranged="Fomalhaut"
		},
		ammoType="bullet",
		preshot="Standard"
	}

	set.Weapon.Armageddon = {
		set={ 
			ranged="Armageddon"
		},
		ammoType="bullet",
		preshot="Standard"
	}

	set.Weapon.Anarchy = {
		set={ 
			ranged="Anarchy +2"
		},
		ammoType="bullet",
		preshot="Standard"
	}
	
	set.Weapon.Prime = {
		set={ 
			ranged="Earp"
		},
		ammoType="bullet",
		preshot="Standard"
	}

	Ammo_Set_Names = {
		bullet = {'Living', 'Chrono'}
	}

	sets.Ammo = {}

	sets.Ammo.bullet = {
		Living = {
			ammo="Living Bullet"
		},
		Chrono =  {
			ammo="Chrono Bullet"
		}
	}
	
	sets.Prime = {
		ranged="Earp"
	}

	Hands_Set_Names = {'NaeglingBlurred', 'NaeglingGleti', 'NaeglingCrep', 'RangedShield', 'RangedDual', 'Tauret', 'RostamMelee', 'RostamTauret', 'RostamGleti', 'RostamCrep'}

	sets.Hands = {}	

	sets.Hands.NaeglingBlurred = { 
		main="Naegling",
		sub="Blurred Knife +1"
	}
	
	sets.Hands.NaeglingGleti = { 
		main="Naegling",
		sub="Gleti's Knife"
	}
	
	sets.Hands.NaeglingCrep = { 
		main="Naegling",
		sub="Crepuscular Knife"
	}

	sets.Hands.RangedShield = { 
		main={ name="Rostam", augments={'Path: A',}},
		sub="Nusku Shield"
	}

	sets.Hands.RangedDual = { 
		main={ name="Rostam", augments={'Path: A',}},
		sub="Kustawi +1"
	}
	
	sets.Hands.Tauret = { 
		main="Tauret",
		sub="Gleti's Knife"
	}
	
	sets.Hands.RostamMelee = { 
		main={ name="Rostam", augments={'Path: B',}},
		sub="Blurred Knife +1"
	}
	
	sets.Hands.RostamTauret = { 
		main={ name="Rostam", augments={'Path: B',}},
		sub="Tauret"
	}
	
	sets.Hands.RostamGleti = { 
		main={ name="Rostam", augments={'Path: B',}},
		sub="Gleti's Knife"
	}
	
	sets.Hands.RostamCrep = { 
		main={ name="Rostam", augments={'Path: B',}},
		sub="Crepuscular Knife"
	}
		
	--Midshot Sets Below
	Midshot_Set_Names = {'True', 'Ikenga', 'Malig', 'Acc', 'Crit'}
	sets.Midshot = { 
		head="Ikenga's Hat",
		hands="Ikenga's Gloves",
		body="Ikenga's Vest",
		legs="Chasseur's Culottes +2",
		feet="Ikenga's Clogs",
		neck="Iskur Gorget",
		waist="Yemaya Belt",
		ring1="Ilabrat Ring",
		ring2="Crepuscular Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10','Damage taken-5%',}},
		ear1="Enervating Earring",
		ear2="Telos Earring"  
	}

	sets.Midshot.Malig = set_combine(sets.Midshot, {
		head="Malignance Chapeau",							
		body="Malignance Tabard",
		hands="Malignance Gloves",
		feet="Malignance Boots"
	})

	sets.Midshot.Acc =  set_combine(sets.Midshot, {
		neck="Commodore Charm +2",
		waist="Kwahu Kachina Belt +1",	
		ring1="Regal Ring",
		ring2="Longshot Ring",			 
		ear1="Beyla Earring",
		ear2="Telos Earring"})
		
	sets.Midshot.Ikenga = set_combine(sets.Midshot, { 
		legs="Ikenga's Trousers"
	})

	sets.Midshot.Crit =  set_combine(sets.Midshot, {
		--head="Meghanada Visor +2",
		head="Mummu Bonnet +2",
		body="Nisroch Jerkin",
		hands="Mummu Wrists +2",
		legs="Mummu Kecks +2",
		feet="Oshosi Leggings +1",
		waist="Kwahu Kachina Belt +1",
		neck="Nefarious Collar +1",
		--ring1="Ilabrat Ring",
		ring1="Begrudging Ring",
		ring2="Mummu Ring",
		ear1="Odr Earring",
		ear2="Chasseur's Earring +1"})
		--ear2="Telos Earring"})

	sets.Midshot.triple = {
			head="Oshosi Mask +1",
			body="Chasseur's Frac +2",
			hands="Lanun Gants +3",
			legs="Oshosi Trousers +1",
			feet="Oshosi Leggings +1"}
						
	-- Last Stand Sets Below
	LS_Set_Names = {'Normal', 'Ikenga', 'Acc'}
	sets.LS = {
		head="Nyame Helm",							
		body="Nyame Mail",
		hands="Nyame Gauntlets", --Chasseur's Gants +3
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		ring1="Regal Ring",
		ring2="Epaminondas's Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}},
		ear1="Ishvara Earring",
		ear2="Moonshade Earring"}

	sets.LS.Normal = set_combine(sets.LS, {})
	
	sets.LS.Ikenga = set_combine(sets.LS, {
		body="Ikenga's Vest"
	})

	sets.LS.Acc = set_combine(sets.LS, {
		feet="Malignance Boots",
		waist="Kwahu Kachina Belt +1",		
		ring1="Regal Ring",
		ring2="Longshot Ring",
		ear1="Telos Earring",
		ear2="Beyla Earring"})
		
	sets.LS.Nyame = set_combine(sets.LS, {
		head="Nyame Helm",								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	})

	LeadenSalute_Set_Names = {'Normal','Hachi', 'Orpheus'}

	sets.LeadenSalute  = {
		head="Pixie Hairpin +1",						
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3",
		neck="Commodore Charm +2",
		waist="Eschan Stone", 
		ring1="Archon Ring",
		ring2="Dingir Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
		ear1="Friomisi Earring",
		ear2="Ishvara Earring"}
						
	sets.LeadenSalute.Normal = set_combine(sets.LeadenSalute, {})

	sets.LeadenSalute.Hachi = set_combine(sets.LeadenSalute, {
		waist="Hachirin-no-Obi"
	})

	sets.LeadenSalute.Orpheus = {
		waist="Orpheus's Sash"
	}

	sets.Wildfire = {
		head="Nyame Helm",
		ring1="Epaminondas's Ring"
	}
	
	sets.Aeolian = set_combine(sets.LeadenSalute, {
		head="Nyame Helm",						
		waist="Orpheus's Sash",
		ear2="Moonshade Earring",
		ring1="Epaminondas's Ring"
	})

	sets.Evis = {
		head="Adhemar Bonnet +1",
		body="Abnoba Kaftan",
		hands="Mummu Wrists +2",
		legs={ name="Herculean Trousers", augments={'"Triple Atk."+4','AGI+4','Accuracy+12',}},
		feet="Mummu Gamashes +2",
		waist="Fotia Belt",
		neck="Fotia Gorget",
		ear1="Odr Earring",
		ear2="Mache Earring +1",
		ring1="Regal Ring",
		ring2="Mummu Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	}

	sets.Savage = {	
		head="Nyame Helm",						
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		waist="Sailfi Belt +1",
		neck="Republican Platinum Medal",
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		ring1="Sroda Ring",
		ring2="Epaminondas's Ring",
		back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
	}
	
	sets.SavageCap = set_combine(sets.Savage, {	
		feet="Ikenga's Clogs", --Amini Earring +2
	})
	
	sets.QuickDraw = set_combine(sets.LeadenSalute, {
		head="Nyame Helm",
		ring1="Epaminondas's Ring",
		feet="Chasseur's Bottes +2"
	})
	
	sets.precast['Dark Shot'] = sets.QuickDraw
	sets.precast['Light Shot'] = sets.QuickDraw
	sets.precast['Earth Shot'] = sets.QuickDraw
	sets.precast['Ice Shot'] = sets.QuickDraw
	sets.precast['Water Shot'] = sets.QuickDraw
	sets.precast['Wind Shot'] = sets.QuickDraw
	sets.precast['Thunder Shot'] = sets.QuickDraw
	sets.precast['Fire Shot'] = sets.QuickDraw
	
	--Idle Sets Below
	Idle_Set_Names = {'DT', 'Refresh'}
	sets.Idle = {}

	sets.Idle.DT = set_combine(sets.Idle, {
		head="Malignance Chapeau",							
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Carmine Cuisses +1",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Gishdubar Sash",
		ring1="Warden's Ring",
		ring2="Defending Ring",
		back="Moonlight Cape",
		ear1="Infused Earring",
		ear2="Telos Earring"})
		
	sets.Idle.Refresh = set_combine(sets.Idle.DT, {
		head="Rawhide Mask",							
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Rawhide Trousers",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Gishdubar Sash",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Moonlight Cape",
		ear1="Infused Earring",
		ear2="Telos Earring"}
		)

	Melee_Set_Names = {'DT', 'DTMax', 'DTAcc', 'TH'}
	
	sets.Melee = {  
		head="Malignance Chapeau",
		body="Malignance Tabard",	
		hands="Malignance Gloves",
		legs="Malignance Tights", --Chasseur's Culottes +3
		feet="Malignance Boots",
		neck="Iskur Gorget",
		waist="Reiki Yotai",
		ring1="Petrov Ring",
		ring2="Epona's Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
		ear1="Suppanomimi",
		ear2="Telos Earring"
	}
	
	sets.Melee.DT  = set_combine(sets.Melee, {})
	
	sets.Melee.DTMax  = set_combine(sets.Melee, {
		neck="Loricate Torque +1",
		ring2="Defending Ring"
	})

	sets.Melee.DTAcc  = set_combine(sets.Melee.DT, {
		waist="Kentarch Belt +1",
		neck="Iskur Gorget",
		ear1="Mache Earring +1",
		ring1="Chirich Ring +1",
		ring2="Chirich Ring +1"})
		
	sets.Melee.TH = set_combine(sets.Melee.DT, {
		ammo="Perfect Lucky Egg",
		feet={ name="Herculean Boots", augments={'"Treasure Hunter"+2',}},
		waist="Chaac Belt"})

--[[	sets.Melee = {  
		head="Adhemar Bonnet +1",							
		body="Adhemar Jacket +1",
		hands="Adhemar Wristbands +1",
		legs="Samnuha Tights",
		feet={ name="Herculean Boots", augments={'Quadruple Attack +3'}},
		neck="Iskur Gorget",
		waist="Windbuffet Belt +1",
		ring1="Petrov Ring",
		ring2="Epona's Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
		ear1="Suppanomimi",
		ear2="Telos Earring"
	}

	sets.Melee.DblAtt45 = set_combine(sets.Melee, {})

	sets.Melee.DblAtt30 = set_combine(sets.Melee.DblAtt45, {
		feet="Taeon Boots",
		waist="Reiki Yotai",
		ear2="Eabani Earring"
	})

	sets.Melee.DblAtt15 = set_combine(sets.Melee.DblAtt30, {
		legs="Carmine Cuisses +1"
	})

	sets.Melee.DblAtt0 = set_combine(sets.Melee.DblAtt15, {
		head={ name="Herculean Helm", augments={'Accuracy+8','"Dual Wield"+5','DEX+1','Attack+12',}},
	})
--]]


	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')

end

function precast(spell)	
	if sets.precast[spell.english] then
                equip(sets.precast[spell.english])

		if spell.name == 'Bounty Shot' or spell.name == 'Eagle Eye Shot' then
			if player.equipment.ammo == 'Hauksbok Bullet' or player.equipment.ammo == 'Hauksbok Arrow' then
				add_to_chat(167,''..player.equipment.ammo..' equipped, canceling shot')                           
            			cancel_spell()
            			return	
			end	
		end
	elseif spell.english:find("Roll") or spell.english:find("Double") then 
		if RollRange_Flag then
			equip(sets.precast.roll)
		else
			equip(sets.precast.rollshort)
		end
	elseif spell.type == 'WeaponSkill' then
		if spell.target.distance > 21.0  then						
			add_to_chat(167,''..spell.target.name..' is too far can not use '..spell.name..'!!!. Cancelling WeaponSkill ')                           
            		cancel_spell()
            		return			
		elseif spell.name == "Leaden Salute" then
                	equip(sets.LeadenSalute[LeadenSalute_Set_Names[LeadenSalute_Index]])

			if buffactive['Voidstorm'] or 
				spell.element == world.weather_element or
    			spell.element == world.day_element then
				equip(sets.LeadenSalute.Hachi)
			elseif spell.target.distance < 3.0 then
				equip(sets.LeadenSalute.Orpheus)
			end
		elseif spell.name == "Wildfire" then
                	equip(set_combine(sets.LeadenSalute[LeadenSalute_Set_Names[LeadenSalute_Index]], sets.Wildfire))

			if buffactive['Firestorm'] then
				equip(sets.LeadenSalute.Hachi)
			elseif spell.target.distance < 3.0 then
				equip(sets.LeadenSalute.Orpheus)
			end
		elseif spell.name == "Hot Shot" then
                	equip(set_combine(sets.LeadenSalute[LeadenSalute_Set_Names[LeadenSalute_Index]], sets.Wildfire))

			if buffactive['Firestorm'] then
				equip(sets.LeadenSalute.Hachi)
			elseif spell.target.distance < 3.0 then
				equip(sets.LeadenSalute.Orpheus)
			end
		else
            equip(sets.LS[LS_Set_Names[LS_Index]])
		end
		
		Ammo_Set_Subset = sets.Ammo[weapon_set.ammoType]
		Ammo_Name_Subset = Ammo_Set_Names[weapon_set.ammoType]
		
		equip(Ammo_Set_Subset[Ammo_Name_Subset[Ammo_Index]])

		if spell.name == "Aeolian Edge" then
                	equip(sets.Aeolian)
		elseif spell.name == "Burning Blade" or spell.name == "Red Lotus Blade" then
            equip(sets.Aeolian)
		elseif spell.name == "Seraph Blade" then
            equip(set_combine(sets.Aeolian, {
				ring1="Weatherspoon Ring +1"
			}))		
		elseif spell.name == "Circle Blade" then
                	equip(sets.LS[LS_Set_Names[LS_Index]])
		elseif spell.name == "Evisceration" then
                	equip(sets.Evis)
		elseif spell.name == "Savage Blade" then
                if ATT_Cap_Flag then
					equip(sets.SavageCap)
				else 
					equip(sets.Savage)
				end
		elseif player.equipment.ammo == 'Hauksbok Bullet' or player.equipment.ammo == 'Hauksbok Arrow' then
			add_to_chat(167,''..player.equipment.ammo..' equipped, canceling shot')                           
            		cancel_spell()
            		return		
		end		
	elseif spell.name == "Ranged" then
		weapon_set = set.Weapon[Weapon_Set_Names[Weapon_Index]]
		preshot_set = sets.precast[weapon_set.preshot]

		if buffactive['Flurry'] then
			equip(preshot_set[Flurry_Set_Names[Flurry_Index]])				
		else
			equip(preshot_set.PreShot)
		end

		Ammo_Set_Subset = sets.Ammo[weapon_set.ammoType]
		Ammo_Name_Subset = Ammo_Set_Names[weapon_set.ammoType]
		
		equip(Ammo_Set_Subset[Ammo_Name_Subset[Ammo_Index]])

		if player.equipment.ammo == 'Hauksbok Bullet' or player.equipment.ammo == 'Hauksbok Arrow' then
			add_to_chat(167,''..player.equipment.ammo..' equipped, canceling shot')                           
            		cancel_spell()
            		return		
		end
	elseif spell.type == "Ninjutsu" or spell.type == "WhiteMagic" then
		if string.find(spell.english,'Utsusemi') then
			equip(sets.precast.Utsusemi)
		else
			equip(sets.precast.FastCast)
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')        
    end
end

function midcast(spell)
	if spell.name == "Ranged" then
		equip(sets.Midshot[Midshot_Set_Names[Midshot_Index]]) 
		if buffactive['Triple Shot'] and DI_flag == false then
			equip(set_combine(sets.Midshot[Midshot_Set_Names[Midshot_Index]], sets.Midshot.triple))						
		end
	end
end

function aftercast(spell)	
	if spell.english:find("Roll") or spell.english:find("Double") then 
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
		equip(set.Weapon[Weapon_Set_Names[Weapon_Index]].set)
	end

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
	if command == 'tp' then
		TP_Index = TP_Index +1		
		if TP_Index > #TP_Set_Names then TP_Index = 1 end
		add_to_chat(207,'TP Set Changed to: '..TP_Set_Names[TP_IEndex]..'')
		status_change(player.status)
	elseif command == 'idle' then
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
	elseif command == 'flurry' then
		Flurry_Index = Flurry_Index +1
		if Flurry_Index > #Flurry_Set_Names then Flurry_Index = 1 end
		add_to_chat(207,'Flurry Set Changed to: '..Flurry_Set_Names[Flurry_Index ]..'')
	elseif command:sub(1, 6) == 'weapon' then
		Temp_Weapon_Index = command:sub(7,9)

		if Temp_Weapon_Index == '' then
			Weapon_Index = Weapon_Index +1
		else 
			Weapon_Index = tonumber(Temp_Weapon_Index)
		end
		
		if Weapon_Index > #Weapon_Set_Names then Weapon_Index = 1 end
		add_to_chat(207,'Weapon Set Changed to: '..Weapon_Set_Names[Weapon_Index]..'')
		weapon_set = set.Weapon[Weapon_Set_Names[Weapon_Index]]
		equip(weapon_set.set)

		Ammo_Index = 1
		Ammo_Set_Subset = sets.Ammo[weapon_set.ammoType]
		Ammo_Name_Subset = Ammo_Set_Names[weapon_set.ammoType]
		
		equip(Ammo_Set_Subset[Ammo_Name_Subset[Ammo_Index]])

		if weapon_set.ammoType == 'bullet' then
			send_command('input //dp Gun')
		elseif weapon_set.ammoType == 'arrow' then
			send_command('input //dp Bow')
		elseif weapon_set.ammoType == 'bolt' then
			send_command('input //dp Xbow')
		end
	elseif command == 'ammo' then
		weapon_set = set.Weapon[Weapon_Set_Names[Weapon_Index]]
		Ammo_Index = Ammo_Index +1
		Ammo_Name_Subset = Ammo_Set_Names[weapon_set.ammoType]
		if Ammo_Index > #Ammo_Name_Subset then Ammo_Index = 1 end
		
		equip(Ammo_Set_Subset[Ammo_Name_Subset[Ammo_Index]])
		
		add_to_chat(207,'Ammo Set Changed to: '..Ammo_Name_Subset[Ammo_Index]..'')	
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
	elseif command == 'midshot' then
		Midshot_Index = Midshot_Index +1
		if Midshot_Index > #Midshot_Set_Names then Midshot_Index = 1 end
		add_to_chat(207,'Midshot Set Changed to: '..Midshot_Set_Names[Midshot_Index]..'')		
	elseif command == 'barrage' then
		Barrage_Index = Barrage_Index +1
		if Barrage_Index > #Barrage_Set_Names then Barrage_Index = 1 end
		add_to_chat(207,'Barrage Set Changed to: '..Barrage_Set_Names[Barrage_Index]..'')	
	elseif command == 'lsws' then
		LS_Index = LS_Index +1
		if LS_Index > #LS_Set_Names then LS_Index = 1 end
		add_to_chat(207,'LS Set Changed to: '..LS_Set_Names[LS_Index]..'')
	elseif command == 'tfws' then
		LeadenSalute_Index = LeadenSalute_Index +1
		if LeadenSalute_Index > #LeadenSalute_Set_Names then LeadenSalute_Index = 1 end
		add_to_chat(207,'LeadenSalute Set Changed to: '..LeadenSalute_Set_Names[LeadenSalute_Index]..'')
	elseif command == 'update' then
		status_change(player.status)
		add_to_chat(207,'Update player status...')
	elseif command == 'equippre' then
		weapon_set = set.Weapon[Weapon_Set_Names[Weapon_Index]]
		equip(sets.precast[weapon_set.preshot].PreShot)	 
	elseif command == 'equipflurry' then
		weapon_set = set.Weapon[Weapon_Set_Names[Weapon_Index]]
		preshot_set = sets.precast[weapon_set.preshot]
		equip(preshot_set[Flurry_Set_Names[Flurry_Index]])
	elseif command == 'rollrange' then
		add_to_chat(207,'Roll Range : '..tostring(not RollRange_Flag)..'')
		RollRange_Flag = not RollRange_Flag
	elseif command == 'equipmid' then
		equip(sets.Midshot[Midshot_Set_Names[Midshot_Index]]) 
	elseif command == 'equipdouble' then
		equip(set_combine(sets.Midshot[Midshot_Set_Names[Midshot_Index]], sets.Midshot.triple))		 
	elseif command == 'equipbarrage' then
		equip(sets.Barrage[Barrage_Set_Names[Barrage_Index]])	
	elseif command == 'equiptf' then
		equip(sets.LeadenSalute[LeadenSalute_Set_Names[LeadenSalute_Index]])
	elseif command == 'equipws' then
		equip(sets.LS[LS_Set_Names[LS_Index]])
	elseif command == 'equipevis' then
		equip(sets.Evis)
	elseif command == 'equipsavage' then
		equip(sets.Savage)
	elseif command == 'equipidle' then
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif command == 'equipmelee' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	elseif command == 'attcap' then
		add_to_chat(207,'Attack Cap Set: '..tostring(not ATT_Cap_Flag)..'')

		ATT_Cap_Flag = not ATT_Cap_Flag
	elseif command == 'di' then
		if DI_flag == false then
			DI_flag = true
			Midshot_Index = 6
			LS_Index = 3
			equip(sets.Midshot[Midshot_Set_Names[Midshot_Index]]) 
		else 
			DI_flag = false
			Midshot_Index = 1
			LS_Index = 1
		end
	elseif command == 'startup' then
		equip(sets.Hands[Hands_Set_Names[Hands_Index]])
 
		weapon_set = set.Weapon[Weapon_Set_Names[Weapon_Index]]
		equip(weapon_set.set)

		Ammo_Set_Subset = sets.Ammo[weapon_set.ammoType]
		Ammo_Name_Subset = Ammo_Set_Names[weapon_set.ammoType]
		equip(Ammo_Set_Subset[Ammo_Name_Subset[Ammo_Index]])
	end
end


function file_unload()
	send_command('lua u roller')
	send_command('lua u ar')
end