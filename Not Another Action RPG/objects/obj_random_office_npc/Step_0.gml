/// @description Insert description here
// You can write your code in this editor

event_inherited()

if(!visible){
	exit;
}

if(!scr_is_object_within_distance_of(self, obj_player, 50)){
	exit;
}


var actionKey = scr_is_action_key_pressed(ActionInput.Confirm)

if(!actionKey || isShowingMessageAlready){
	exit
}

self.myTargettedSpeechBox.visible = true
isShowingMessageAlready = true