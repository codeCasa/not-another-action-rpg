enum ActionInput {
	Confirm,
}

function scr_is_action_key_pressed(input){
	var isPressed = false
	
	if(scr_is_gamepad_connected()){
		switch(input){
			case ActionInput.Confirm:
				isPressed = gamepad_button_check_pressed(0, gp_face1)
				break;
		}
	}
	
	if(isPressed){
		return true
	}
	
	switch(input){
		case ActionInput.Confirm:
			return keyboard_check_pressed(vk_enter);
		default:
			return false;
	}
}