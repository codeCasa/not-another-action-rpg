/// @description Mini-map script

if(!visible) {
	exit;
}

// Zoom factor for the mini-map (adjust as desired)
var zoomFactor = 1; // Change this value to control the zoom level
var miniMapMaxSizeRatio = 0.08;
var margin = 3; // Adjust the margin value as desired

// Calculate the mini-map size based on the current game resolution
var miniMapWidth = room_width * miniMapMaxSizeRatio;
var miniMapHeight = room_height * miniMapMaxSizeRatio;
var miniMapLeft = x + 12;
var miniMapTop = y + 12;
var miniMapRight = miniMapLeft + miniMapWidth;
var miniMapBottom = miniMapTop + miniMapHeight;
draw_set_alpha(0.65)

if(collision_rectangle(miniMapLeft, miniMapTop, miniMapRight, miniMapBottom, obj_player, false, true)){
	draw_set_alpha(1)
	exit
}

// Draw the rectangular mini-map background with black border and white fill
draw_set_color(c_black);
draw_rectangle(miniMapLeft, miniMapTop, miniMapRight, miniMapBottom, false);
draw_set_color(c_white);
draw_rectangle(miniMapLeft + 1.5, miniMapTop + 1.5, miniMapRight - 2, miniMapBottom - 2, false);

// Draw the player on the mini-map
with (obj_player) {
    var playerMapX = miniMapLeft + (x / room_width) * (miniMapWidth - margin * 2);
    var playerMapY = miniMapTop + (y / room_height) * (miniMapHeight - margin * 2);
    draw_sprite_ext(sprite_index, image_index, playerMapX, playerMapY, miniMapMaxSizeRatio * 6, miniMapMaxSizeRatio * 6, image_angle, image_blend, image_alpha);
}

// Draw the objects on the mini-map with margin applied
var playerX = obj_player.x;
var playerY = obj_player.y;
with (obj_generic) {
    if (should_draw && !is_player && instance_number(obj_player) > 0) {
        var objectMapX = miniMapLeft + margin + (x / room_width) * (miniMapWidth - margin * 2);
        var objectMapY = miniMapTop + margin + (y / room_height) * (miniMapHeight - margin * 2);

        if (object_index == obj_wall) {
            draw_set_color(c_green);
            if (image_xscale > image_yscale) {
                var lineLength = (miniMapWidth - margin * 2) * (sprite_width / room_width);
                var lineEndX = objectMapX + lineLength;
                draw_line_width(objectMapX, objectMapY, lineEndX, objectMapY, 1.5);
            } else {
                var lineLength = (miniMapHeight - margin * 2) * (sprite_height / room_height);
                var lineEndY = objectMapY + lineLength;
                draw_line_width(objectMapX, objectMapY, objectMapX, lineEndY, 1.5);
            }
        } else {
            draw_sprite_ext(sprite_index, image_index, objectMapX, objectMapY, miniMapMaxSizeRatio * 4, miniMapMaxSizeRatio * 4, image_angle, image_blend, image_alpha);
        }
    }
}