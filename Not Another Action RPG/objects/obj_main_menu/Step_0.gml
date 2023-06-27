/// @description Insert description here
// You can write your code in this editor
menu_move_direction = scr_is_movement_key_pressed(MovementKey.Down) - scr_is_movement_key_pressed(MovementKey.Up)
var isActionPressed = scr_is_action_key_pressed(ActionInput.Confirm)
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
for(var i = 0; i < array_length(buttons); i++) {
	if(buttons[i] == undefined){
		continue;
	}
	buttons[i].selected = menu_index == i
	if(buttons[i].selected && isActionPressed && buttons[i].execute != undefined){
		buttons[i].execute();
	}
}

// Update debounce timer
debounce_timer -= (delta_time / 1000000);