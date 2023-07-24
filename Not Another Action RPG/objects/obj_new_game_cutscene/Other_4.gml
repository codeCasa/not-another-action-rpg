/// @description Insert description here
// You can write your code in this editor

with(obj_player){
	objName = "???"
	if(instance_exists(obj_spotlight)) {
		obj_spotlight.spotlightTarget = self
	}
}
global.is_cut_scene_active = true
didRoomStart = true