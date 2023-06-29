/// @description Insert description here
// You can write your code in this editor
if(self.colorEnum != undefined) {
	self.colorEnum = colorEnum;
	var checkColor = scr_get_theme_color(colorEnum);
	if(checkColor == self.buttonColor) {
		return
	}
	self.buttonColor = scr_get_theme_color(colorEnum);
	self.contrastingColor = scr_get_contrasting_color(buttonColor);
	self.trueBezelColor = make_color_rgb(
	    min(color_get_red(buttonColor) + 50, 255),
	    min(color_get_green(buttonColor) + 50, 255),
	    min(color_get_blue(buttonColor) + 50, 255)
	);
}