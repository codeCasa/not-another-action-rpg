
/// Draw grid
// Calculate grid dimensions
var gridWidth = columns * cellSize;
var gridHeight = rows * cellSize;

// Calculate padding
var padding = 4;

// Calculate bezel dimensions
var bezelX1 = gridX - padding;
var bezelY1 = gridY - padding;
var bezelX2 = gridX + gridWidth + (padding * columns);
var bezelY2 = gridY + gridHeight + (padding * rows);

// Draw the bezel
draw_set_color(bezelColor);
draw_roundrect_ext(bezelX1, bezelY1, bezelX2, bezelY2, 8, 8, false);

// Draw the grid
for (var i = 0; i < array_length(characters); i++) {
    var column = i mod columns;
    var row = floor(i / columns);
    var cellX = gridX + column * (cellSize + padding);
    var cellY = gridY + row * (cellSize + padding);

    // Draw the background rounded rectangle
	if(column == selected_char[0] && selected_char[1] == row && !self.isSelectingConfirmationOptions){
		draw_set_color(selectedBgColor)
	}else{
		draw_set_color(backgroundColor);
	}
    draw_roundrect_ext(cellX, cellY, cellX + cellSize, cellY + cellSize, 8, 8, false);

    // Draw the character
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
	
	if(column == selected_char[0] && selected_char[1] == row && !self.isSelectingConfirmationOptions){
		draw_set_color(selectedTextColor)
	}else{
		draw_set_color(textColor);
	}
    var character = characters[i];
    draw_text(cellX + cellSize * 0.5, cellY + cellSize * 0.5, character);
}


/// Input display tracker
// Set up variables for the selected characters rectangle
var selectedRectWidth = gridWidth + (padding * columns);
var selectedRectHeight = 40;
var selectedRectX = gridX;
var selectedRectY = gridY - selectedRectHeight - 20;
var selectedRectCornerRadius = 8;

// Calculate the position for the text in the selected rectangle
var selectedTextX = selectedRectX + selectedRectWidth * 0.5;
var selectedTextY = selectedRectY + selectedRectHeight * 0.5;

// Draw the rounded rectangle for selected characters
draw_set_color(bezelColor);
draw_roundrect_ext(selectedRectX, selectedRectY, selectedRectX + selectedRectWidth, selectedRectY + selectedRectHeight, selectedRectCornerRadius, selectedRectCornerRadius, false);

// Draw the background rounded rectangle
draw_set_color(backgroundColor);
draw_roundrect_ext(selectedRectX + 2, selectedRectY + 2, selectedRectX + selectedRectWidth - 2, selectedRectY + selectedRectHeight - 2, selectedRectCornerRadius, selectedRectCornerRadius, false);

// Draw the selected characters
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(textColor);
draw_text(selectedTextX, selectedTextY, selectedCharacters);


/// Pulsing Bar Animation
var pulsingBarWidth = string_width("M")*1.5;
var pulsingBarHeight = string_height("M") / 3;
var pulsingBarX;
var pulsingBarY = selectedRectY + selectedRectHeight - pulsingBarHeight - 2;
var pulsingBarColor = c_white;

if (string_length(selectedCharacters) == 0) {
    // Case 1: No characters selected
    pulsingBarX = selectedRectX + selectedRectWidth * 0.5 - pulsingBarWidth * 0.5;
} else if (string_length(selectedCharacters) < maxStrLength) {
    // Case 2: Selected characters count < maxStrLength
    pulsingBarX = (selectedRectX + selectedRectWidth * 0.5 - pulsingBarWidth * 0.5) + string_width(selectedCharacters) * 0.665
} else {
    // Case 3: Selected characters count >= maxStrLength
    pulsingBarX = (selectedRectX + selectedRectWidth * 0.5 - pulsingBarWidth * 0.5) + string_width(selectedCharacters) / 2.15
}

// Update the blinking timer
blinkTimer += (delta_time / 1000000)
if (blinkTimer >= blinkingInterval) {
    isBarVisible = !isBarVisible;
    blinkTimer = 0;
}

// Draw the pulsing bar if visible
if (isBarVisible) {
    draw_set_color(pulsingBarColor);
    draw_roundrect_ext(pulsingBarX, pulsingBarY, pulsingBarX + pulsingBarWidth, pulsingBarY + pulsingBarHeight, 4, 4, false);
}


/// Hint Panel
// Set up variables for the hint panel
var hintPanelWidth = selectedRectWidth;
var hintPanelHeight = 40;
var hintPanelX = selectedRectX;
var hintPanelY = selectedRectY - hintPanelHeight - 20;
var hintPanelCornerRadius = 8;

// Calculate the position for the hint text in the hint panel
var hintTextX = hintPanelX + hintPanelWidth * 0.5;
var hintTextY = hintPanelY + hintPanelHeight * 0.5;

// Draw the rounded rectangle for the hint panel
draw_set_color(bezelColor);
draw_roundrect_ext(hintPanelX, hintPanelY, hintPanelX + hintPanelWidth, hintPanelY + hintPanelHeight, hintPanelCornerRadius, hintPanelCornerRadius, false);

// Draw the background rounded rectangle
draw_set_color(backgroundColor);
draw_roundrect_ext(hintPanelX + 2, hintPanelY + 2, hintPanelX + hintPanelWidth - 2, hintPanelY + hintPanelHeight - 2, hintPanelCornerRadius, hintPanelCornerRadius, false);

// Draw the hint text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(textColor);
draw_text(hintTextX, hintTextY, hintText);


/// Confirmation Panel
// Set up variables for the confirmation panel
var confirmationPanelWidth = (gridWidth + (padding * columns)) / 2.5;
var confirmationPanelHeight = bezelY2
var confirmationPanelX = bezelX2 + (padding * 1.5);
var confirmationPanelY = bezelY1;

// Draw the confirmation panel background
draw_set_color(bezelColor);
draw_roundrect_ext(confirmationPanelX, confirmationPanelY, confirmationPanelX + confirmationPanelWidth,
	confirmationPanelHeight, 8, 8, false);


var startX = confirmationPanelX + (string_width("> ") * 1.55)
var verticalSpacing = string_height("M") * 1.2; // Adjust this value for desired spacing

// Draw the confirmation options in reverse order from the bottom of the panel with vertical spacing
for (var i = array_length(confirmationOptions) - 1; i >= 0; i--) {
    var optionY = confirmationPanelHeight - 
        (string_height(confirmationOptions[i]) * (array_length(confirmationOptions) - 1 - i))
        - (string_height("M") * 1.5)
	if(i < array_length(confirmationOptions) - 1) {
		optionY -= verticalSpacing
	}	

	if(self.isSelectingConfirmationOptions && i == self.selectedConfirmationOption){
		draw_set_color(selectedBgColor)
	    draw_set_halign(fa_left); // Align the ">" symbol to the left
	    draw_set_valign(fa_middle);
        draw_text(startX - string_width("> "), optionY, ">");
	}else{
		draw_set_color(textColor);
	}
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_text(startX, optionY, confirmationOptions[i]);
}

