-- Original: Motenten / Modified: Arislan

-------------------------------------------------------------------------------------------------------------------
--  Keybinds
-------------------------------------------------------------------------------------------------------------------

--  Modes:      [ F9 ]              Cycle Offense Mode
--              [ F10 ]             Emergency -PDT Mode
--              [ ALT+F10 ]         Toggle Kiting Mode
--              [ F11 ]             Emergency -MDT Mode
--              [ CTRL+F11 ]        Cycle Casting Modes
--              [ F12 ]             Update Current Gear / Report Current Status
--              [ CTRL+F12 ]        Cycle Idle Modes
--              [ ALT+F12 ]         Cancel Emergency -PDT/-MDT Mode
--              [ WIN+R ]           Toggle Regen Mode
--              [ WIN+C ]           Toggle Capacity Points Mode
--
--  Abilities:  [ CTRL+` ]          Afflatus Solace
--              [ ALT+` ]           Afflatus Misery
--              [ CTRL+[ ]          Divine Seal
--              [ CTRL+] ]          Divine Caress
--              [ CTRL+` ]          Composure
--              [ CTRL+- ]          Light Arts/Addendum: White
--              [ CTRL+= ]          Dark Arts/Addendum: Black
--              [ CTRL+; ]          Celerity/Alacrity
--              [ ALT+[ ]           Accesion/Manifestation
--              [ ALT+; ]           Penury/Parsimony
--
--  Spells:     [ ALT+O ]           Regen IV
--
--  Weapons:    [ CTRL+W ]          Toggles Weapon Lock
--
--  WS:         [ CTRL+Numpad7 ]    Black Halo
--              [ CTRL+Numpad8 ]    Hexa Strike
--              [ CTRL+Numpad9 ]    Realmrazer
--              [ CTRL+Numpad1 ]    Flash Nova
--              [ CTRL+Numpad0 ]    Mystic Boon
--
--
--              (Global-Binds.lua contains additional non-job-related keybinds)


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--              Addendum Commands:
--              Shorthand versions for each strategem type that uses the version appropriate for
--              the current Arts.
--                                          Light Arts					Dark Arts
--                                          ----------                  ---------
--		        gs c scholar light          Light Arts/Addendum
--              gs c scholar dark                                       Dark Arts/Addendum
--              gs c scholar cost           Penury                      Parsimony
--              gs c scholar speed          Celerity                    Alacrity
--              gs c scholar aoe            Accession                   Manifestation
--              gs c scholar addendum       Addendum: White             Addendum: Black


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
    state.RegenMode = M{['description']='Regen Mode', 'Duration', 'Potency'}

    lockstyleset = 1

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'DT', 'MEva')
    
    state.WeaponLock = M(false, 'Weapon Lock')    
    state.CP = M(false, "Capacity Points Mode")
	
	send_command('lua l gearinfo')
	send_command('lua l partybuffs')

	-- Additional local binds

   -- include('Global-Binds.lua') -- OK to remove this line
	
    --send_command('bind @c gs c toggle CP')
    --send_command('bind @r gs c cycle RegenMode')
    --send_command('bind @w gs c toggle WeaponLock')
	Haste = 0 --Gearinfo
	DW_needed = 0  --Gearinfo
	DW = false  --Gearinfo
	moving = false  --Gearinfo
	update_combat_form()  --Gearinfo
	determine_haste_group()  --Gearinfo

    select_default_macro_book()
    set_lockstyle()
end

function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind ^-')
    send_command('unbind ^=')
    send_command('unbind !-')
    send_command('unbind !=')
    send_command('unbind ^;')
    send_command('unbind ![')
    send_command('unbind !;')
    send_command('unbind ^[')
    send_command('unbind ^]')
    send_command('unbind !o')
    send_command('unbind @c')
    send_command('unbind @r')
    send_command('unbind @w')
    send_command('unbind ^numpad7')
    send_command('unbind ^numpad8')
    send_command('unbind ^numpad5')
    send_command('unbind ^numpad1')
    send_command('unbind ^numpad0')

    send_command('unbind #`')
    send_command('unbind #1')
    send_command('unbind #2')
    send_command('unbind #3')
    send_command('unbind #4')
    send_command('unbind #5')
    send_command('unbind #6')
    send_command('unbind #7')
    send_command('unbind #8')
    send_command('unbind #9')
    send_command('unbind #0')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells

sets.precast.FC = {
    --    /SCH --3
    main="Daybreak",
    sub="Genbu's Shield", 
    ammo="Sapience Orb", --2
    head="Bunzi's Hat", --10
    body="Inyanga Jubbah +2", --14
    hands="Fanatic Gloves", --7
    legs="Aya. Cosciales +2", --6
	feet=gear.Chironic.Feet_HRTLSS_FC, --6
    neck="Clr. Torque +1", --5
	waist="Embla Sash", --5
    left_ear="Loquac. Earring", --2
    right_ear="Malignance Earring", --4
	left_ring="Kishar Ring",--4
	right_ring="Prolix Ring", --2
    back={ name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}, --10
        }  --total = 74
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist="Siegel Sash",
        })

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
		main="Vadose Rod",
        legs="Ebers Pant. +2",
        })

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
        })

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty, body="Twilight Cloak"})

	sets.precast.FC['Dispelga'] = set_combine(sets.precast.FC, {
		main="Daybreak",
		})
    -- Precast sets to enhance JAs
    --sets.precast.JA.Benediction = {}
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
        }

    sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS, {

        })

    sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {

        })

    sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS, {
 
        })

    -- Midcast Sets
    
    sets.midcast.FC = {

        } -- Haste
    
    -- Cure sets

