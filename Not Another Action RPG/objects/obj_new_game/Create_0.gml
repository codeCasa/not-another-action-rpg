/// @description Insert description here
// You can write your code in this editor
inputBox = instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_name_input)
inputBox.hintText = "Enter your name"
inputBox.onFinish = function(didConfirm, inputText) {
	show_debug_message("User confirmed input: {0}, input: {1}", didConfirm, inputText)
}