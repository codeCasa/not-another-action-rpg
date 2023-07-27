/// @description Insert description here
// You can write your code in this editor

var didHitConfirmKey = scr_is_action_key_pressed(ActionInput.Confirm)

if((!didHitConfirmKey && isActive) 
|| (!collision_rectangle(x, y, x+sprite_width, y+sprite_height, obj_player, false, true) && isActive)) {
	exit
}

if(isActive){
	isActive = false
	textbox.visible = true
}else{
	timeToDismissTb -= delta_time / 1000000;
}

if(timeToDismissTb <= 0 && textbox != undefined){
	textbox.visible = false
	isActive = true
	if(didTriggerSignCallback){
		exit
	}
	with(obj_new_game_cutscene){
		self.onTestRoomSignTriggered()
		other.didTriggerSignCallback = true
	}
}
