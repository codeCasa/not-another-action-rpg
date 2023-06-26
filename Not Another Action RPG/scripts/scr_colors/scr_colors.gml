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
