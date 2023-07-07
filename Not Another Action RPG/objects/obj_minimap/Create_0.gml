/// @description Insert description here
// You can write your code in this editor

event_inherited()
self.is_passable = false
self.should_draw = false

// Set the position and size of the mini-map
width = room_width / 4; // Adjust the width as desired
height = room_height / 4; // Adjust the height as desired

// Set the background color and alpha transparency
background_alpha = 0.15; // Set the desired background transparency
// Custom arrow drawing function
self.drawArrow = function(x, y, size, angle, color) {
    var arrowPoints = [
        [-size, -size], // Top-left point
        [0, size], // Bottom point
        [size, -size] // Top-right point
    ];

    // Rotate and translate the arrow points
    for (var i = 0; i < array_length(arrowPoints); i++) {
        var point = arrowPoints[i];
        var rotatedX = point[0] * dcos(angle) - point[1] * dsin(angle);
        var rotatedY = point[0] * dsin(angle) + point[1] * dcos(angle);
        point[0] = x + rotatedX;
        point[1] = y + rotatedY;
    }

    // Draw the arrow shape
    draw_triangle(arrowPoints[0][0], arrowPoints[0][1], arrowPoints[1][0], arrowPoints[1][1], arrowPoints[2][0], arrowPoints[2][1], false);
    draw_line(arrowPoints[0][0], arrowPoints[0][1], arrowPoints[1][0], arrowPoints[1][1]);
    draw_line(arrowPoints[1][0], arrowPoints[1][1], arrowPoints[2][0], arrowPoints[2][1]);
    draw_line(arrowPoints[2][0], arrowPoints[2][1], arrowPoints[0][0], arrowPoints[0][1]);

    draw_set_color(color);
    draw_set_alpha(1);
};