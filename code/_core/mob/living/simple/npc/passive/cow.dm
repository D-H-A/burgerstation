/mob/living/simple/npc/passive/cow
	name = "cow"
	icon_state = "cow"
	damage_type = "cow_headbutt"
	class = "cow"
	loot_drop = "cow"

/mob/living/simple/npc/passive/cow/post_death()
	..()
	icon_state = "[initial(icon_state)]_dead"
	update_sprite()