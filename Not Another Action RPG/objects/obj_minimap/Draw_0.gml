/// @description Mini-map script

// Zoom factor for the mini-map (adjust as desired)
var zoomFactor = 0.5; // Change this value to control the zoom level

// Calculate the mini-map size based on the current game resolution
var miniMapSize = min(display_get_width(), display_get_height()) * 0.2;
var miniMapRadius = miniMapSize * 0.3;
var miniMapCenterX = x + miniMapRadius;
var miniMapCenterY = y + miniMapRadius;

// Calculate the scaled mini-map size
var scaledMiniMapSize = miniMapSize / zoomFactor;

// Calculate the scaling factors for the mini-map objects
var scaleX = scaledMiniMapSize / room_width;
var scaleY = scaledMiniMapSize / room_height;

// Create a temporary surface to draw the mini-map on
var miniMapSurface = -1;
if (!surface_exists(miniMapSurface)) {
    miniMapSurface = surface_create(scaledMiniMapSize, scaledMiniMapSize);
}

// Set the target surface for drawing
var previousSurface = surface_get_target();
surface_set_target(miniMapSurface);

// Clear the surface
draw_clear_alpha(c_black, 0);

// Reset the target surface
surface_reset_target();

// Draw the circular mini-map background with black border
draw_set_color(c_black);
draw_circle(miniMapCenterX, miniMapCenterY, miniMapRadius + 1, false);
draw_set_color(c_white);
draw_circle(miniMapCenterX, miniMapCenterY, miniMapRadius, false);

// Set the target surface for drawing
surface_set_target(miniMapSurface);

// Draw the room onto the mini-map surface
with (obj_generic) {
    if (should_draw) {
        var drawX = x * scaleX - miniMapCenterX + x + miniMapRadius;
        var drawY = y * scaleY - miniMapCenterY + y + miniMapRadius;
        // Clip the sprite to the mini-map boundaries
		var spriteLeft = max(0, -drawX);
		var spriteTop = max(0, -drawY);
		var spriteRight = min(sprite_width, scaledMiniMapSize - drawX, sprite_width - spriteLeft);
		var spriteBottom = min(sprite_height, scaledMiniMapSize - drawY, sprite_height - spriteTop);

		// Adjust the drawing position to fit within the mini-map bounds
		drawX += spriteLeft;
		drawY += spriteTop;


        
        draw_sprite_part(sprite_index, image_index, spriteLeft, spriteTop, spriteRight - spriteLeft, spriteBottom - spriteTop, drawX, drawY);
    }
}

// Reset the target surface
surface_reset_target();

// Draw the mini-map using the mini-map surface
draw_surface_stretched(miniMapSurface, x + 1, y + 1, miniMapSize - 2, miniMapSize - 2);

// Reset the target surface
surface_set_target(previousSurface);
surface_reset_target();

// Destroy the mini-map surface to free up memory
surface_free(miniMapSurface);
