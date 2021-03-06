var/global/list/all_areas = list()


/area/
	name = "AREA ERROR"
	id = null
	icon = 'icons/area/area.dmi'
	icon_state = ""
	layer = LAYER_AREA
	plane = PLANE_AREA
	invisibility = 101

	mouse_opacity = 0

	var/flags_area = FLAG_AREA_NONE

	var/sound_environment = ENVIRONMENT_GENERIC

	var/map_color_r = rgb(255,0,0,255)
	var/map_color_g = rgb(0,255,0,255)
	var/map_color_b = rgb(0,0,255,255)
	var/map_color_a = rgb(0,0,0,255)

	var/dynamic_lighting_overlay_color = FALSE
	var/list/lighting_overlay_color_day = LIGHTING_BASE_MATRIX
	var/list/lighting_overlay_color_night = LIGHTING_BASE_MATRIX

	var/ambient_sound
	var/list/random_sounds = list()
	var/list/tracks = list()

	var/level_multiplier = 1 //Adjust the level multiplier for mobs that spawn here using spawners.

	var/area_light_power = 0

	var/list/mob/living/advanced/player/players_inside

	var/hazard //The id of the hazard

	var/sunlight_freq = 0

	desired_light_range = 0
	desired_light_power = 0
	desired_light_color = 0

	//var/assoc_wishgranter //The wishgranter ID this is area is associated with, if any.

	var/weather = WEATHER_NONE //Optional weather

	var/ambient_temperature = T0C + 20

	var/cheese_type = "processed_cheese"

	var/turf/destruction_turf //The destruction turf of the area, if any.

	var/list/turf/sunlight_turfs = list()

	var/is_space = FALSE


/area/New()
	. = ..()

	if(hazard)
		all_areas_with_hazards += src

	/*
	if(dynamic_lighting_overlay_color)
		all_areas_with_dynamic_lighting_overlay_color += src
	*/

	if(!all_areas[type])
		all_areas[type] = src

	return .


/area/Destroy()
	if(players_inside)
		players_inside.Cut()

	if(sunlight_turfs)
		sunlight_turfs.Cut()

	return ..()

/area/proc/update_lighting_overlay_color(var/desired_color)

	for(var/turf/T in contents)
		if(T.lighting_overlay)
			T.lighting_overlay.color = desired_color

	return TRUE

/area/Initialize()

	if(sunlight_freq > 0 && desired_light_range && desired_light_power && desired_light_color)

		var/light_count = 0

		for(var/turf/simulated/T in contents)
			if(setup_sunlight(T))
				light_count++

		LOG_DEBUG("Initialized Area \"[name]\" with [light_count] sun lights.")

	if(weather)
		icon = 'icons/area/weather.dmi'
		icon_state = weather

	return ..()

/area/proc/setup_sunlight(var/turf/T)

	if((T.x % sunlight_freq) || (T.y % sunlight_freq))
		return FALSE

	T.set_light(sunlight_freq+1,desired_light_power,desired_light_color)

	return TRUE

/area/Entered(var/atom/movable/enterer,var/atom/old_loc)

	if(is_player(enterer))

		var/mob/living/advanced/player/P = enterer

		/*
		if(safe)
			P.spawn_protection = SECONDS_TO_DECISECONDS(SPAWN_PROTECTION_TIME)
		*/

		if(!players_inside)
			players_inside = list()

		if(!(enterer in players_inside))
			players_inside += enterer

		if(flags_area & FLAGS_AREA_SINGLEPLAYER)
			P.see_invisible = INVISIBILITY_NO_PLAYERS

	if(ismob(enterer))
		var/mob/M = enterer
		if(M.client && length(tracks) && (!M.client.next_music_track || M.client.next_music_track <= world.time))
			play_music_track(pick(tracks),M.client)

	if(enterer.area != src)
		if(ismob(enterer) && !is_observer(enterer))
			var/mob/M = enterer
			if(M.client)
				if(ambient_sound && (!enterer.area || enterer.area.ambient_sound != ambient_sound))
					play_ambient_sound(ambient_sound,list(enterer),environment = sound_environment,loop = TRUE)
			/*
			if(is_player(enterer) && enterer.area)
				var/mob/living/advanced/player/P = M
				if(enterer.area.safe && !src.safe) //Leaving a safezone
					P.to_chat(span("notice","You are leaving a safezone. You will be protected for an additional [SPAWN_PROTECTION_TIME] seconds before being able to attack and be attacked again."))
				else if(!enterer.area.safe && src.safe) //Entering a safezone
					P.to_chat(span("notice","You are now entering a safezone. You cannot attack or be attacked by others in this area."))
					if(assoc_wishgranter)
						var/savedata/client/mob/U = P.mobdata
						U.save_current_character()
			*/

		enterer.area = src

		return TRUE

	return FALSE

/area/Exited(var/atom/movable/exiter,var/atom/old_loc)

	if(is_player(exiter))
		var/mob/living/advanced/player/P = exiter
		if(players_inside)
			players_inside -= exiter
		if(flags_area & FLAGS_AREA_SINGLEPLAYER)
			P.see_invisible = initial(P.see_invisible)

	return TRUE