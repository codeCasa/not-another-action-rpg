/// @description Mini-map script

// Calculate the mini-map size based on the current game resolution
var miniMapSize = min(display_get_width(), display_get_height()) * 0.2;
var miniMapRadius = miniMapSize * 0.5;

// Create a temporary surface to draw the room on
var roomSurface = -1; // Variable to store the surface ID
if (!surface_exists(roomSurface)) {
    roomSurface = surface_create(room_width, room_height); // Create a surface with the same dimensions as the room
}

// Set the target surface for drawing
surface_set_target(roomSurface);

// Clear the surface
draw_clear_alpha(c_black, 0);

// Draw the room onto the surface
with (all) {
    // Draw instances
    if (object_index != obj_player && object_index == obj_generic && object_index.should_draw) {
        draw_self();
    }
}

// Reset the target surface
surface_reset_target();

// Calculate the scaling factors
var scaleX = miniMapSize / room_width;
var scaleY = miniMapSize / room_height;

// Draw the player's position and direction on the mini-map
var playerX = obj_player.x; // Replace "obj_player" with the actual player object name
var playerY = obj_player.y; // Replace "obj_player" with the actual player object name
var playerMapX = x + playerX * scaleX;
var playerMapY = y + playerY * scaleY;
var playerSize = 4; // Adjust the player arrow size as desired

// Draw the white outline around the mini-map
var outlineThickness = 2;
draw_set_color(c_white);
draw_rectangle(x, y, x + miniMapSize, y + miniMapSize, false);
draw_rectangle(x + outlineThickness, y + outlineThickness, x + miniMapSize - outlineThickness, y + miniMapSize - outlineThickness, false);

// Draw the mini-map from the room surface
draw_set_color(c_white);
draw_surface_ext(roomSurface, x + outlineThickness, y + outlineThickness, scaleX, scaleY, 0, c_white, 1);

// Draw the player arrow
draw_set_color(#D4AF37);
self.drawArrow(playerMapX, playerMapY, playerSize, obj_player.image_angle, #D4AF37);

// Destroy the room surface to free up memory
surface_free(roomSurface);
