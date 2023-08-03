/// @description Core NPC logic
if(!visible) {
	exit
}
var deltaX = x - prevX
var deltaY = y - prevY

var previousImageIndex = image_index; // Store the previous image index

if(deltaX == 0 && deltaY == 0){
	if(sprite_index != idle_sprite) {
		sprite_index = idle_sprite
	}
	// Determine the correct idle animation based on the previous movement direction
	if (previousImageIndex >= 0 && previousImageIndex < 6) {
	    // idle right
	    image_index = 0;
	} else if (previousImageIndex >= 6 && previousImageIndex < 12) {
	    // idle up
	    image_index = 6;
	} else if (previousImageIndex >= 12 && previousImageIndex < 18) {
	    // idle left
	    image_index = 12;
	} else {
	    // idle down
	    image_index = 18;
	}
} else if (deltaX != 0 || deltaY != 0) {
	if(sprite_index != walking_sprite) {
		sprite_index = walking_sprite
	}
	
    // Determine the animation frames based on the direction
    if (deltaX < 0 && (image_index < 12 || image_index >= 18)) {
        // Moving left
        image_index = 12;
    } else if (deltaX > 0 && image_index > 6) {
        // Moving right
        image_index = 0;
    } else if (deltaY < 0 && (image_index < 6 || image_index >= 12)) {
        // Moving up
        image_index = 6;
    } else if (deltaY > 0 && image_index < 18) {
        // Moving down
        image_index = 18;
    }
}


// Repeat the current animation cycle
if (image_index % 6 >= 5) {
    image_index -= 5; // Reset image_index back to the starting frame of the current cycle
}
prevX = x
prevY = y