enum MovementKey {
	Up,
	Down,
	Left,
	Right
}


function scr_is_movement_key_pressed(key){
	var isPressed = false;
	if(scr_is_gamepad_connected()){
		switch(key){
			case MovementKey.Up:
				var vaxis = gamepad_axis_value(0, gp_axislv);
				isPressed = gamepad_button_check_pressed(0, gp_padu) || vaxis < -0.2;
				break;
			case MovementKey.Down:
				var vaxis = gamepad_axis_value(0, gp_axislv);
				isPressed = gamepad_button_check_pressed(0, gp_padd) || vaxis > 0.2;
				break;
			case MovementKey.Left:
				isPressed = gamepad_button_check_pressed(0, gp_padl);
				break;
			case MovementKey.Right:
				isPressed = gamepad_button_check_pressed(0, gp_padr);
				break;
		}
	}
	
	if(isPressed){
		return true;
	}
	
	switch(key){
		case MovementKey.Up:
			return keyboard_check_pressed(vk_up);
		case MovementKey.Down:
			return keyboard_check_pressed(vk_down);
		case MovementKey.Left:
			return keyboard_check_pressed(vk_left);
		case MovementKey.Right:
			return keyboard_check_pressed(vk_right);
		default:
			return false;
	}
}

function scr_is_gamepad_connected() {
	var gp_num = gamepad_get_device_count();
	if(gp_num < 0) {
		return false;
	}
	return gamepad_is_connected(0);
}