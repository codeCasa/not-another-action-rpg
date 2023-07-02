/// @description Insert description here
// You can write your code in this editor
menu_move_direction = scr_is_movement_key_pressed(MovementKey.Down) - scr_is_movement_key_pressed(MovementKey.Up)
var isActionPressed = scr_is_action_key_pressed(ActionInput.Confirm)

if (debounce_timer <= 0 && menu_move_direction != 0) {
	selectedIndex += menu_move_direction
	// Reset debounce timer
    debounce_timer = global.GP_MENU_DEBOUNCE_TIME;
}

if(selectedIndex < 0) {
	selectedIndex = array_length(choices) - 1
}else if(selectedIndex > array_length(choices) -1){
	selectedIndex = 0
}
//if(menu_index != last_selected_menu_item){ 
//	audio_play_sound(snd_menu_switch, 1, false)	
//}

if(isActionPressed && self.onSelected) {
	self.onSelected(selectedIndex, choices[selectedIndex])
}

// Update debounce timer
debounce_timer -= (delta_time / 1000000);