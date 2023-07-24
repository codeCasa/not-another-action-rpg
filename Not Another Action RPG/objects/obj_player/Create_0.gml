/// @description Insert description here
// You can write your code in this editor
event_inherited()
is_player = true
faction = Faction.Player
timeCreated = date_current_datetime()
originalGravity = playerGravity
sprite_index = spr_player_idle;
image_index = 0;
walkSpeed *= 2
image_speed *= 2
active_image_speed = image_speed