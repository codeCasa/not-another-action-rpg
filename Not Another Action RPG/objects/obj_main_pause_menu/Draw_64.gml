/// @description Insert description here
// You can write your code in this editor


// Draw the choices panel bezel
draw_set_color(lighterColor);
draw_roundrect_ext(choicesPanelX - bezelThickness, choicesPanelY - bezelThickness, choicesPanelX + choicesPanelWidth + bezelThickness, 
	choicesPanelY + choicesPanelHeight + bezelThickness, cornerRadius + bezelThickness, cornerRadius + bezelThickness, false);

// Draw the meta 1 panel bezel
draw_set_color(lighterColor);
draw_roundrect_ext(meta1PanelX - bezelThickness, meta1PanelY - bezelThickness, meta1PanelX + meta1PanelWidth + bezelThickness,
	meta1PanelY + meta1PanelHeight + bezelThickness, cornerRadius + bezelThickness, cornerRadius + bezelThickness, false);

// Draw the meta 2 panel bezel
draw_set_color(lighterColor);
draw_roundrect_ext(meta2PanelX - bezelThickness, meta2PanelY - bezelThickness, meta2PanelX + meta2PanelWidth + bezelThickness,
	meta2PanelY + meta2PanelHeight + bezelThickness, cornerRadius + bezelThickness, cornerRadius + bezelThickness, false);

// Draw the choices panel background
draw_set_color(backgroundColor);
draw_roundrect_ext(choicesPanelX, choicesPanelY, choicesPanelX + choicesPanelWidth, 
	choicesPanelY + choicesPanelHeight, cornerRadius, cornerRadius, false);
		
// Draw the main panel bezel
draw_set_color(lighterColor);
draw_roundrect_ext(mainPanelX - bezelThickness, mainPanelY - bezelThickness, mainPanelX + mainPanelWidth + bezelThickness,
    mainPanelY + mainPanelHeight + bezelThickness, cornerRadius + bezelThickness, cornerRadius + bezelThickness, false);

// Draw the main panel background
draw_set_color(backgroundColor);
draw_roundrect_ext(mainPanelX + bezelThickness, mainPanelY + bezelThickness, mainPanelX + mainPanelWidth - bezelThickness,
    mainPanelY + mainPanelHeight - bezelThickness, cornerRadius, cornerRadius, false);

// Set the text properties for choices
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(textColor);

// Calculate the position for the first choice
var choiceX = choicesPanelX + 10;
var choiceY = choicesPanelY + 10;

// Draw the choices
for (var i = 0; i < array_length(choices); i++) {
	var choiceText = choices[i];
	if(selectedIndex == i) {
		draw_set_color(selectedTextColor)
	draw_text(choiceX, choiceY, string("> {0}", choiceText));
	}else{
		draw_set_color(textColor);	
	draw_text(choiceX + string_width("> "), choiceY, choiceText);
	}
	choiceY += 20; // Adjust the vertical spacing between choices
}

// Draw the meta 1 panel background
draw_set_color(backgroundColor);
draw_roundrect_ext(meta1PanelX, meta1PanelY, meta1PanelX + meta1PanelWidth,
	meta1PanelY + meta1PanelHeight, cornerRadius, cornerRadius, false);

// Set the text properties for meta 1 data
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(textColor);

// Calculate the position for the meta 1 data
var meta1X = meta1PanelX + 10;
var meta1Y = meta1PanelY + 10;

// Draw the meta 1 data
for (var i = 0; i < array_length(meta1Data); i++) {
	var meta1Text = meta1Data[i];
	var meta1TextWidth = string_width(meta1Text);
	var meta1TextScale = 1;
        
	if (meta1TextWidth > meta1PanelWidth - 20) {
	    meta1TextScale = (meta1PanelWidth - 20) / meta1TextWidth;
	}
        
	draw_text_transformed(meta1X, meta1Y, meta1Text, meta1TextScale, meta1TextScale, 0);
	meta1Y += 20 * meta1TextScale; // Adjust the vertical spacing between meta 1 data
}

