/// @description Insert description here
// You can write your code in this editor


// Set up variables for the box dimensions
var boxWidth = width;
var boxHeight = height;
var boxX = x;
var boxY = y;
var hintX = boxX + 24;
var hintY = boxY + 24;

var choiceSpacing = 20 + string_width("> ");
var choiceX = hintX + (string_width("> ") * 1.5);
var choiceY = hintY + string_height(hint) + 10;


// Draw the box with rounded corners
draw_set_color(bezelColor);
draw_roundrect_ext(x - bezelThickness, y - bezelThickness, x + width + bezelThickness, y + height + bezelThickness, cornerRadius + bezelThickness, cornerRadius + bezelThickness, false);


draw_set_color(bgColor);
draw_roundrect_ext(boxX, boxY, boxX + boxWidth, boxY + boxHeight, cornerRadius, cornerRadius, false);


draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw the hint string
draw_set_color(textColor);
draw_text(hintX, hintY, hint);

// Draw the choices horizontally
for (var i = 0; i < array_length(choices); i++) {
	var choiceText = choices[i];
	var choiceWidth = string_width(choiceText);

    // Draw the choice text
    if (i == selectedChoice) {
        draw_set_color(selectedChoiceColor);
        var arrowX = choiceX - string_width("> ");
        var arrowY = choiceY + (string_height(choiceText) - string_height("> ")) / 2;
        draw_text(arrowX, arrowY, "> ");
    } else {
        draw_set_color(textColor);
    }
	
	draw_text(choiceX, choiceY, choiceText);
	choiceX += choiceWidth + choiceSpacing;
}