sets.midcast.CureSolace = {
        -- 10 from JP Gifts
    main="Daybreak", 
    sub="Genbu's Shield", 
    ammo="Staunch Tathlum",
    --[[head="Bunzi's Hat",
	body="Theophany Bliaut +3", 
    hands="Theophany Mitts +3",
    legs="Ebers Pant. +1",
	feet="Bunzi's Sabots",]]
	head="Nyame Helm",
	body="Bunzi's Robe",
	hands="Nyame Gauntlets",
	legs="Ebers Pant. +2",
	feet="Nyame Sollerets",
	neck="Clr. Torque +1",
    waist="Bishop's Sash",
	left_ear="Halasz Earring",
	right_ear="Regal Earring",
    left_ring="Defending Ring",
    right_ring="Inyanga Ring",
    back={ name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
        } -- 55% total

    sets.midcast.CureSolaceWeather = set_combine(sets.midcast.CureSolace, {

        })

    sets.midcast.CureNormal = set_combine(sets.midcast.CureSolace, {

        })

    sets.midcast.CureWeather = set_combine(sets.midcast.Cure, {

        })

    sets.midcast.CuragaNormal = set_combine(sets.midcast.Cure, {

        })

    sets.midcast.CuragaWeather = {

        }

    --sets.midcast.CureMelee = sets.midcast.CureSolace

sets.midcast.StatusRemoval = {
	main="Yagrush",
	sub="Genbu's Shield",
    ammo="Staunch Tathlum",
    --[[head="Kaykaus Mitra",
	body="Theophany Bliaut +3", 
    hands="Theophany Mitts +3",
	legs="Ebers Pant. +1",
	feet="Kaykaus Boots",]]
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Ebers Pant. +2",
	feet="Nyame Sollerets",
    neck="Clr. Torque +1",
    waist="Bishop's Sash",
	left_ear="Halasz Earring",
	right_ear="",
    left_ring="Defending Ring",
    right_ring="Inyanga Ring",
    back="Mending Cape",
        }
        
sets.midcast.Cursna = {
    main="Yagrush",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
	head="Nyame Helm",
    body="Ebers Bliaut +1",
    hands="Fanatic Gloves",
    legs="Th. Pant. +3",
    feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    neck="Malison Medallion",
    waist="Bishop's Sash",
    left_ear="Healing Earring",
	left_ring="Haoma's Ring",
    right_ear="Beatific Earring",
    right_ring="Menelaus's Ring",
	back={ name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
        }

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
sets.midcast['Enhancing Magic'] = {
	main="Gada",
	sub="Ammurapi Shield",
    head=gear.Telchine.Head_durHRT,
	body=gear.Telchine.Body_durHRT,
	hands=gear.Telchine.Hands_durHRT,
    legs={ name="Piety Pantaln. +1", augments={'Enhances "Shellra V" effect',}},
    feet="Theophany Duckbills +2",
	neck="Incanter's Torque",
	waist="Embla Sash",
    left_ear="Andoaa Earring",
	right_ear="Mimir Earring",
	left_ring="Stikini Ring",
	right_ring="Stikini Ring",
	back="Mending Cape",
        }

sets.midcast.EnhancingDuration = set_combine(sets.midcast['Enhancing Magic'], {
	hands=gear.Telchine.Hands_durHRT,
	legs=gear.Telchine.Legs_durHRT,
	
        })

    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        head="Inyanga Tiara +2",
		legs="Th. Pant. +3",
        })

    sets.midcast.RegenDuration = set_combine(sets.midcast.EnhancingDuration, {

        })
    
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {

        })

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Nodens Gorget",
        waist="Siegel Sash",
		right_ear="Earthcry Earring",
        })

    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
        main="Vadose Rod",
		--head=
		waist="Emphatikos Rope",
        })

    sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {
        feet="Ebers Duckbills +1",
        })

    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
		main="Beneficus",
		head="Ebers Cap +1",
        body="Ebers Bliaut +1",
        legs="Piety Pantaln. +1",
        feet="Ebers Duckbills +1",
        })

    sets.midcast.BoostStat = set_combine(sets.midcast['Enhancing Magic'], {
        })

    sets.midcast.Protect = set_combine(sets.midcast.EnhancingDuration, {
        })

    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Protect

    sets.midcast['Divine Magic'] = {

        }

    sets.midcast.Banish = set_combine(sets.midcast['Divine Magic'], {

        })

    sets.midcast.Holy = sets.midcast.Banish

    sets.midcast['Dark Magic'] = {

        }

    -- Custom spell classes
