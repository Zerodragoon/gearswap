-------------------------------------------------------------------------------------------------------------------
-- (Original: Motenten / Modified: Arislan)
-------------------------------------------------------------------------------------------------------------------

--[[    Custom Features:
        
        Magic Burst            Toggle Magic Burst Mode  [Alt-`]
        Capacity Pts. Mode    Capacity Points Mode Toggle [WinKey-C]
        Auto. Lockstyle        Automatically locks desired equipset on file load
--]]

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
    indi_timer = ''
    indi_duration = 180

    state.CP = M(false, "Capacity Points Mode")
	state.Buff['Entrust'] = buffactive['Entrust'] or false
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Seidr', 'Resistant', 'MagicBurst')
    state.IdleMode:options('DT', 'Normal')

    state.WeaponLock = M(false, 'Weapon Lock')    
    state.MagicBurst = M(false, 'Magic Burst')
	
	
	send_command('lua l gearinfo')

	-- Additional local binds

   -- include('Global-Binds.lua') -- OK to remove this line
	
    send_command('bind ^` input /ja "Full Circle" <me>')
    send_command('bind !` gs c toggle MagicBurst')
    send_command('bind @c gs c toggle CP')
    send_command('bind @w gs c toggle WeaponLock')

    send_command('bind ^numpad7 input /ws "Black Halo" <t>')
    send_command('bind ^numpad8 input /ws "Hexa Strike" <t>')
    send_command('bind ^numpad9 input /ws "Realmrazer" <t>')
    send_command('bind ^numpad6 input /ws "Exudation" <t>')
    send_command('bind ^numpad1 input /ws "Flash Nova" <t>')
	
	send_command('lua l gearinfo')
	
    select_default_macro_book()
    set_lockstyle()
end

function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
    send_command('unbind ^,')
    send_command('unbind !.')
    send_command('unbind @c')
    send_command('unbind @w')
    send_command('unbind ^numpad7')
    send_command('unbind ^numpad8')
    send_command('unbind ^numpad9')
    send_command('unbind ^numpad6')
    send_command('unbind ^numpad1')
end


-- Define sets and vars used by this job file.
function init_gear_sets()

	sets.TH = {
		--ammo="Per. Lucky Egg",
		legs={ name="Merlinic Shalwar", augments={'"Cure" potency +2%','MND+8','"Treasure Hunter"+1','Accuracy+14 Attack+14',}},
		feet={ name="Merlinic Crackows", augments={'Crit.hit rate+1','Pet: "Mag.Atk.Bns."+18','"Treasure Hunter"+2','Accuracy+12 Attack+12','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
		waist="Chaac Belt",
	
	}
    ------------------------------------------------------------------------------------------------
    ----------------------------------------- Precast Sets -----------------------------------------
    ------------------------------------------------------------------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
    sets.precast.JA['Full Circle'] = {head="Azimuth Hood +3"}
    sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +3", back="Nantosuelta's Cape"}
  
    -- Fast cast sets for spells
    
    sets.precast.FC = {
    --  /RDM --15
        main="Idris",
        sub="Genbu's Shield", 
		range="Dunna", --3
		head=gear.Merlinic.Head_HRTLSS_FC, --15
		body=gear.Merlinic.Body_HRTLSS_FC, --12
		hands=gear.Merlinic.Hands_HRTLSS_FC, --7
		legs="Geomancy Pants +3", --15
		feet=gear.Merlinic.Feet_HRTLSS_FC, --11
		neck="Loricate Torque +1",  
		waist="Embla Sash", --5
		left_ear="Tuisto Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Defending Ring",
		right_ring="Kishar Ring",
		back="Lifestream Cape", --7
        } --total = 79


    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
        waist="Siegel Sash",
        })
        
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        hands="Bagua Mitaines +1",
		right_ear="Barkarole Earring",
        })

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        sub="Genbu's Shield",
		right_ear="Mendi. Earring", --5
        --left_ring="Lebeche Ring", --(2)
        })

    sets.precast.FC.Curaga = sets.precast.FC.Cure
    
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {
		head=empty, 
		body="Twilight Cloak"
		})
	
	sets.precast.FC['Dispelga'] = set_combine(sets.precast.FC, {
		main="Daybreak",
		})

     
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
        neck="Sanctity Necklace",
		waist="Eschan Stone",
        left_ear="Ishvara Earring",
        right_ear="Regal Earring",
        right_ring="Shukuyu Ring",
        back=gear.GEOcape.HRTLSS_MACCDMG,
        }

    
    ------------------------------------------------------------------------
    ----------------------------- Midcast Sets -----------------------------
    ------------------------------------------------------------------------
    
    -- Base fast recast for spells
    sets.midcast.FastRecast = {
	
        } -- Haste
    
   sets.midcast.Geomancy = {
        main="Idris",
        sub="Genbu's Shield",
        range="Dunna",
        head="Azimuth Hood +3",
        body="Azimuth Coat +3",
        hands="Azimuth Gloves +2",
        legs="Azimuth Tights +3",
        feet="Azimuth Gaiters +3",
        neck="Bagua Charm +2",
		left_ear="Tuisto Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Defending Ring", 
		right_ring="Freke Ring",
        back="Lifestream Cape",
        }
    
    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
        legs="Bagua Pants +3",
        })

    sets.midcast.Cure = {
		main="Daybreak", --30
		sub="Ammurapi Shield", 
		--[[head="Vanya Hood", --10
		body="Vanya Robe", 
		hands="Vanya Cuffs", 
		legs="Vanya Slops", 
		feet="Vanya Clogs", ]]
		neck="Incanter's Torque", 
		waist="Bishop's Sash",
		left_ear="Mendi. Earring", --5
		right_ear="Lugalbanda Earring",
		left_ring="Defending Ring", 
		right_ring="Menelaus's Ring", --5
		--total curePOT = 50
        }

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {
        --neck="Nuna Gorget +1",
        --left_ring="Levia. Ring +1",
        --right_ring="Levia. Ring +1",
        })

    sets.midcast.Cursna = set_combine(sets.midcast.Cure, {
        sub="Genbu's Shield",
       -- head="Vanya Hood",
       -- body="Vanya Robe",
       -- hands="Hieros Mittens",
       -- feet="Vanya Clogs",
        neck="Malison Medallion",
        left_ear="Beatific Earring",
        right_ear="Healing Earring",
        left_ring="Haoma's Ring",
        right_ring="Menelaus's Ring",
        })

    sets.midcast['Enhancing Magic'] = {
        main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','VIT+3','Mag. Acc.+7','DMG:+13',}},
        sub="Ammurapi Shield",
        head="Befouled Crown",
        body=gear.Telchine.Body_durHRT,
        hands=gear.Telchine.Hands_durHRT,
        legs=gear.Telchine.Legs_durHRT,
        feet=gear.Telchine.Feet_durHRT,
		neck="Incanter's Torque",
		waist="Embla Sash",
		--[[left_ear="Mimir Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",]]
		back="Perimede Cape",
        --back="Fi Follet Cape +1",
        }
        
    sets.midcast.EnhancingDuration = set_combine(sets.midcast['Enhancing Magic'], {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +4','VIT+3','Mag. Acc.+7','DMG:+13',}},
        sub="Ammurapi Shield",
        head=gear.Telchine.Head_durHRT,
        body=gear.Telchine.Body_durHRT,
        hands=gear.Telchine.Hands_durHRT,
        legs=gear.Telchine.Legs_durHRT,
        feet=gear.Telchine.Feet_durHRT,
		waist="Embla Sash",
        })

    sets.midcast.Regen = set_combine(sets.midcast.EnhancingDuration, {
        main="Bolelabunga",
        sub="Ammurapi Shield",
        })
    
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration, {
        --head="Amalric Coif",
        --waist="Gishdubar Sash",
        --back="Grapevine Cape",
        })

    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration, {
		head=gear.Merlinic.Head_HRTLSS_PHLX,
		hands=gear.Merlinic.Hands_HRTLSS_PHLX, 
		feet=gear.Merlinic.Feet_HRTLSS_PHLX,
        })
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        --legs="Haven Hose",
        --neck="Nodens Gorget",
        waist="Siegel Sash",
		--left_ear="Earthcry Earring",
        })

    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration, {
        main="Vadose Rod",
        --head="Amalric Coif",
        waist="Emphatikos Rope",
        })

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
        left_ring="Sheltered Ring",
        })
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = sets.midcast.Protect
    sets.midcast.Shellra = sets.midcast.Protect


    sets.midcast.MndEnfeebles = {
        main="Daybreak",
        sub="Ammurapi Shield",
		--ammo="Pemphredo Tathlum",		
		head="Azimuth Hood +3",
		body="Nyame Mail",
		hands="Geomancy Mitaines +3",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Defending Ring",
		right_ring="Stikini Ring",
		back=gear.GEOcape.HRTLSS_MACCDMG,
		--back="Aurist's Cape +1",
        } -- MND/Magic accuracy
    
    sets.midcast.IntEnfeebles = set_combine(sets.midcast.MndEnfeebles, {
        --back="Nantosuelta's Cape",
        }) -- INT/Magic accuracy
		
	sets.midcast['Dispelga'] = set_combine(sets.midcast.IntEnfeebles, {
		main="Daybreak",
		})
	sets.midcast['Dia'] = sets.TH
	sets.midcast['Dia II'] = sets.TH
	sets.midcast['Diaga'] = sets.TH

    sets.midcast['Dark Magic'] = {
        main="Daybreak",
        sub="Ammurapi Shield",
		--ammo="Pemphredo Tathlum",
		head="Geomancy Galero +3", 
		body="Geomancy Tunic +3",
		hands="Geomancy Mitaines +3",
		legs="Geomancy Pants +3",
		feet="Geomancy Sandals +3",
		neck="Erra Pendant",
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
        back=gear.GEOcape.HRTLSS_MACCDMG,
        }
    
    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
        head="Bagua Galero +1",
        --left_ear="Hirudinea Earring",
        --right_ring="Evanescence Ring",
        --waist="Fucho-no-obi",  
        })
    
    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
        --feet="Regal Pumps +1"
        })

    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
		--ammo="Pemphredo Tathlum",
		--head="Ea Hat",
		--head="Azimuth Hood +3",
		head="Agwu's Cap",
		body="Azimuth Coat +3",
		--body="Geomancy Tunic +3",
		--hands="Azimuth Gloves +2",
		hands="Agwu's Gages",
		legs="Azimuth Tights +3",
        --feet="Azimuth Gaiters +3",
		feet="Agwu's Pigaches",
		neck="Bagua Charm +2",
		waist="Eschan Stone",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
        left_ring="Freke Ring",
        right_ring="Stikini Ring",
        back=gear.GEOcape.HRTLSS_MACCDMG,
        }

    sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
