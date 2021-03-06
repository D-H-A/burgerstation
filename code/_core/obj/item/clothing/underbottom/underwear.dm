/obj/item/clothing/underbottom/underwear
	name = "underwear"

	size = SIZE_1
	weight = WEIGHT_0

/obj/item/clothing/underbottom/underwear/boxers
	name = "boxers"
	icon = 'icons/obj/items/clothing/underwear/boxers_new.dmi'
	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	defense_rating = list(
		MAGIC = ARMOR_D,
		COLD = ARMOR_D,
	)

/obj/item/clothing/underbottom/underwear/boxers/random/on_spawn()
	color = random_color()
	return ..()

/obj/item/clothing/underbottom/underwear/boxers/security
	name = "security boxers"
	color = COLOR_SECURITY


/obj/item/clothing/underbottom/underwear/boxers/engineering
	name = "engineering boxers"
	color = COLOR_ENGINEERING

/obj/item/clothing/underbottom/underwear/boxers/medical
	name = "medical boxers"
	color = COLOR_MEDICAL

/obj/item/clothing/underbottom/underwear/boxers/heart
	name = "heart boxers"
	icon = 'icons/obj/items/clothing/underwear/heart_boxers.dmi'

/obj/item/clothing/underbottom/underwear/long_johns
	name = "long johns"
	icon = 'icons/obj/items/clothing/underwear/long_john.dmi'
	flags_clothing = FLAG_CLOTHING_NOBEAST_FEET

	rarity = RARITY_UNCOMMON

	defense_rating = list(
		MAGIC = ARMOR_D,
		HEAT = -ARMOR_C,
		COLD = ARMOR_B,
	)

/obj/item/clothing/underbottom/underwear/long_johns/grey
	color = "#888888"

/obj/item/clothing/underbottom/underwear/panty
	icon = 'icons/obj/items/clothing/underwear/panty.dmi'

	defense_rating = list(
		MAGIC = ARMOR_C,
		COLD = ARMOR_E,
	)


/obj/item/clothing/underbottom/underwear/panty/pink
	color = "#ff66ff"

/obj/item/clothing/underbottom/underwear/panty/brown
	color = "#603A20"

/obj/item/clothing/underbottom/underwear/panty/red
	color = "#C60000"

/obj/item/clothing/underbottom/underwear/panty/random/on_spawn()
	color = random_color()
	return ..()

/obj/item/clothing/underbottom/underwear/thong
	name = "thong"
	icon = 'icons/obj/items/clothing/underwear/thong.dmi'
	color = COLOR_WHITE
	defense_rating = list(
		BLADE = -ARMOR_E,
		BLUNT = -ARMOR_E,
		PIERCE = -ARMOR_E,
		MAGIC = ARMOR_C,
		COLD = ARMOR_E,
	)

/obj/item/clothing/underbottom/underwear/loincloth
	name = "loincloth"
	icon = 'icons/obj/items/clothing/underwear/loincloth.dmi'

	defense_rating = list(
		MAGIC = ARMOR_C
	)


/obj/item/clothing/underbottom/underwear/loincloth/brown
	color = "#603A20"

/obj/item/clothing/underbottom/underwear/loincloth/red
	color = "#8E0000"

