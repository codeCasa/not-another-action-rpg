/// @description Insert description here
// You can write your code in this editor

move_direction = scr_is_movement_key_pressed(MovementKey.Left) - scr_is_movement_key_pressed(MovementKey.Right)
var isConfirmPressed = scr_is_action_key_pressed(ActionInput.Confirm)

if (debounce_timer <= 0 && move_direction != 0) {
	selectedChoice += move_direction
	// Reset debounce timer
    debounce_timer = global.GP_MENU_DEBOUNCE_TIME;
}

if(selectedChoice < 0) {
	selectedChoice = array_length(choices) - 1
}else if(selectedChoice > array_length(choices) - 1){
	selectedChoice = 0
}

if(isConfirmPressed && self.onSelected != undefined) {
	self.onSelected(selectedChoice, choices[selectedChoice])
}

// Update debounce timer
debounce_timer -= (delta_time / 1000000);