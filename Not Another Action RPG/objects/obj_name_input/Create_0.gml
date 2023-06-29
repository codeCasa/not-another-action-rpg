/// @description Insert description here
// You can write your code in this editor

// Define the character grid
self.characters = [
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
    "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
    "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3",
    "4", "5", "6", "7", "8", "9", "-", "Spc", "Del"
];
self.move_direction_x = 0;
self.move_direction_y = 0;
self.selected_char[0] = 0;
self.selected_char[1] = 0;
self.debounce_timer = 0;
self.selectedCharacters = ""
self.maxStrLength = 12


// Blinking variables
self.blinkingInterval = 0.4; // Half a second (30 frames at 60 FPS)
self.blinkTimer = 0;
self.isBarVisible = true;

// Define the dimensions and position of the grid
self.gridX = 100;
self.gridY = 100;
self.cellSize = 48;
self.columns = 6;
self.rows = ceil(array_length(characters) / columns);

// Define the background and text colors based on the theme
var themeColor = scr_get_theme_color(ThemeColor.Surface)  // Change this to your desired theme color
self.selectedBgColor = scr_get_theme_color(ThemeColor.Selected)
self.selectedTextColor = scr_get_contrasting_color(selectedBgColor)
self.backgroundColor = themeColor;
self.textColor = scr_get_contrasting_color(backgroundColor);
self.bezelColor = make_color_rgb(
    min(color_get_red(backgroundColor) - 50, 255),
    min(color_get_green(backgroundColor) - 50, 255),
    min(color_get_blue(backgroundColor) - 50, 255)
);


/// Finds the row and column of a character in the grid.

/// Arguments:
///   - inputChar: The character to search for in the grid.

/// Returns:
///   An array containing the row and column of the character in the grid,
///   or [-1, -1] if the character is not found.
self.find_character_position = function (inputChar, key){
	
	var row = -1;
	var column = -1;
	var char = ""
	if(inputChar == " " || key == vk_space){
		return self.find_character_position("Spc");
	}
	if(key == vk_backspace || key == vk_delete) {
		return self.find_character_position("Del")
	}
	if(key == vk_subtract || key == 189 || keyboard_check(ord("-"))){
		return self.find_character_position("-")
	}
	for (var i = 0; i < array_length(characters); i++) {
	    if (characters[i] == inputChar) {
			char = characters[i]
	        column = i mod columns;
	        row = floor(i / columns);
	        break;
	    }
	}

	return [row, column, char];
}

/// Find character in grid
/// Returns the character at the specified row and column in the grid.
/// Arguments:
///   - column: The column index (0-based).
///   - row: The row index (0-based).
/// Returns:
///   The character at the specified row and column.
self.find_character_in_grid = function(c, r){
	for (var i = 0; i < array_length(characters); i++) {
	    var column = i mod columns;
	    var row = floor(i / columns);
		if(r == row && c == column){
			return characters[i]
		}
	}
	return "";
}

self.update_selected_characters_with_char = function(char){
	if(char == ""){
		return
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
	
}