/*
		var/obj/overlay/spawned_overlay = new /obj/overlay
		spawned_overlay.layer = LAYER_EFFECT
		spawned_overlay.icon = 'icons/mob/living/advanced/overlays/talk.dmi'
		if(is_typing)
			spawned_overlay.icon_state = "talking"
		else
			spawned_overlay.icon_state = talk_type

		add_overlay(spawned_overlay)
*/


/mob/living/advanced/proc/do_type(var/type_type)
	talk_duration = SECONDS_TO_DECISECONDS(4)
	chat_overlay.alpha = 255
	chat_overlay.icon_state = type_type

/mob/living/advanced/proc/start_typing()
	is_typing = TRUE
	chat_overlay.alpha = 255
	chat_overlay.icon_state = "talking"

/mob/living/advanced/proc/end_typing()
	is_typing = FALSE
	chat_overlay.alpha = 0
