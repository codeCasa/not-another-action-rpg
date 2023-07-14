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
