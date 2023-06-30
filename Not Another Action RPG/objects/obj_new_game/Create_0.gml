/// @description Insert description here
// You can write your code in this editor
choiceTb = scr_create_text_box_with_choices(room_width / 2, room_height / 2, 250, 100, 16, "Red pill or blue pill", ["Red Pill", "Blue Pill"], ThemeColor.Surface)
choiceTb.onSelected = function(index, choice) {
	show_message(string("You chose option {0}, {1}", index, choice))
}