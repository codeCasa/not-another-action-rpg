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
}else{
	char = self.find_character_in_grid(selected_char[0], selected_char[1])
}
io_clear()

if(char == ""){
	return;
}

if(char == "Spc" && string_length(selectedCharacters) < maxStrLength){
	selectedCharacters += " "
}else if(char == "Del" && string_length(selectedCharacters) > 0){
	selectedCharacters = string_delete(selectedCharacters, string_length(selectedCharacters), 1)
}

if(char != "Del" && string_length(selectedCharacters) == maxStrLength){
	selectedCharacters = string_delete(selectedCharacters, string_length(selectedCharacters), 1)
	if(char == "Spc"){
		selectedCharacters += " "
	} else {
		selectedCharacters += char
	}
}
if(char != "Del" && char != "Spc" && string_length(selectedCharacters) < maxStrLength){
	selectedCharacters += char
}