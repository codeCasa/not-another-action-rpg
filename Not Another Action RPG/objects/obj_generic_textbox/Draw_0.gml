/// @description Insert description here
// You can write your code in this editor
if(!visible) {
	global.textbox_open = false
	exit
}
global.textbox_open = true

self.bezelThickness = min(width, height) * 0.05;

// Calculate the position for the text
self.text_x = x + cornerRadius;
self.text_y = y + (cornerRadius*0.5);

draw_set_color(bezelColor);
draw_roundrect_ext(x - bezelThickness, y - bezelThickness, x + width + bezelThickness, y + height + bezelThickness, cornerRadius + bezelThickness, cornerRadius + bezelThickness, false);

	
// Draw the background rounded rectangle
draw_set_color(bgColor);
draw_roundrect_ext(x, y, x+width, y+height, cornerRadius, cornerRadius, false);

// Draw the text with the contrasting color
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(textColor);
draw_text_ext(text_x, text_y, pageTexts[currentPage], -1, width - (cornerRadius * 2));


if (maxPages > 1) {
    // Calculate pagination container position and dimensions
    var container_x = x;
    var container_y = y + height + 10; // Adjust the vertical spacing as desired
    var container_height = 40;
    var xPadding = 5;

    // Calculate the width of the pagination container based on the pagination components
    var triangle_size = container_height * 0.15; // Adjust the 0.15 factor to control the size of the triangle
    // Calculate the width needed for the page text
    var pageTextWidth = string_width(string("{0}/{1}", currentPage + 1, maxPages)) * 0.75;

    // Adjust the container width to fit the pagination components and page text
    var container_width = (pageTextWidth * 1.25) + (xPadding * 2) + (triangle_size * 4); // Update this line to include triangle spacing
    var triangle_x1 = container_x + container_width - triangle_size - (cornerRadius * 0.5) - 8;
    var triangle_x2 = triangle_x1 - (triangle_size + 8);
    var triangle_y = container_y + (container_height * 0.75) - triangle_size - (cornerRadius * 0.5);

    // Draw pagination container bezel
    draw_set_color(bezelColor);
    draw_roundrect_ext(container_x - bezelThickness, container_y - bezelThickness, container_x + container_width + bezelThickness, container_y + container_height + bezelThickness, cornerRadius + bezelThickness, cornerRadius + bezelThickness, false);

    // Draw pagination container
    draw_set_color(bgColor);
    draw_roundrect_ext(container_x, container_y, container_x + container_width, container_y + container_height, cornerRadius + bezelThickness, cornerRadius + bezelThickness, false);

    // Check if both triangles are visible
    var bothTrianglesVisible = (currentPage < maxPages - 1) && (currentPage > 0);

    // Calculate the center position for the "1/2" text
    var tri_text_x;
    if (bothTrianglesVisible) {
        tri_text_x = (triangle_x1 + triangle_x2) / 2;
    } else if (currentPage < maxPages - 1) {
        tri_text_x = triangle_x1 - triangle_size;
    } else {
        tri_text_x = triangle_x1 - triangle_size / 2;
    }
    var tri_text_y = triangle_y + triangle_size / 2;

    // Draw the equilateral triangles with 4-pixel spacing around the text
    draw_set_color(textColor);
	if (currentPage < maxPages - 1) {
        draw_triangle(triangle_x1 + 8, triangle_y, triangle_x1 + triangle_size + 8, triangle_y + (triangle_size / 2), triangle_x1 + 8, triangle_y + triangle_size, false);
    }

    if (currentPage > 0) {
        draw_triangle(triangle_x2 - 8, triangle_y, triangle_x2 - triangle_size - 8, triangle_y + (triangle_size / 2), triangle_x2 - 8, triangle_y + triangle_size, false);
    }

    // Draw the "1/2" text centered horizontally and vertically
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(textColor);
    draw_text_transformed(tri_text_x, tri_text_y, string("{0}/{1}", currentPage + 1, maxPages), 0.75, 0.75, 0);
}
