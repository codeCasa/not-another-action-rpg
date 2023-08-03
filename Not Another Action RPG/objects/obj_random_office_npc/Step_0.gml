/// @description Insert description here
// You can write your code in this editor

event_inherited()


var actionKey = scr_is_action_key_pressed(ActionInput.Confirm)

if(!actionKey || isShowingMessageAlready){
	exit
}