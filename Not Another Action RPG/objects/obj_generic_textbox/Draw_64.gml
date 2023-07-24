/// @description Insert description here
// You can write your code in this editor

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

if(maxPages > 1){
	// Calculate the coordinates for the equilateral triangles
	var triangle_size = height * 0.15; // Adjust the 0.15 factor to control the size of the triangle
	var triangle_x1 = x + width - triangle_size - (cornerRadius * 0.5) - 8;
	var triangle_y = y + height - triangle_size - (cornerRadius * 0.5);
	var triangle_x2 = triangle_x1 - (triangle_size + 8);

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

	var tri_text_y = triangle_y + (triangle_size / 2);

	// Draw the equilateral triangles with 8-pixel spacing
	draw_set_color(textColor);
	if (currentPage < maxPages - 1) {
	    draw_triangle(triangle_x1, triangle_y, triangle_x1 + triangle_size, triangle_y + (triangle_size / 2), triangle_x1, triangle_y + triangle_size, false);
	}

	if (currentPage > 0) {
	    draw_triangle(triangle_x2, triangle_y, triangle_x2 - triangle_size, triangle_y + (triangle_size / 2), triangle_x2, triangle_y + triangle_size, false);
	}

	// Draw the "1/2" text centered horizontally and vertically
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(textColor);
	draw_text_transformed(tri_text_x, tri_text_y, string("{0}/{1}", currentPage + 1, maxPages), 0.75, 0.75, 0);
}