sets.midcast.MndEnfeebles = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Inyanga Tiara +2",
    body="Theo. Bliaut +3",
    hands="Theophany Mitts +3",
    legs="Th. Pant. +3",
    feet="Theophany Duckbills +2",
    neck="Erra Pendant",
    waist="Luminary Sash",
	left_ear="Malignance Earring",
	right_ear="Regal Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
        }

    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {
       
	   })

    sets.midcast.Impact = {

        }

	sets.midcast['Dispelga'] = set_combine(sets.midcast.IntEnfeebles, {
		main="Daybreak",
		})
		
    -- Initializes trusts at iLvl 119
    sets.midcast.Trust = sets.precast.FC

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {

        }
    
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
sets.idle = {
	main="Daybreak",
    sub={ name="Genbu's Shield", augments={'"Cure" potency +3%','Mag. Acc.+3','"Cure" spellcasting time -7%',}},
    ammo="Staunch Tathlum", --2
	head="Nyame Helm",
	body="Theo. Bliaut +3",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	--feet="Herald's Gaiters",
    neck="Yngvi Earring",
    waist="Fucho-no-Obi",
    left_ear="Moonshade Earring",
    right_ear="",
	left_ring="Defending Ring", --10/10
    right_ring="Shneddick Ring",
    back={ name="Alaunus's Cape", augments={'MP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
        }

sets.idle.DT = set_combine(sets.idle, {
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	neck="Loricate Torque +1", 
        })

sets.idle.MEva = set_combine(sets.idle.DT, {
    head="Inyanga Tiara +2",
    body="Theo. Bliaut +3",
    hands="Inyan. Dastanas +2",
    legs="Inyanga Shalwar +2",
    feet="Inyan. Crackows +1",
	neck="Loricate Torque +1", 
	right_ring="Inyanga Ring",
        })


    sets.idle.Town = set_combine(sets.idle, {
        })
    
    sets.idle.Weak = sets.idle.MEva
    
    -- Defense sets

    sets.defense.PDT = sets.idle.DT
    sets.defense.MDT = sets.idle.DT

    sets.Kiting = {
        }

    sets.latent_refresh = {
        waist="Fucho-no-obi"
        }

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {

        }

    sets.engaged.DW = set_combine(sets.engaged, {

        })

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts"}
    sets.buff['Devotion'] = {head="Piety Cap +1"}

    sets.buff.Doom = {ring1="Eshmun's Ring", ring2="Eshmun's Ring", waist="Gishdubar Sash"}

    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.CP = {back="Mecisto. Mantle"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.name == 'Impact' then
        equip(sets.precast.FC.Impact)
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
    if spellMap == 'Banish' or spellMap == "Holy" then
        if (world.weather_element == 'Light' or world.day_element == 'Light') then
            equip(sets.Obi)
        end
    end
    if spell.skill == 'Enhancing Magic' then
        if classes.NoSkillSpells:contains(spell.english) then
            equip(sets.midcast.EnhancingDuration)
            if spellMap == 'Refresh' then
                equip(sets.midcast.Refresh)
            end
        end
        if spellMap == "Regen" and state.RegenMode.value == 'Duration' then
            equip(sets.midcast.RegenDuration)
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english == "Sleep II" then
            send_command('@timers c "Sleep II ['..spell.target.name..']" 90 down spells/00259.png')
        elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
            send_command('@timers c "Sleep ['..spell.target.name..']" 60 down spells/00253.png')
        elseif spell.english == "Repose" then
            send_command('@timers c "Repose ['..spell.target.name..']" 90 down spells/00098.png')
        end 
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

function job_buff_change(buff,gain)
    if buff == "doom" then
        if gain then           
            equip(sets.buff.Doom)
            --send_command('@input /p Doomed.')
             disable('ring1','ring2','waist')
        else
            enable('ring1','ring2','waist')
            handle_equipping_gear(player.status)
        end
    end

end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if state.WeaponLock.value == true then
        disable('main','sub')
    else
        enable('main','sub')
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'scholar' then
        handle_strategems(cmdParams)
        eventArgs.handled = true
    elseif cmdParams[1]:lower() == 'nuke' then
        handle_nuking(cmdParams)
        eventArgs.handled = true
    end
   gearinfo(cmdParams, eventArgs)
end

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
--      if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
--          return "CureMelee"
        if default_spell_map == 'Cure' then
            if buffactive['Afflatus Solace'] then
                if (world.weather_element == 'Light' or world.day_element == 'Light') then
                    return "CureSolaceWeather"
                else
                    return "CureSolace"
                end
            else
                if (world.weather_element == 'Light' or world.day_element == 'Light') then
                    return "CureWeather"
                else
                    return "CureNormal"
                end                
            end
        elseif default_spell_map == 'Curaga' then
            if (world.weather_element == 'Light' or world.day_element == 'Light') then
                return "CuragaWeather"
            else
                return "CuragaNormal"
            end
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end

		--Gearinfo function
function job_handle_equipping_gear(status, eventArgs)
    update_combat_form()
    determine_haste_group()
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.CP.current == 'on' then
        equip(sets.CP)
        disable('back')
    else
        enable('back')
    end
    
    return idleSet
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

----------------------------------------------------------------------
-- User code that supplements self-commands.
-----------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	handle_equipping_gear(player.status)  
end

function update_combat_form()  
	if DW == true then  
		state.CombatForm:set('DW')  
	elseif DW == false then  
		state.CombatForm:reset()  
	end  
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function determine_haste_group()

    classes.CustomMeleeGroups:clear()

    if DW == true then

        if DW_needed <= 14 then

            classes.CustomMeleeGroups:append('MaxHaste')

        elseif DW_needed > 15 and DW_needed <= 26 then

            classes.CustomMeleeGroups:append('HighHaste')

        elseif DW_needed > 26 and DW_needed <= 32 then

            classes.CustomMeleeGroups:append('MidHaste')

        elseif DW_needed > 32 and DW_needed <= 43 then


            classes.CustomMeleeGroups:append('LowHaste')

        elseif DW_needed > 43 then

            classes.CustomMeleeGroups:append('')

        end

    end

end


-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    if strategem == 'light' then
        if buffactive['light arts'] then
            send_command('input /ja "Addendum: White" <me>')
        elseif buffactive['addendum: white'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            send_command('input /ja "Light Arts" <me>')
        end
    elseif strategem == 'dark' then
        if buffactive['dark arts'] then
            send_command('input /ja "Addendum: Black" <me>')
        elseif buffactive['addendum: black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
        else
            send_command('input /ja "Dark Arts" <me>')
        end
    elseif buffactive['light arts'] or buffactive['addendum: white'] then
        if strategem == 'cost' then
            send_command('input /ja Penury <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Celerity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Accession <me>')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: White" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
        if strategem == 'cost' then
            send_command('input /ja Parsimony <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Alacrity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Manifestation <me>')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: Black" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    else
        add_to_chat(123,'No arts has been activated yet.')
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 1)  
end

function update_offense_mode()  
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        state.CombatForm:set('DW')
    else
        state.CombatForm:reset()
    end
end

function set_lockstyle()
    send_command('wait 6; input /lockstyleset 1')
end