// Draw the meta 2 panel background
draw_set_color(backgroundColor);
draw_roundrect_ext(meta2PanelX, meta2PanelY, meta2PanelX + meta2PanelWidth,
	meta2PanelY + meta2PanelHeight, cornerRadius, cornerRadius, false);

// Set the text properties for meta 2 data
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(textColor);

// Calculate the position for the meta 2 data
var meta2X = meta2PanelX + 10;
var meta2Y = meta2PanelY + meta2PanelHeight / 2;

// Draw the meta 2 data
for (var i = 0; i < array_length(meta2Data); i++) {
	var meta2Text = meta2Data[i];
	var meta2TextWidth = string_width(meta2Text);
	var meta2TextScale = 1;
        
	if (meta2TextWidth > meta2PanelWidth - 20) {
	    meta2TextScale = (meta2PanelWidth - 20) / meta2TextWidth;
	}
        
	draw_text_transformed(meta2X, meta2Y, meta2Text, meta2TextScale, meta2TextScale, 0);
	meta2Y += 20 * meta2TextScale; // Adjust the vertical spacing between meta 2 data
}
	
	// Set the axis properties
var axisCount = 5;
var axisRadius = (mainPanelWidth < mainPanelHeight) ? mainPanelWidth * 0.35 : mainPanelHeight * 0.35;
var axisCenterX = mainPanelX + mainPanelWidth / 2;
var axisCenterY = mainPanelY + mainPanelHeight / 2;
var axisAngle = 360 / axisCount;
	
	
// Set the data values (example values)
var dataValues = [0.6, 0.8, 0.4, 0.9, 0.7];
var maxValue = 1;
    
// Set the axis label properties
var labelRadius = axisRadius + 20;
var labelColor = textColor;

// Calculate the maximum data value
var maxValue = scr_max_array_value(dataValues);

// Calculate the position for the data lines
var lineStartX = [];
var lineStartY = [];
var lineEndX = [];
var lineEndY = [];

for (var i = 0; i < axisCount; i++) {
	var angle = i * axisAngle;
	var value = dataValues[i] / maxValue;
	lineStartX[i] = axisCenterX + lengthdir_x(axisRadius * value, angle);
	lineStartY[i] = axisCenterY + lengthdir_y(axisRadius * value, angle);
	lineEndX[i] = axisCenterX + lengthdir_x(axisRadius, angle + 180);
	lineEndY[i] = axisCenterY + lengthdir_y(axisRadius, angle + 180);
}

// Draw the axis lines and labels
draw_set_color(labelColor);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < axisCount; i++) {
	var angle = i * axisAngle;
	var startX = lineStartX[i];
	var startY = lineStartY[i];
	var endX = lineEndX[i];
	var endY = lineEndY[i];
	var labelX = axisCenterX + lengthdir_x(labelRadius, angle);
	var labelY = axisCenterY + lengthdir_y(labelRadius, angle);

	draw_line(startX, startY, endX, endY);
	draw_text(labelX, labelY, string("Axis {0}", (i + 1)));
}

// Draw the data lines
draw_set_color(scr_get_theme_color(ThemeColor.Accent));

for (var i = 0; i < axisCount; i++) {
	var angle = i * axisAngle;
	var value = dataValues[i] / maxValue;
	var lineStartX = axisCenterX + lengthdir_x(axisRadius * value, angle);
	var lineStartY = axisCenterY + lengthdir_y(axisRadius * value, angle);

	var nextIndex = (i + 1) % axisCount;
	var nextValue = dataValues[nextIndex] / maxValue;
	var lineEndX = axisCenterX + lengthdir_x(axisRadius * nextValue, angle + axisAngle);
	var lineEndY = axisCenterY + lengthdir_y(axisRadius * nextValue, angle + axisAngle);

	draw_line(lineStartX, lineStartY, lineEndX, lineEndY);
}