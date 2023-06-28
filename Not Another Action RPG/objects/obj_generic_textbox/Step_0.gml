/// @description Insert description here
// You can write your code in this editor

move_direction = scr_is_movement_key_pressed(MovementKey.Left) - scr_is_movement_key_pressed(MovementKey.Right)

if (debounce_timer <= 0 && move_direction != 0) {
	if(move_direction < 0 && currentPage < maxPages - 1) {
		self.next_page();
	}else if (move_direction > 0 && currentPage > 0){
		self.previous_page();
	}
	// Reset debounce timer
    debounce_timer = global.GP_MENU_DEBOUNCE_TIME;
}

// Update debounce timer
debounce_timer -= (delta_time / 1000000);