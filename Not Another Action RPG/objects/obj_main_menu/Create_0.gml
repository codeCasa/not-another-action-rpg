/// @description Insert description here
// You can write your code in this editor
debounce_timer = 0;

menu_x = room_width/2;
menu_y = room_height/2;
button_height = 32;

// buttons to display
buttonTitles[0] = "New Game"
buttonTitles[1] = "Load Game"
buttonTitles[2] = "Exit"
buttons = array_create(array_length(buttonTitles))
menu_index = 0
last_selected_menu_item = 0
for (var index = 0; index < array_length(buttons); index++) {
    buttons[index] = undefined
}