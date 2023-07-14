/// @description Core player logic

// get player input
var key_left = scr_check_movement_key(MovementKey.Left);
var key_right = scr_check_movement_key(MovementKey.Right);
var key_up = scr_check_movement_key(MovementKey.Up);
var key_down = scr_check_movement_key(MovementKey.Down);

// calculate movement
moveDirectionX = key_right - key_left; // +1 move right; -1 move left
moveDirectionY = key_down - key_up; // +1 move up; -1 move down

targetX = x + moveDirectionX * walkSpeed;
targetY = y + moveDirectionY * walkSpeed;

// horizontal collision
var collidedWith = instance_place(targetX, y, obj_generic);
if (collidedWith == noone || collidedWith.is_passable) {
    x = lerp(x, targetX, 0.2); // Adjust the lerp value as desired for smoother movement
}

// vertical collision
collidedWith = instance_place(x, targetY, obj_generic)
if (collidedWith == noone || collidedWith.is_passable) {
    y = lerp(y, targetY, 0.2); // Adjust the lerp value as desired for smoother movement
}

var previousImageIndex = image_index; // Store the previous image index

if (moveDirectionX == 0 && moveDirectionY == 0) {
    // Determine the correct idle animation based on the previous movement direction
    if (previousImageIndex >= 0 && previousImageIndex < 6) {
        // idle right
        sprite_index = spr_player_idle;
        image_index = 0;
    } else if (previousImageIndex >= 6 && previousImageIndex < 12) {
        // idle up
        sprite_index = spr_player_idle;
        image_index = 6;
    } else if (previousImageIndex >= 12 && previousImageIndex < 18) {
        // idle left
        sprite_index = spr_player_idle;
        image_index = 12;
    } else {
        // idle down
        sprite_index = spr_player_idle;
        image_index = 18;
    }
} else {
    if (sprite_index != spr_player_walking) {
        sprite_index = spr_player_walking;
    }
    // Determine the animation frames based on the direction
    if (moveDirectionX < 0 && (image_index < 12 || image_index >= 18)) {
        // Moving left
        image_index = 12;
    } else if (moveDirectionX > 0 && image_index > 6) {
        // Moving right
        image_index = 0;
    } else if (moveDirectionY < 0 && (image_index < 6 || image_index >= 12)) {
        // Moving up
        image_index = 6;
    } else if (moveDirectionY > 0 && image_index < 18) {
        // Moving down
        image_index = 18;
    }
}

// Repeat the current animation cycle
if (image_index % 6 >= 5) {
    image_index -= 5; // Reset image_index back to the starting frame of the current cycle
}
