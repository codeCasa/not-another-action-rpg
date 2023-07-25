/// @description obj_target_speech_bubble Draw Event
// You can write your code in this editor
if(!visible) {
	exit
}

if (self.speechTargetObj == undefined || self.speechTargetObj == noone || !self.speechTargetObj) {
    exit;
}

self.bezelThickness = min(width, height) * 0.03;

// Set the position of the speech bubble relative to the target object
var speechBubbleX = self.speechTargetObj.x - (self.width / 2);
var speechBubbleY = self.speechTargetObj.y - (self.height * 1.25) - xPixels;

// Normalize the position to the GUI window size
var guiWidth = display_get_gui_width();
var guiHeight = display_get_gui_height();
speechBubbleX = (speechBubbleX / room_width) * guiWidth;
speechBubbleY = (speechBubbleY / room_height) * guiHeight;
speechBubbleY -= (self.height * 4) - xPixels;

// Check if the speech bubble is partially outside of the room's bounds
var speechBubbleRight = speechBubbleX + self.width;
var speechBubbleBottom = speechBubbleY + self.height;

var isAboveTopBoundary = (speechBubbleY < 0);
var nameBubbleHeight = (string_height(self.speechTargetObj.objName) * 0.25) + (cornerRadius * 2);
var nameBubbleY = speechBubbleY - nameBubbleHeight - 15; // Adjust the vertical spacing as desired

if (self.speechTargetObj.objName != undefined && string_length(self.speechTargetObj.objName) > 0 && !isAboveTopBoundary) {
	isAboveTopBoundary =  (nameBubbleY < 0)
}

if (speechBubbleX < 0) {
    // Adjust x position to keep speech bubble within the left boundary
    speechBubbleX = 10;
} else if (speechBubbleRight > room_width) {
    // Adjust x position to keep speech bubble within the right boundary
    speechBubbleX = room_width - (self.width + 10);
}

if (isAboveTopBoundary) {
    // Render speech bubble below the target object
    speechBubbleY = self.speechTargetObj.y + (self.speechTargetObj.sprite_height * 0.3) + (self.height * 0.25);

    // Render arrow above the speech bubble pointed upwards
    var arrowSize = 12; // Adjust the size of the arrow as desired
	var arrowX = (self.speechTargetObj.x / room_width) * guiWidth;
    var arrowY = speechBubbleY - (self.bezelThickness * 1.75) - arrowSize;

    draw_set_color(bezelColor);
    draw_triangle(arrowX - arrowSize, arrowY + arrowSize, arrowX + arrowSize, arrowY + arrowSize, arrowX, arrowY, false);

    draw_set_color(bgColor);
    draw_triangle(arrowX - (arrowSize - 2), arrowY + (arrowSize - 2), arrowX + (arrowSize - 2), arrowY + (arrowSize - 2), arrowX, arrowY + arrowSize, false);
} else if (speechBubbleBottom > room_height) {
    // Adjust y position to keep speech bubble within the bottom boundary
    speechBubbleY = room_height - self.height;
}

if(!isAboveTopBoundary){
	// Draw the arrow (triangle)
	var arrowSize = 12; // Adjust the size of the arrow as desired
	var arrowX = (self.speechTargetObj.x / room_width) * guiWidth;
	var arrowY = speechBubbleY + self.height + (self.bezelThickness * 1.75) + arrowSize / 2;

	draw_set_color(bezelColor);
	draw_triangle(arrowX - arrowSize, arrowY, arrowX + arrowSize, arrowY, arrowX, arrowY + arrowSize, false);

	draw_set_color(bgColor);
	draw_triangle(arrowX - (arrowSize - 2), arrowY + 2, arrowX + (arrowSize - 2), arrowY + 2, arrowX, arrowY + (arrowSize - 2), false);
}

// Calculate the position for the text
self.text_x = speechBubbleX + (cornerRadius * 0.25);
self.text_y = speechBubbleY + (cornerRadius * 0.5);

// Draw the speech bubble
draw_set_color(bezelColor);
draw_roundrect_ext(speechBubbleX - bezelThickness, speechBubbleY - bezelThickness, speechBubbleX + self.width + bezelThickness, speechBubbleY + self.height + bezelThickness, cornerRadius + bezelThickness, cornerRadius + bezelThickness, false);

draw_set_color(bgColor);
draw_roundrect_ext(speechBubbleX, speechBubbleY, speechBubbleX + self.width, speechBubbleY + self.height, cornerRadius, cornerRadius, false);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(textColor);

draw_text_ext(text_x, text_y, pageTexts[currentPage], -1, self.width - (cornerRadius));

// Draw the target object's name speech bubble
if (self.speechTargetObj.objName != undefined && string_length(self.speechTargetObj.objName) > 0) {
    // Calculate the dimensions for the name speech bubble
    var nameBubbleWidth = (string_width(self.speechTargetObj.objName) * 2.5) + (cornerRadius * 2);
    var nameBubbleX = speechBubbleX //self.speechTargetObj.x - (nameBubbleWidth / 2);
    nameBubbleY = isAboveTopBoundary ? speechBubbleY + self.height + 15 : speechBubbleY - nameBubbleHeight - 15; // Adjust the vertical spacing as desired

    // Check if the name speech bubble is partially outside of the room's bounds
    var nameBubbleRight = nameBubbleX + nameBubbleWidth;
    var nameBubbleBottom = nameBubbleY + nameBubbleHeight;

    if (nameBubbleX < 0) {
        // Adjust x position to keep name speech bubble within the left boundary
        nameBubbleX = 0;
    } else if (nameBubbleRight > room_width) {
        // Adjust x position to keep name speech bubble within the right boundary
        nameBubbleX = room_width - nameBubbleWidth;
    }

    if (nameBubbleY < 0) {
        // Adjust y position to keep name speech bubble within the top boundary
        nameBubbleY = 0;
    } else if (nameBubbleBottom > room_height) {
        // Adjust y position to keep name speech bubble within the bottom boundary
        nameBubbleY = room_height - nameBubbleHeight;
    }

    // Draw the name speech bubble
    draw_set_color(bezelColor);
    draw_roundrect_ext(nameBubbleX - bezelThickness, nameBubbleY - bezelThickness, nameBubbleX + nameBubbleWidth + bezelThickness, nameBubbleY + nameBubbleHeight + bezelThickness, cornerRadius + bezelThickness, cornerRadius + bezelThickness, false);

    draw_set_color(bgColor);
    draw_roundrect_ext(nameBubbleX, nameBubbleY, nameBubbleX + nameBubbleWidth, nameBubbleY + nameBubbleHeight, cornerRadius, cornerRadius, false);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(textColor);

    draw_text(nameBubbleX + (nameBubbleWidth / 2), nameBubbleY + (nameBubbleHeight / 2), self.speechTargetObj.objName);
}