--[[  
        hands="Ea Cuffs",
        feet="Jhakri Pigaches +2",
        neck="Erra Pendant",
        back="Aurist's Cape +1",
        waist="Yamabuki-no-Obi",  ]]
        })

    sets.midcast.GeoElem = set_combine(sets.midcast['Elemental Magic'], {
	--[[
		head="Mallquis Chapeau +1",
		body="Mallquis Saio +2",
		hands="Mallquis Cuffs +1",
		legs="Mallquis Trews +2",
		feet="Mallquis Clogs +2",
        --left_ring="Fenrir Ring +1",
        --right_ring="Fenrir Ring +1", ]]
        })

    sets.midcast['Elemental Magic'].Seidr = set_combine(sets.midcast['Elemental Magic'], {
 --[[  
        body="Seidr Cotehardie",
        hands="Ea Cuffs",
        legs=gear.Merlinic_MAcc_legs,
        feet="Jhakri Pigaches +2",
        neck="Sanctity Necklace",   ]]
        })

    sets.midcast.GeoElem.Seidr = set_combine(sets.midcast['Elemental Magic'].Seidr, {
 --[[       
		main="Solstice",
        sub="Culminus",        
        body="Seidr Cotehardie",
        hands="Ea Cuffs",
        neck="Erra Pendant",
        left_ring="Fenrir Ring +1",
        right_ring="Fenrir Ring +1",    ]]
        })

	sets.midcast['Elemental Magic'].MagicBurst = { 
		
	}		
		
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {
        head=empty,
        body="Twilight Cloak",
        right_ring="Archon Ring",
        })

    -- Initializes trusts at iLvl 119
    sets.midcast.Trust = sets.precast.FC

    ------------------------------------------------------------------------------------------------
    ------------------------------------------ Idle Sets -------------------------------------------
    ------------------------------------------------------------------------------------------------

    sets.idle = {
        main="Idris",
        sub="Genbu's Shield",
        ranged="Dunna",
        head="Befouled Crown",
        body="Geomancy Tunic +3",
        hands="Bagua Mitaines +1",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
		--[[
		head="Nyame Helm",
		body="Nyame Mail",
		--body="Geomancy Tunic +3",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		]]
		neck="Loricate Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Tuisto Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Defending Ring", 
		right_ring="Shneddick Ring",
        back=gear.GEOcape.HRTLSS_MEVA,
        }
    
    sets.resting = set_combine(sets.idle, {
        --main="Chatoyant Staff",
        --waist="Shinjutsu-no-Obi +1",
        })

    sets.idle.DT = set_combine(sets.idle, {
		head="Azimuth Hood +3",
		body="Nyame Mail",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
        })

    sets.idle.Weak = sets.idle.DT

    -- .Pet sets are for when- Luopan is present.
    sets.idle.Pet = { 
        -- Pet: -DT (37.5% to cap) / Pet: Regen 
        main="Idris", --25/0
        sub="Genbu's Shield", --0/0
        range="Dunna", --5/0
		head="Geo. Galero +3",
        hands="Geo. Mitaines +3", --11/0
		legs="Nyame Flanchard",
        feet="Nyame Sollerets",
		neck="Bagua Charm +2",
		waist="Isa Belt", --3/1
		left_ear="Tuisto Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Defending Ring", 
		right_ring="Shneddick Ring",
        back=gear.GEOcape.HRTLSS_MEVA, --0/10
        }

    sets.idle.DT.Pet = set_combine(sets.idle.Pet, {
		head="Azimuth Hood +3",
		body="Nyame Mail",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
        })

    -- .Indi sets are for when an Indi-spell is active.
