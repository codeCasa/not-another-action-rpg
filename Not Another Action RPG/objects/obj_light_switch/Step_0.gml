/// @description Insert description here
// You can write your code in this editor

var didHitConfirmKey = scr_is_action_key_pressed(ActionInput.Confirm)

if((!didHitConfirmKey && isActive) 
|| (!collision_rectangle(x, y, x+sprite_width, y+sprite_height, obj_player, false, true) && isActive)) {
	exit
}

if(isActive){
	isActive = false
	var guiWidth = display_get_gui_width();
	var guiHeight = display_get_gui_height();
	textbox.x = (x / room_width) * guiWidth;
	textbox.y = ((y + 10) / room_height) * guiHeight;
	textbox.visible = true
}else{
	timeToDismissTb -= delta_time / 1000000;
}

if(timeToDismissTb <= 0 && textbox != undefined){
	textbox.visible = false
	instance_destroy(textbox)
	instance_destroy(obj_spotlight)
	textbox = undefined
}
