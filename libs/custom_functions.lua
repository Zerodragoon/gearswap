require 'tables'
files = require 'files'
res = require 'resources'
packets = require('packets')
extdata = require('extdata')
--inspect = require('inspect')
doomed = false
sets.HolyWater = {neck="Nicander's Necklace",waist="Gishdubar Sash", ring1="Blenmot's Ring +1", ring2="Purity Ring"}

Nuke_Index = 1
Style_Lock_Id = 11
Nuke_Elements = {'Stone', 'Water', 'Fire', 'Aero', 'Thunder', 'Blizzard'}
Nuke_Ja_Elements = {'Stoneja', 'Waterja', 'Firaja', 'Aeroja', 'Thundaja', 'Blizzaja'}
Geo_Aoe_Elements = {'Stonera', 'Watera', 'Fira', 'Aera', 'Thundera', 'Blizzara'}
Blm_Aoe_Elements = {'Stonega', 'Waterga', 'Firaga', 'Aeroga', 'Thundaga', 'Blizzaga'}
Anc_Nuke_Elements = {'Quake', 'Flood', 'Flare', 'Tornado', 'Burst', 'Freeze'}
Nin_Nuke_Elements = {'Doton', 'Suiton', 'Katon','Huton', 'Raiton', 'Hyoton'}

Weapon_Skill_Range = {
    [2] = 3,
    [4] = 8,
    [10] = 14,
    [12] = 20
}

ws_safety_margin = 0

function set_style_lock()
	send_command('wait 2.0; input /lockstyleset '..Style_Lock_Id..'')
end

function sub_job_change(new,old) 
	set_style_lock()
end

function buff_change(name,gain,buff_details) 
    if name == "doom" or name == "Doom" then
        if gain then
            equip(sets.HolyWater)
            disable('neck','ring1','waist')
			doomed = true
			use_holywater()
        else
            enable('neck','ring1','waist')
			doomed = false
        end
    end
	
	if name == "sleep" or name == "Sleep" then
        if gain then
            equip({sub = "Duban"})
			equip({ranged = "Earp"})
			equip({ranged = "Prime Horn"})
		else
			windower.send_command('gs c startup')
        end
    end
	
	if name == "scherzo" or name == "Scherzo" then
		if not gain and player.status == 'Engaged' then
			windower.send_command("input /p Scherzo Lost <call15>")
		end
	end
end

function use_holywater()
	coroutine.schedule(function() 
		windower.send_command('input /item "Holy Water" '..windower.ffxi.get_player()["name"])
		
		coroutine.schedule(function() 
			if doomed then
				use_holywater()
			end
		end, 1.5)
	end, 1.5)
end

function getNukeString(element, tier)
	temptier = ''
	
	if tier == '2' then
		temptier = ' II'
	elseif tier == '3' then
		temptier = ' III'	
	elseif tier == '4' then
		temptier = ' IV'	
	elseif tier == '5' then 
		temptier = ' V'	
	elseif tier == '6' then
		temptier = ' VI'	
	end
	
	return element..temptier
end

function getNinjaNukeString(element, tier)
	temptier = ': Ichi'
	
	if tier == '2' then
		temptier = ': Ni'
	elseif tier == '3' then
		temptier = ': San'		
	end
	
	return element..temptier
end

function checkWSDistance(spell) 
	if spell.type == 'WeaponSkill' then
        local ws_range = Weapon_Skill_Range[spell.range]
        local player_size = player.model_size
        local target_size = spell.target.model_size
        local max_ws_distance = player_size + ws_range + target_size

        if spell.target.distance >= max_ws_distance - ws_safety_margin then
			add_to_chat(167,"Canceling " .. spell.name .. ". The target is too far.")
            cancel_spell()
			return false
        end
    end
	
	return true
end

--Global Self Commands
function parent_self_command(command)
	if command == 'autows' then
		add_to_chat(207,'Auto WS Set: '..tostring(not auto_ws)..'')

		auto_ws = not auto_ws
	elseif command == 'tp' then
		TP_Index = TP_Index +1		
		if TP_Index > #TP_Set_Names then TP_Index = 1 end
		add_to_chat(207,'TP Set Changed to: '..TP_Set_Names[TP_IEndex]..'')
		status_change(player.status)
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
		TrueFlight_Index = TrueFlight_Index +1
		if TrueFlight_Index > #TrueFlight_Set_Names then TrueFlight_Index = 1 end
		add_to_chat(207,'Trueflight Set Changed to: '..TrueFlight_Set_Names[TrueFlight_Index]..'')
	elseif command == 'jishnuws' then
		Jishnu_Index = Jishnu_Index +1
		if Jishnu_Index > #Jishnu_Set_Names then Jishnu_Index = 1 end
		add_to_chat(207,'Jishnu Set Changed to: '..Jishnu_Set_Names[Jishnu_Index]..'')
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
	elseif command == 'equipmid' then
		equip(sets.Midshot[Midshot_Set_Names[Midshot_Index]]) 
	elseif command == 'equipdouble' then
		equip(set_combine(sets.Midshot[Midshot_Set_Names[Midshot_Index]], sets.Midshot.double))		 
	elseif command == 'equipbarrage' then
		equip(sets.Barrage[Barrage_Set_Names[Barrage_Index]])	
	elseif command == 'equiptf' then
		equip(sets.TrueFlight[TrueFlight_Set_Names[TrueFlight_Index]])
	elseif command == 'equipws' then
		equip(sets.LS[LS_Set_Names[LS_Index]])
	elseif command == 'equipevis' then
		equip(sets.Evis)
	elseif command == 'equipdeci' then
		equip(sets.Decimation)
	elseif command == 'equipsavage' then
		equip(sets.Savage)
	elseif command == 'equipidle' then
		equip(sets.Idle[Idle_Set_Names[Idle_Index]]) 
	elseif command == 'equipmelee' then
		equip(sets.Melee[Melee_Set_Names[Melee_Index]])
	elseif command == 'attcap' then
		add_to_chat(207,'Attack Cap Set: '..tostring(not ATT_Cap_Flag)..'')

		ATT_Cap_Flag = not ATT_Cap_Flag
	elseif command == 'attcaphigh' then
		add_to_chat(207,'Attack Cap High Set: '..tostring(not ATT_Cap_High)..'')

		ATT_Cap_High = not ATT_Cap_High
	end
end