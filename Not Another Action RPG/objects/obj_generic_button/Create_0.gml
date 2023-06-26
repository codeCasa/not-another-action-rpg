/// @description Insert description here
// You can write your code in this editor

self.text = undefined;
self.width = undefined;
self.height = undefined;
self.cornerRadius = undefined;
self.colorEnum = undefined;
self.buttonColor = undefined;
self.contrastingColor =undefined;
self.bezelColor = undefined;
self.trueBezelColor = undefined;
self.bezelColor = undefined;
self.selected = false
self.bezelThickness = undefined;
self.execute = undefined

self.x = x;
self.y = y;
self.text = text;
self.width = width;
self.height = height;
self.cornerRadius = cornerRadius;
self.colorEnum = colorEnum;
self.buttonColor = scr_get_theme_color(colorEnum);
self.contrastingColor = scr_get_contrasting_color(buttonColor);
self.trueBezelColor = make_color_rgb(
    min(color_get_red(buttonColor) + 50, 255),
    min(color_get_green(buttonColor) + 50, 255),
    min(color_get_blue(buttonColor) + 50, 255)
);
self.bezelColor = self.trueBezelColor;