include('organizer-lib')
include('custom_functions.lua')

function get_sets()
	Idle_Index = 1	
	Melee_Index = 1
	Hands_Index = 1
	PWS_Index = 1
	MWS_Index = 1

	--Default Macro Set for DRG
	send_command('input /macro book 7;wait .1;input /macro set 1;wait 0.5;input //gs org;wait 2.0; input /lockstyleset 31')
	
	ready_moves_to_check = S{'Sic','Whirl Claws','Dust Cloud','Foot Kick','Sheep Song','Sheep Charge','Lamb Chop',
    'Rage','Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang',
    'Roar','Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Venom','Geist Wall','Toxic Spit',
    'Numbing Noise','Nimble Snap','Cyclotail','Spoil','Rhino Guard','Rhino Attack','Power Attack',
    'Hi-Freq Field','Sandpit','Sandblast','Venom Spray','Mandibular Bite','Metallic Body','Bubble Shower',
    'Bubble Curtain','Scissor Guard','Big Scissors','Grapple','Spinning Top','Double Claw','Filamented Hold',
    'Frog Kick','Queasyshroom','Silence Gas','Numbshroom','Spore','Dark Spore','Shakeshroom','Blockhead',
    'Secretion','Fireball','Tail Blow','Plague Breath','Brain Crush','Infrasonics','??? Needles',
    'Needleshot','Chaotic Eye','Blaster','Scythe Tail','Ripper Fang','Chomp Rush','Intimidate','Recoil Dive',
    'Water Wall','Snow Cloud','Wild Carrot','Sudden Lunge','Spiral Spin','Noisome Powder','Wing Slap',
    'Beak Lunge','Suction','Drainkiss','Acid Mist','TP Drainkiss','Back Heel','Jettatura','Choke Breath',
    'Fantod','Charged Whisker','Purulent Ooze','Corrosive Ooze','Tortoise Stomp','Harden Shell','Aqua Breath',
    'Sensilla Blades','Tegmina Buffet','Molting Plumage','Swooping Frenzy','Pentapeck','Sweeping Gouge',
    'Zealous Snort','Somersault ','Tickling Tendrils','Stink Bomb','Nectarous Deluge','Nepenthic Plunge',
        'Pecking Flurry','Pestilent Plume','Foul Waters','Spider Web','Sickle Slash','Frogkick','Ripper Fang','Scythe Tail','Chomp Rush'}

	organizer_items = {
		dire="Dire Broth",
		food="Pet Food Theta"
	}
	
	sets.precast = {}

	-- Hands Sets
	Hands_Set_Names = {'Dual', 'Main', 'Naegling'}

	sets.Hands = {}	

	sets.Hands.Main = { 
		main="Agwu's Axe",
		sub="Sacro Bulwark"
	}
	
	sets.Hands.Dual = { 
		main="Dolichenus",
		sub="Agwu's Axe"
	}
	
	sets.Hands.Naegling = { 
		main="Naegling",
		sub="Agwu's Axe"
	}
					
	-- Physical WS Sets Below

	PWS_Set_Names = {'Normal'}
	sets.PWS = {
		head="Nyame Helm",							
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		ring1="Epona's Ring",
		ring2="Gere Ring",
		back="Sacro Mantle",
		ear1="Sherida Earring",
		ear2="Moonshade Earring",
		ammo="Coiste Bodhar"}

	sets.PWS.Normal = set_combine(sets.PWS, {})
	
	sets.precast['Decimation'] = set_combine(sets.PWS.Normal, {
		head="Gleti's Mask",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	})
	
	sets.precast['Ruinator'] = set_combine(sets.PWS.Normal, {
		head="Gleti's Mask",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	})
	
	sets.precast['Rampage'] = set_combine(sets.PWS.Normal, {
		head="Gleti's Mask",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	})
	
	sets.precast['Mistral Axe'] = set_combine(sets.PWS.Normal, {
		ammo="Oshasha's Treatise",
		ring2="Epaminondas's Ring",
		waist="Sailfi Belt +1",
		ear1="Nukumi Earring +1"
	})
	
	sets.precast['Cloudsplitter'] = set_combine(sets.PWS.Normal, {
		waist="Orpheus's Sash",
		ear1="Friomisi Earring",
		neck="Baetyl Pendant",
		ring1="Weatherspoon Ring +1",
		ring2="Epaminondas's Ring",
	})
		
	sets.precast['Primal Rend'] = set_combine(sets.PWS.Normal, {
		waist="Orpheus's Sash",
		ear1="Friomisi Earring",
		neck="Baetyl Pendant",
		ring1="Weatherspoon Ring +1",
		ring2="Epaminondas's Ring",
	})
	
	sets.precast['Savage Blade'] = set_combine(sets.PWS.Normal, {
		ring1="Sroda Ring",
		ring2="Epaminondas's Ring",
		ear1="Nukumi Earring +1"
	})

	-- Magical WS Sets Below
	MWS_Set_Names = {'Normal'}

	sets.MWS  = sets.PWS
						
	sets.MWS.Normal = set_combine(sets.MWS, {})
	
	--Idle Sets Below
	Idle_Set_Names = {'Move', 'Normal', 'PetDT'}
	sets.Idle = {
		head="Nyame Helm",							
		body="Nyame Mail",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Loricate Torque +1",
		waist="Isa Belt",
		ring1="Moonlight Ring",
		ring2="Cath Palug Ring",
		back="Moonlight Cape",
		ear1="Enmerkar Earring",
		ear2="Nukumi Earring +1",
		ammo="Staunch Tathlum +1"}

	sets.Idle.Normal = set_combine(sets.Idle, {})
	
	sets.Idle.Move = set_combine(sets.Idle.Normal, {
		feet="Skadi's Jambeaux +1"
	})

	sets.Idle.PetDT = set_combine(sets.Idle, {
		head="Anwig Salade",
		ear2="Handler's Earring +1",
		body={ name="Taeon Tabard", augments={'Pet: Accuracy+17 Pet: Rng. Acc.+17','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		legs={ name="Taeon Tights", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		feet={ name="Taeon Boots", augments={'Pet: Accuracy+17 Pet: Rng. Acc.+17','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		back={ name="Artio's Mantle", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}}
	})

	Melee_Set_Names = {'DT', 'PetLevel'}

	sets.Melee = {  
		head="Malignance Chapeau",							
		body="Malignance Tabard",
		hands="Gleti's Gauntlets",
		legs="Malignance Tights",
		feet="Gleti's Boots",
		neck="Anu Torque",
		waist="Reiki Yotai",
		ring1="Moonlight Ring",
		ring2="Gere Ring",
		back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
		ear1="Sherida Earring",
		ear2="Sroda Earring",
		ammo="Coiste Bodhar"
	}
	
	sets.PetFood = {
		ammo="Pet Food Theta"
	}
	
	sets.SlugJug = {
		ammo="Dire Broth"
	}
	
	sets.LeechJug = {
		ammo="C. Plasma Broth"
	}
	
	sets.FlyJug = {
		ammo="Blackwater Broth"
	}
	
	sets.GrasshopperJug = {
		ammo="Bubbly Broth"
	}
	
	sets.BirdJug = {
		ammo="Windy Greens"
	}
	
	sets.AcuexJug = {
		ammo="Venomous Broth"
	}

	sets.Melee.DT = sets.Melee
	sets.Melee.PetLevel = set_combine(sets.Melee, {
		ear2="Nukumi Earring +1"
	})
	
	sets.precast.Reward = {
		head="Bison Warbonnet",
		body="Ankusa Jackcoat +2",
		hands="Ogre Gloves",
		ear1="Pratik Earring",
		legs="Ankusa Trousers +1",
		back={ name="Artio's Mantle", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}
	
	sets.precast.Familiar = {
		legs="Ankusa Trousers +1"
	}
	
	sets.precast["Call Beast"] = {
		hands="Ankusa Gloves"
	}
	
	sets.precast["Bestial Loyalty"] = {
		hands="Ankusa Gloves"
	}
	
	sets.PetReady = {
		head="Nyame Helm",							
		body="Nyame Mail",
		hands="Nukumi Manoplas +2",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		ring1="Moonlight Ring",
		ring2="Cath Palug Ring",
		back={ name="Artio's Mantle", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
		ear1="Enmerkar Earring",
		ear2="Nukumi Earring +1",
		ammo="Staunch Tathlum +1"
	}

	send_command('wait 5;input //gs c startup;wait 1;input //gs validate')
end

function precast(spell)	
	if sets.precast[spell.english] then
        equip(sets.precast[spell.english])
	elseif ready_moves_to_check:contains(spell.name) and pet.status == 'Engaged' then
        equip(sets.PetReady)
	elseif spell.type == 'WeaponSkill' then
		equip(sets.PWS[PWS_Set_Names[PWS_Index]])	
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

function pet_midcast(spell)
	equip(sets.PetReady)
end

function pet_aftercast(spell)
    aftercast(spell)
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
	elseif command == 'angon' then
		equip(sets.precase.Angon)
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