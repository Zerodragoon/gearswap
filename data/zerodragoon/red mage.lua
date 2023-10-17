include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1
	BURST_Flag = false
	Style_Lock_Id = 17

	--Default Macro Set for RNG
	send_command('input /macro book 16;wait .1;input /macro set 1;wait 0.5;input //gs org;wait 1;input //lua l nostrum; wait 1;input //nos profile redmage')
	
	set_style_lock()
	
	--Hands Sets
	Hands_Set_Names = {'Standard', 'Enspell', 'Naegling', 'Tauret', 'Ceremonial'}

	sets.Hands = {}	

	sets.Hands.Daybreak = { 
		main="Daybreak",
    	sub="Genmei Shield"
	}
	
	sets.Hands.Bunzi = { 
		main="Bunzi's Rod",
    	sub="Genmei Shield"
	}

	sets.Hands.Gada = { 
		main="Gada",
    	sub="Genmei Shield"
	}
	
	sets.Hands.Standard = { 
		main="Crocea Mors",
    	sub="Daybreak"
	}
	
	sets.Hands.Enspell = { 
		main="Crocea Mors",
    	sub="Pukulatmuj +1"
	}
	
	sets.Hands.Naegling = { 
		main="Naegling",
    	sub="Machaera +2"
	}
	
	sets.Hands.Tauret = { 
		main="Tauret",
    	sub="Blurred Knife +1"
	}

	sets.Hands.Ceremonial = {
		main = "Ceremonial Dagger",
		sub = "Ceremonial Dagger",
	}

	--Precast
	sets.precast = {}
	
	sets.precast.FastCast = { --30
		ammo="Sapience Orb", --2
		head={ name="Merlinic Hood", augments={'"Fast Cast"+7','CHR+6','Mag. Acc.+6','"Mag.Atk.Bns."+14',}}, --15
		body="Vitiation Tabard +3", --13
		hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+28','"Fast Cast"+7','INT+7',}}, --7
		legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+9','"Fast Cast"+7','MND+1','Mag. Acc.+15',}}, --7
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+7',}}, --12
		waist="Witful Belt", --3 --3
		neck="Baetyl Pendant", --4
		left_ear="Malignance Earring", --4
		right_ear="Loquac. Earring", --2
		left_ring="Kishar Ring", --4
		right_ring="Weatherspoon Ring +1", --5 --3
		back="Perimede Cape" --0 --4
	} --108 --10
	
	sets.precast.Elemental = set_combine(sets.precast.FastCast, {
		
	})

	sets.precast.Cure = set_combine(sets.precast.FastCast, {
	}) --85

	sets.precast.Cursna = sets.precast.FastCast
	
	sets.precast['Impact'] = set_combine(sets.FastCast, {
		head=empty,
		body="Crepuscular Cloak"
	})
	
	sets.precast.Saboteur = {
		hands="Lethargy Gantherots +2"
	}
	
	sets.precast['Dispelga'] = set_combine(sets.FastCast, {
		main="Daybreak",
		sub="Genmei Shield"
	})

	--Midcast Sets
	sets.midcast = {}
	
	sets.magic = {}

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
	})	
	
	sets.magic.damage = {
		ammo="Pemphredo Tathlum",
		head="Cath Palug Crown", --Lethargy Chappel +3
		body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1",
		neck="Sibyl Scarf",
		waist="Sacro Cord",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Freke Ring",
		right_ring="Metamorph Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}

	--Black Magic Sets
	sets.midcast.elemental = set_combine(sets.Hands.Bunzi, sets.magic.damage)

	sets.midcast.Burst = set_combine(sets.midcast.elemental, {
		head="Ea Hat +1",
    	body="Ea Houppe. +1",
    	hands="Amalric Gages +1",
		legs="Ea Slops +1",
    	feet="Bunzi's Sabots",
		right_ring="Mujin Band"
	})

	sets.midcast.enfeeb = set_combine(sets.midcast.elemental, {
		main="Contemplator +1",
		sub="Enki Strap",
		ranged="Ullr",
		ammo="empty",
		head="Vitiation Chapeau +3",
		body="Atrophy Tabard +3",
		hands="Regal Cuffs",
		legs="Lethargy Fuseau +2", 
		feet="Vitiation Boots +3",
		neck="Duelist's Torque +2",
		waist="Obstinate Sash",
		ear1="Regal Earring",
		ear2="Malignance Earring",
		ring1="Kishar Ring",
		ring2={name="Stikini Ring +1", bag="wardrobe6"},
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	})
	
	sets.midcast.Impact = set_combine(sets.midcast.enfeeb, {
		head=empty,
		body="Crepuscular Cloak"
	})
	
	sets.midcast['Dia'] = set_combine(sets.midcast.enfeeb, {
		ammo="Perfect Lucky Egg",
		body="Volte Jupon",
		waist="Chaac Belt"
	})
	
	sets.midcast['Addle II'] = set_combine(sets.midcast.enfeeb, {
		ring1="Stikini Ring +1",
		body="Lethargy Sayon +2",
		hands="Kaykaus Cuffs +1",
		ammo="Regal Gem",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	})
	
	sets.midcast['Bind'] = set_combine(sets.midcast.enfeeb, {
		ear2="Snotra Earring"
	})
	
	sets.midcast['Blind'] = set_combine(sets.midcast.enfeeb, {
		body="Lethargy Sayon +2",
		ring1="Stikini Ring +1",
		hands="Kaykaus Cuffs +1",
		ammo="Regal Gem"
	})
	
	sets.midcast['Distract III'] = set_combine(sets.midcast.enfeeb, {
		ring1="Stikini Ring +1",
		neck="Incanter's Torque",
		hands="Kaykaus Cuffs +1",
		ammo="Regal Gem",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	})
	
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.enfeeb, {
		ring1="Stikini Ring +1",
		neck="Incanter's Torque",
		hands="Kaykaus Cuffs +1",
		ammo="Regal Gem",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	}) 
	
	sets.midcast['Poison II'] = set_combine(sets.midcast.enfeeb, {
		ring1="Stikini Ring +1",
		neck="Incanter's Torque",
		hands="Kaykaus Cuffs +1"
	})
	
	sets.midcast['Paralyze II'] = set_combine(sets.midcast.enfeeb, {
		ring1="Stikini Ring +1",
		hands="Kaykaus Cuffs +1",
		ammo="Regal Gem",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	})
	
	sets.midcast['Slow II'] = set_combine(sets.midcast.enfeeb, {
		ring1="Stikini Ring +1",
		hands="Kaykaus Cuffs +1",
		ammo="Regal Gem",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}}
	})
	
	sets.midcast['Gravity II'] = set_combine(sets.midcast.enfeeb, {
		ear1="Snotra Earring"
	})
	
	sets.midcast['Silence'] = set_combine(sets.midcast.enfeeb, {
		ear2="Snotra Earring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	})
	
	sets.midcast['Sleep II'] = set_combine(sets.midcast.enfeeb, {
		ear2="Snotra Earring"
	})
	
	sets.midcast['Sleepga'] = set_combine(sets.midcast.enfeeb, {
		ear2="Snotra Earring"
	})
	
	sets.midcast['Inundation'] = set_combine(sets.midcast.enfeeb, {
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
	})
	
	sets.midcast['Dispelga'] = set_combine(sets.midcast.enfeeb, {
		main="Daybreak",
		sub="Genmei Shield"
	})
	
	--Cure Sets

	sets.midcast.cure = set_combine(sets.Hands.Daybreak, {
		ammo="Pemphredo Tathlum",
		head="Kaykaus Mitra +1",
		neck="Incanter's Torque",
		body="Kaykaus Bliaut +1",
		hands="Kaykaus Cuffs +1",
		feet="Kaykaus Boots +1",
		legs="Kaykaus Tights +1",
		left_ear="Malignance Earring",
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
		ring2="Menelaus's Ring"
	}

	sets.midcast.Enhancing = set_combine(sets.Hands.Gada, {
		sub="Ammurapi Shield",
		head="Vitiation Tabard +3",
		body={ name="Telchine Chasuble", augments={'Enh. Mag. eff. dur. +10',}},
		hands="Atrophy Gloves +3",
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet="Lethargy Houseaux +2",
		neck="Duelist's Torque +2",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Damage taken-5%',}},
		waist="Embla Sash",
		ear1="Mimir Earring",
		ear2="Lethargy Earring +1",
		--ear2="Andoaa Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		ammo="Pemphredo Tathlum"
	})
	
	sets.midcast["Protect V"] = set_combine(sets.midcast.Enhancing, {
		ring1="Sheltered Ring"
	})
	
	sets.midcast["Shell V"] = set_combine(sets.midcast.Enhancing, {
		ring1="Sheltered Ring"
	})

	sets.midcast["Refresh III"] = set_combine(sets.midcast.Enhancing, {
		head="Amalric Coif +1",
		body="Atrophy Tabard +3",
		legs="Lethargy Fuseau +2",
		back="Ghostfyre Cape"
	})
	
	sets.midcast["Regen II"] = set_combine(sets.midcast.Enhancing, {
		body={ name="Telchine Chasuble",  augments={'"Regen" potency+3',}},
		legs={ name="Telchine Braconi",  augments={'"Regen" potency+3',}},
		feet={ name="Telchine Pigaches",  augments={'"Regen" potency+3',}},
		back="Ghostfyre Cape"
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
		waist="Siegel Sash",
		back="Ghostfyre Cape"
	})
	
	sets.magic.Gain = set_combine(sets.midcast.Enhancing, {
		head="Befouled Crown",
		hands="Vitiation Gloves +3"
	})
	
	sets.midcast["Phalanx"] = set_combine(sets.midcast.Enhancing, {
		main="Sakpata's Sword",
		sub="Forfend +1",
		head={ name="Taeon Chapeau", augments={'Phalanx +3',}},
		body={ name="Taeon Tabard", augments={'Phalanx +3',}},
		hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
		legs={ name="Taeon Tights", augments={'Phalanx +3',}},
		feet={ name="Taeon Boots", augments={'Phalanx +3',}}
	})
	
	sets.magic.Enspell = set_combine(sets.midcast.Enhancing, {
		main="Pukulatmuj +1",
		sub="Forfend +1",
		head="Befouled Crown",
		hands="Vitiation Gloves +3",
		body="Vitiation Tabard +3",
		legs="Atrophy Tights +3",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		back="Ghostfyre Cape",
		ear2="Andoaa Earring"
	})
	
	sets.midcast['Temper II'] = set_combine(sets.magic.Enspell, {
		main="Pukulatmuj +1",
		sub="Forfend +1",
		head="Befouled Crown",
		hands="Vitiation Gloves +3",
		body="Vitiation Tabard +3",
		legs="Atrophy Tights +3",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		back="Ghostfyre Cape",
		ear2="Andoaa Earring"
	})
	
	sets.magic.Spikes = set_combine(sets.midcast.Enhancing, {
		legs="Vitiation Tights +3",
		back="Ghostfyre Cape"
	})
	
	sets.midcast['Enfire'] = sets.magic.Enspell
	sets.midcast['Enaero'] = sets.magic.Enspell
	sets.midcast['Enthunder'] = sets.magic.Enspell
	sets.midcast['Enblizzard'] = sets.magic.Enspell
	sets.midcast['Enstone'] = sets.magic.Enspell
	sets.midcast['Enwater'] = sets.magic.Enspell
	sets.midcast['Enfire II'] = sets.magic.Enspell
	sets.midcast['Enaero II'] = sets.magic.Enspell
	sets.midcast['Enthunder II'] = sets.magic.Enspell
	sets.midcast['Enblizzard II'] = sets.magic.Enspell
	sets.midcast['Enstone II'] = sets.magic.Enspell
	sets.midcast['Enwater II'] = sets.magic.Enspell
	sets.midcast['Ice Spikes'] = sets.magic.Spikes
	sets.midcast['Shock Spikes'] = sets.magic.Spikes
	sets.midcast['Blaze Spikes'] = sets.magic.Spikes
	
	sets.midcast['Gain-VIT'] = sets.magic.Gain
	sets.midcast['Gain-STR'] = sets.magic.Gain
	sets.midcast['Gain-MND'] = sets.magic.Gain
	sets.midcast['Gain-CHR'] = sets.magic.Gain
	sets.midcast['Gain-AGI'] = sets.magic.Gain
	sets.midcast['Gain-INT'] = sets.magic.Gain
	sets.midcast['Gain-DEX'] = sets.magic.Gain
	
	sets.midcast.BarspellDebuff = set_combine(sets.midcast.Barspell ,{
		neck="Sroda Necklace"
	})
	
	sets.midcast.Barvirus = sets.midcast.BarspellDebuff
	sets.midcast.Barpetrify = sets.midcast.BarspellDebuff
	sets.midcast.Baramnesia = sets.midcast.BarspellDebuff
	sets.midcast.Barpoison = sets.midcast.BarspellDebuff
	sets.midcast.Barparalyze = sets.midcast.BarspellDebuff
	sets.midcast.Barsilence = sets.midcast.BarspellDebuff
	sets.midcast.Barsleep = sets.midcast.BarspellDebuff
	sets.midcast.Barblind = sets.midcast.BarspellDebuff

	sets.Composure = {
		head="Lethargy Chappel +2",
		body="Lethargy Sayon +2",
		--hands="Lethargy Gantherots +2",
		legs="Lethargy Fuseau +2",
		feet="Lethargy Houseaux +2"
	}
	
	PWS_Set_Names = {'Normal'}
	sets.PWS = {
		head="Nyame Helm",								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets", --Lethargy Houseaux +3
		neck="Anu Torque",
		waist="Fotia Belt",
		ring1="Ephramad's Ring",
		ring2="Epaminondas's Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		ammo="Aurgelmir Orb +1"
	}
	
	sets.precast['Savage Blade'] = set_combine(sets.PWS, {

	})
	
	sets.PWS.Normal = set_combine(sets.PWS, {})

	sets.precast['Seraph Blade'] = set_combine(sets.magic.damage, {
		head="Cath Palug Crown",
		hands="Jhakri Cuffs +2",
		waist="Orpheus's Sash",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},  --Feet Lethargy Houseaux +3
	})
	
	sets.precast['Sanguine Blade'] = set_combine(sets.magic.damage, {
		head="Pixie Hairpin +1",
		hands="Jhakri Cuffs +2",
		waist="Orpheus's Sash",
		right_ring="Archon Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}}, --Feet Lethargy Houseaux +3
	})
	
	sets.precast['Aeolian Edge'] = set_combine(sets.magic.damage, {
		head="Nyame Helm",								
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		waist="Orpheus's Sash",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},  --Feet Lethargy Houseaux +3
	})
	

	--Idle Sets Below
	Idle_Set_Names = {'Move', 'Normal', 'Sublimation', 'DT'}
	sets.Idle = {
		ammo="Homiliary",
		head="Vitiation Chapeau +3",
		body="Lethargy Sayon +2",
		hands="Malignance Gloves",
		legs="Lengo Pants",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Fucho-no-obi",
		left_ear="Ethereal Earring",
		right_ear="Infused Earring",
		ring1={name="Stikini Ring +1", bag="wardrobe5"},
		ring2={name="Stikini Ring +1", bag="wardrobe6"},
		back="Moonlight Cape",
	}

	sets.Idle.Normal = set_combine(sets.Idle, {})
	
	sets.Idle.Move = set_combine(sets.Idle, {
		legs="Carmine Cuisses +1"
	})
	
	sets.Idle.Sublimation = set_combine(sets.Idle, {
		waist="Embla Sash"
	})

	sets.Idle.DT = set_combine(sets.Idle, {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		ammo="Staunch Tathlum +1",
		neck="Loricate Torque +1",
		left_ring="Warden's Ring",
		right_ring="Defending Ring",
		back="Moonlight Cape",
	})

	--Melee Sets
	Melee_Set_Names = {'Standard', 'Enspell', 'Odin'}

	sets.Melee = set_combine(sets.Hands.Naegling,{
		ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Anu Torque",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Damage taken-5%',}}
	})

	sets.Melee.Standard = set_combine(sets.Melee, {})
	
	sets.Melee.Enspell = set_combine(sets.Melee, {
		hands="Ayanmo Manopolas +2",
		waist="Orpheus's Sash",
		ammo="Sroda Tathlum",
	})
	
	sets.Melee.Odin = set_combine(sets.Melee.Enspell, {
        ranged = "Ullr",
        ammo = empty,
        neck = "Dls. Torque +2",
        right_ring = "Metamorph Ring +1"
    })
	
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
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	elseif spell.english:find("Cur") then 
		equip(sets.precast.Cure)
	elseif spell.type == 'WeaponSkill' then
	    if checkWSDistance(spell) then
			equip(sets.PWS)
		end
	elseif spell.skill == "Elemental Magic" then
		equip(sets.precast.Elemental)
	else 
		equip(sets.precast.FastCast)
    end
end

function midcast(spell)
	if spell.english:find("Ring") or spell.type == 'WeaponSkill' then
		return
	end
	
	if sets.midcast[spell.english] then
        equip(sets.midcast[spell.english])
		
		if buffactive.Composure and spell.skill == 'Enhancing Magic' and spell.target.name ~= "Zerodragoon" then
			equip(sets.Composure)
		end
		
		if spell.english:find("Refresh") and spell.target.name == "Zerodragoon" then
			equip(sets.midcast.RefreshRec)
		end
	elseif spell.skill == 'Enhancing Magic' then
		equip(sets.midcast.Enhancing)
		
		if buffactive.Composure and spell.target.name ~= "Zerodragoon" then
			equip(sets.Composure)
		end
	elseif spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast.enfeeb)
		
		if buffactive.Composure then
		--	equip(sets.Composure)
		end
		
		if buffactive.Saboteur then
			equip(sets.precast.Saboteur)
		end
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

function aftercast(spell)	
	if player.status=='Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	else		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]])
		
		if buffactive['Sublimation: Activated'] then
			equip(sets.Idle.Sublimation)
		end	
	end
	
	equip(sets.Hands[Hands_Set_Names[Hands_Index]])
end

function status_change(new,old)
	if T{'Idle','Resting'}:contains(new) then		
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
		
		if buffactive['Sublimation: Activated'] then
			equip(sets.Idle.Sublimation)
		end		
	elseif new == 'Engaged' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]]) 
	end
	
	equip(sets.Hands[Hands_Set_Names[Hands_Index]])
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
	elseif command == 'burst' then
		add_to_chat(207,'Burst Set: '..tostring(not BURST_Flag)..'')
		BURST_Flag = not BURST_Flag
	elseif command =='element' then
		Nuke_Index = Nuke_Index +1

		if Nuke_Index > #Nuke_Elements then 
			Nuke_Index = 1
		end
		
		add_to_chat(207,'Element Changed to: '..Nuke_Elements[Nuke_Index]..'')
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