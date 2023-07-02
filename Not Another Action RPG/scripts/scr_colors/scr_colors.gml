enum ThemeColor 
{
    Primary,
    Secondary,
    Accent,
	Surface,
	Background,
	Selected
}

/// scr_get_theme_color(hex)
///
/// Returns the game maker color corresponding to the theme color
///
/// Arguments:
///   - color: The theme color
///
/// Returns:
///   The corresponding GameMaker color value.
function scr_get_theme_color(color){
	switch (color) {
	    case ThemeColor.Primary:
	        return #F7AEF8;
	    case ThemeColor.Secondary:
	        return #b388eb;
	    case ThemeColor.Accent:
	        return #8093f1;
	    case ThemeColor.Surface:
	        return #72ddf7;
	    case ThemeColor.Background:
	        return #F4F4ED;
		case ThemeColor.Selected:
			return #FF6978;
	    default:
	        return #F7AEF8;
	}
}

/// scr_get_contrasting_color(color)
///
/// Calculates a contrasting color based on the provided color.
///
/// Arguments:
///   - color: The original color.
///
/// Returns:
///   The contrasting color.
function scr_get_contrasting_color(color) {
    var red = color_get_red(color);
    var green = color_get_green(color);
    var blue = color_get_blue(color);
    var average = (red + green + blue) / 3;
    
    if (average > 128) {
        return c_black;
    } else {
        return c_white;
    }
}

/// scr_get_lighter_color(color, amount)
//
// Returns a lighter version of the specified color by the given amount.
//
// Arguments:
// color - The color value in hexadecimal format (e.g., $FF0000 for red).
// amount - The amount by which to lighten the color (0 to 1).

function scr_get_lighter_color(color, amount) {
    var red = color div 65536;
    var green = (color div 256) mod 256;
    var blue = color mod 256;

    red = min(red + (255 - red) * amount, 255);
    green = min(green + (255 - green) * amount, 255);
    blue = min(blue + (255 - blue) * amount, 255);

    return red * 65536 + green * 256 + blue;
}