--    sets.idle.Indi = set_combine(sets.idle, {legs="Bagua Pants +1"})
--    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {legs="Bagua Pants +1"})
--    sets.idle.DT.Indi = set_combine(sets.idle.DT, {legs="Bagua Pants +1"})
--    sets.idle.DT.Pet.Indi = set_combine(sets.idle.DT.Pet, {legs="Bagua Pants +1"})

    sets.idle.Town = set_combine(sets.idle, {

        })
        
    -- Defense sets

    sets.defense.PDT = sets.idle.DT
    sets.defense.MDT = sets.idle.DT

    sets.Kiting = {
        }
		
	sets.Entrust = {
		main={ name="Gada", augments={'Indi. eff. dur. +11','MND+6','Mag. Acc.+4',}},
		}

    sets.latent_refresh = {
        waist="Fucho-no-obi"
        }
    
    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
sets.engaged = {   
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Cornelia's Belt",
        }


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.magic_burst = {
		ammo="Pemphredo Tathlum",
		head="Ea Hat",
		body=gear.Merlinic.Body_MAB,
		hands="Ea Cuffs",
		legs=gear.Merlinic.Legs_Burst,
		feet=gear.Merlinic.Feet_Burst,
		neck="Mizu. Kubikazari",
		left_ear="Friomisi Earring",
		right_ear="Barkaro. Earring",
		left_ring="Shiva Ring",
		right_ring="Mujin Band",
        back="Seshaw Cape", --5
        }

    sets.buff.Doom = {left_ring="Eshmun's Ring", right_ring="Eshmun's Ring", waist="Gishdubar Sash"}

    sets.Obi = {waist="Hachirin-no-Obi"}
    sets.CP = {back="Mecisto. Mantle"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.name == 'Impact' then
        equip(sets.precast.FC.Impact)
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then 
        if state.MagicBurst.value then
            equip(sets.magic_burst)
            if spell.english == "Impact" then
                equip(sets.midcast.Impact)
            end
        end
        if (spell.element == world.day_element or spell.element == world.weather_element) then
            equip(sets.Obi)
        end
    end
	if buffactive['Entrust'] and string.find(spell.english,'Indi') then
		equip(sets.Entrust)
	end
    if spell.skill == 'Enhancing Magic' and classes.NoSkillSpells:contains(spell.english) then
        equip(sets.midcast.EnhancingDuration)
        if spellMap == 'Refresh' then
            equip(sets.midcast.Refresh)
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            --send_command('@timers d "'..indi_timer..'"')
            --indi_timer = spell.english
            --send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.skill == 'Elemental Magic' then
 --           state.MagicBurst:reset()
        end
        if spell.english == "Sleep II" then
            send_command('@timers c "Sleep II ['..spell.target.name..']" 90 down spells/00259.png')
        elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
            send_command('@timers c "Sleep ['..spell.target.name..']" 60 down spells/00253.png')
        end 
		if spell.english == "Dia II" then
			send_command('wait 6; input /ma distract <bt>')
		end
		
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end

    if buff == "doom" then
        if gain then           
            equip(sets.buff.Doom)
            send_command('@input /p Doomed.')
            disable('left_ring','right_ring','waist')
        else
            enable('left_ring','right_ring','waist')
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

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        elseif spell.skill == 'Elemental Magic' then
            if spellMap == 'GeoElem' then
                return 'GeoElem'
            end
        end
    end
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

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'nuke' then
        handle_nuking(cmdParams)
        eventArgs.handled = true
    end
	
   gearinfo(cmdParams, eventArgs)

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 10)
end

function set_lockstyle()
    send_command('wait 6; input /lockstyleset 40')
end