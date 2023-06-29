/// @description Insert description here
// You can write your code in this editor
var char = ""
if(keyboard_key != vk_enter){
	var inputChar = keyboard_string;
	var position = self.find_character_position(inputChar, keyboard_key);
	var row = position[0];
	var column = position[1];

	if (row >= 0 && column >= 0) {
		selected_char[0] = column
		selected_char[1] = row
		char = position[2]
	}
}

if(char == ""){
	return;
}
self.update_selected_characters_with_char(char)