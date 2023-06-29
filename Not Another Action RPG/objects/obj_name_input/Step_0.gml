/// @description Insert description here
// You can write your code in this editor
move_direction_y = scr_is_movement_key_pressed(MovementKey.Down) - scr_is_movement_key_pressed(MovementKey.Up)
move_direction_x = scr_is_movement_key_pressed(MovementKey.Left) - scr_is_movement_key_pressed(MovementKey.Right)
var isActionPressed = scr_is_action_key_pressed(ActionInput.Confirm)
if (debounce_timer <= 0 && (move_direction_x != 0 || move_direction_y != 0)) {
	if(self.isSelectingConfirmationOptions){
		if(move_direction_x != 0) {
			self.isSelectingConfirmationOptions = !self.isSelectingConfirmationOptions
		}
		selectedConfirmationOption += move_direction_y
	}else{
		selected_char[0]-= move_direction_x
		selected_char[1]+= move_direction_y
	}
	// Reset debounce timer
    debounce_timer = global.GP_MENU_DEBOUNCE_TIME;
}

if(selected_char[0] > columns - 1 || (selected_char[1] == rows - 1 && selected_char[0] > 3)){
	self.isSelectingConfirmationOptions = !self.isSelectingConfirmationOptions
	selected_char[0] = 0
}else if(selected_char[0] < 0) {
	self.isSelectingConfirmationOptions = !self.isSelectingConfirmationOptions
	selected_char[0] = columns - 1
	if(selected_char[1] == rows -1){
		selected_char[0] = 3
	}
}

if(!self.isSelectingConfirmationOptions){
	if(selected_char[1] > rows - 1){
		selected_char[1] = 0
	}else if(selected_char[1] < 0) {
		selected_char[1] = rows - 1
	}
}else{
	if(selectedConfirmationOption > array_length(confirmationOptions) - 1) {
		selectedConfirmationOption = 0
	}else if(selectedConfirmationOption < 0) {
		selectedConfirmationOption = array_length(confirmationOptions) - 1
	}
}

if(isActionPressed){
	if(self.isSelectingConfirmationOptions){
		if(self.onFinish != undefined){
			self.onFinish(self.selectedConfirmationOption == 0, self.selectedCharacters)
		}
	}else{
		var char = self.find_character_in_grid(selected_char[0], selected_char[1])
		self.update_selected_characters_with_char(char)
	}
}


// Update debounce timer
debounce_timer -= (delta_time / 1000000);