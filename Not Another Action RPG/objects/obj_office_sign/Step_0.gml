/// @description Insert description here
// You can write your code in this editor

var didHitConfirmKey = scr_is_action_key_pressed(ActionInput.Confirm)

if((!didHitConfirmKey && isActive) 
|| (!collision_rectangle(x, y, x+sprite_width, y+sprite_height, obj_player, false, true) && isActive)) {
	exit
}

if(isActive){
	isActive = false
	textbox.text = areLightsOn ? "Test Room" : "Hmm... It's too dark to make out the sign";
	textbox.width = string_width(textbox.text)
	textbox.reinitContent()
	global.textbox_open = true
	textbox.visible = true
}else{
	timeToDismissTb -= delta_time / 1000000;
}

if(timeToDismissTb <= 0 && textbox != undefined){
	textbox.visible = false
	isActive = true
	timeToDismissTb = 2
	global.textbox_open = false
	if(didTriggerSignCallback || !areLightsOn){
		exit
	}
	with(obj_new_game_cutscene){
		self.onTestRoomSignTriggered()
		other.didTriggerSignCallback = true
	}
}
