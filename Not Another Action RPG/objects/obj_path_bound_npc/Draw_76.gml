/// @description Insert description here
// You can write your code in this editor
if(did_start_path || npc_path == undefined || !visible){
	exit
}
path_start(npc_path, path_speed, path_action_restart, true)
path_position = 0
did_start_path = true