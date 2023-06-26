/// @description Insert description here
// You can write your code in this editor
menu_move_direction = scr_is_movement_key_pressed(MovementKey.Down) - scr_is_movement_key_pressed(MovementKey.Up)

if (debounce_timer <= 0 && menu_move_direction != 0) {
	menu_index += menu_move_direction
	// Reset debounce timer
    debounce_timer = global.GP_MENU_DEBOUNCE_TIME;
}

if(menu_index < 0) {
	menu_index = array_length(buttons) - 1
}else if(menu_index > array_length(buttons) -1){
	menu_index = 0
}
//if(menu_index != last_selected_menu_item){ 
//	audio_play_sound(snd_menu_switch, 1, false)	
//}
last_selected_menu_item = menu_index
i = 0
repeat(array_length(buttons)) {
	if(buttons[i] == undefined){
		i++;
		continue;
	}
	buttons[i].selected = menu_index == i
	i++;
}

// Update debounce timer
debounce_timer -= (delta_time / 1000000);