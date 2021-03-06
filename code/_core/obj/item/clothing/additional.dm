/obj/item/clothing/proc/equip_additional_clothing(var/mob/living/advanced/caller,var/atom/object,location,control,params)

	if(!length(additional_clothing))
		return FALSE

	for(var/k in additional_clothing)
		if(k in caller.worn_objects)
			continue
		var/obj/item/clothing/C = new k(get_turf(src))
		C.delete_on_drop = TRUE
		C.should_save = FALSE
		C.color = color
		C.weight = 0
		C.size = 0
		if(!C.quick_equip(caller))
			caller.to_chat(span("notice","There is no way to toggle \the [C.name]!"))
			qdel(C)
			continue
		additional_clothing_stored += C

	return TRUE


/obj/item/clothing/proc/delete_additonal_clothing()

	for(var/obj/item/clothing/C in additional_clothing_stored)
		additional_clothing_stored -= C
		qdel(C)

	return TRUE