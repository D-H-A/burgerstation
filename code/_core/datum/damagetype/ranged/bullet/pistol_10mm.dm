/damagetype/ranged/bullet/pistol_10mm
	name = "pistol bullet"
	id = "10mm"

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		BLUNT = DAMAGE_D,
		PIERCE = DAMAGE_C
	)

	//How much armor to penetrate. It basically removes the percentage of the armor using these values.
	attack_damage_penetration = list(
		BLUNT = ARMOR_D,
		PIERCE = ARMOR_D
	)