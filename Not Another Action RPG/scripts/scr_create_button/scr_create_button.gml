/// scr_create_button(x, y, text, width, height, cornerRadius, onClick)
///
/// Creates and draws a rounded rectangle button at the specified position with the given properties.
///
/// Arguments:
///   - x: The x-coordinate of the button's position on the screen.
///   - y: The y-coordinate of the button's position on the screen.
///   - text: The text to be displayed on the button.
///   - width: The width of the button.
///   - height: The height of the button.
///   - cornerRadius: The radius of the button's rounded corners.
///   - colorEnum: The enum representing the theme color.
///
/// Returns:
///   N/A
function scr_create_button(x, y, text, width, height, cornerRadius, colorEnum) {
    var buttonColor = scr_get_theme_color(colorEnum);
    var contrastingColor = scr_get_contrasting_color(buttonColor);
    var bezelColor = make_color_rgb(
        min(color_get_red(buttonColor) + 50, 255),
        min(color_get_green(buttonColor) + 50, 255),
        min(color_get_blue(buttonColor) + 50, 255)
    );

    draw_set_color(bezelColor);
    draw_roundrect_ext(x - 2, y - 2, x + width + 2, y + height + 2, cornerRadius + 2, cornerRadius + 2, true);

    draw_set_color(buttonColor);
    draw_roundrect_ext(x, y, x + width, y + height, cornerRadius, cornerRadius, false);

    draw_set_color(contrastingColor);
    draw_roundrect_ext(x, y, x + width, y + height, cornerRadius, cornerRadius, true);

    var text_x = x + width / 2;
    var text_y = y + height / 2;
    var text_width = string_width(text);
    var text_height = string_height(text);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(contrastingColor);
    draw_text(text_x, text_y, text);
}

function scr_create_generic_button(x, y, text, width, height, cornerRadius, colorEnum) {
	var button = instance_create_layer(x, y, "Instances", obj_generic_button)
	button.x = x
	button.y = y
	button.text = text
	button.width = width
	button.height = height
	button.cornerRadius = cornerRadius
	button.colorEnum = colorEnum
	return button
}