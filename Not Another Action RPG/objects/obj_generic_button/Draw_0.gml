/// @description Insert description here
// You can write your code in this editor
// Draw bezel
if(self.selected){
	self.bezelColor = scr_get_theme_color(ThemeColor.Selected);
} else {
	self.bezelColor = self.trueBezelColor
}
draw_set_color(bezelColor);

self.bezelThickness = min(width, height) * 0.05;
draw_roundrect_ext(x - bezelThickness, y - bezelThickness, x + width + bezelThickness, y + height + bezelThickness, cornerRadius + bezelThickness, cornerRadius + bezelThickness, false);

// Draw button
draw_set_color(buttonColor);
draw_roundrect_ext(x, y, x + width, y + height, cornerRadius, cornerRadius, false);

// Draw text
var text_x = x + width / 2;
var text_y = y + height / 2;
    
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(contrastingColor);
draw_text(text_x, text_y, text);