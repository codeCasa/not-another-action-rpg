/// @description Take Damage Event
if(deathSnd != undefined) {
	audio_play_sound(deathSnd, 1, false)
}

if(deathSprIndex != undefined) {
	sprite_index = deathSprIndex
	image_speed = (1/sprite_get_number(sprite_index))
}
isDying = true