/// @description Insert description here
// You can write your code in this editor

self.hint = undefined;
self.width = undefined;
self.height = undefined;
self.cornerRadius = undefined;
self.colorEnum = undefined;
self.bgColor = undefined;
self.contrastingColor =undefined;
self.bezelColor = undefined;
self.textColor = undefined;
self.bezelThickness = undefined;
self.text_x = undefined;
self.text_y = undefined;
self.choices = [];
self.selectedChoice = 0;
self.selectedChoiceColor = scr_get_theme_color(ThemeColor.Selected)
self.onSelected = undefined

self.x = x;
self.y = y;
self.hint = hint;
self.width = width;
self.height = height;
self.move_direction = 0;
self.debounce_timer = 0;

self.initColors = function() {
	self.cornerRadius = cornerRadius;
	self.colorEnum = colorEnum;
	self.bgColor = scr_get_theme_color(colorEnum);
	self.textColor = scr_get_contrasting_color(bgColor);
	self.bezelColor = make_color_rgb(
	    min(color_get_red(bgColor) + 50, 255),
	    min(color_get_green(bgColor) + 50, 255),
	    min(color_get_blue(bgColor) + 50, 255)
	);
	self.bezelThickness = min(width, height) * 0.03;
}