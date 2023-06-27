/// @description Draw menu

draw_text_transformed_color(
	room_width/2, 100, GameTitle,
	3, 3, 0, c_orange, c_purple, c_red, c_fuchsia, 1
)
var i = 0
repeat(array_length(buttons)) {
	if(buttons[i] != undefined) {
		i++;
		continue;
	}
	var marginTop = 0
	if(i > 0){
		marginTop = 16 * i
	}
	buttons[i] = scr_create_generic_button(menu_x,  (menu_y + button_height * i) + marginTop, 
		buttonTitles[i], 120, button_height, 24, ThemeColor.Primary);
	buttons[i].execute = buttonExe[i];
	i++;
}