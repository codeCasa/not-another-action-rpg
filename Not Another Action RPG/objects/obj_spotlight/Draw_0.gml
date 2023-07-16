// Simulate lights off
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// Set the spotlight parameters
var radius = 100; // Adjust the radius of the spotlight
var softness = 0.5; // Adjust the softness of the spotlight
var color = c_white; // Adjust the color as desired

// Calculate the spotlight position based on obj_player
var spotlightX = obj_player.x;
var spotlightY = obj_player.y;

// Set the draw settings for the spotlight
gpu_set_blendmode(bm_add);
draw_set_color(color);
draw_set_alpha(softness);

// Draw the spotlight using a circular gradient
var segments = 32; // Adjust the number of segments for smoother edges
var angleStep = 360 / segments;
var innerRadius = radius * (1 - softness);

draw_primitive_begin(pr_trianglefan);
draw_vertex(spotlightX, spotlightY); // Center vertex

for (var i = 0; i <= segments; i++) {
    var angle = i * angleStep;
    var _x = spotlightX + lengthdir_x(radius, angle);
    var _y = spotlightY + lengthdir_y(radius, angle);
    draw_vertex(_x, _y);
}

draw_vertex(spotlightX + lengthdir_x(innerRadius, 0), spotlightY + lengthdir_y(innerRadius, 0)); // Close the shape
draw_primitive_end();

// Reset the draw settings
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);


// Render partially inside the spotlight
with (obj_generic) {
	if(!should_draw){
		return
	}
    if (collision_circle(bbox_left, bbox_top, radius, obj_player, false, true) && should_draw) {
        var collisionX = clamp(x, spotlightX - radius, spotlightX + radius);
        var collisionY = clamp(y, spotlightY - radius, spotlightY + radius);
        var distance = point_distance(spotlightX, spotlightY, collisionX, collisionY);
        var alpha = 1 - (distance - innerRadius) / (radius - innerRadius);
        
		draw_sprite_general(sprite_index, image_index, 0, 0, sprite_width, sprite_height, x, y, 
			image_xscale, image_yscale, image_angle, image_blend, image_blend, image_blend, image_blend, alpha)

    }
}

// Render tilesets partially inside the spotlight
var layers = layer_get_all() // Adjust the layer name as necessary
var instanceId =  layer_get_id("Instances")
for(var index = 0; index < array_length(layers); index++){
	var tilesetLayer = layers[index]
	if(tilesetLayer == instanceId){
		continue
	}
	var map_id = layer_tilemap_get_id(tilesetLayer);
	var tsId = tilemap_get_tileset(map_id);
	var tile_width = tilemap_get_tile_width(map_id);
	var tile_height = tilemap_get_tile_height(map_id);
	for (var _x = 0; _x < room_width; _x += tile_width) {
		for (var _y = 0; _y < room_height; _y += tile_height) {
			if (collision_circle(_x + (tile_width / 2), _y + (tile_height / 2), radius, obj_player, false, true)) {
				var collisionX = clamp(_x, spotlightX - radius, spotlightX + radius);
				var collisionY = clamp(_y, spotlightY - radius, spotlightY + radius);
				var distance = point_distance(spotlightX, spotlightY, collisionX, collisionY);
				var alpha = 1 - (distance - innerRadius) / (radius - innerRadius);
				var tileX = _x / tile_width;
				var tileY = _y / tile_height;
				var tileIndex = tilemap_get(map_id, tileX, tileY);
			
				if (tileIndex != -1) {
					draw_tile(tsId, tileIndex, 0,_x, _y);
				}
			}
		}
	}
}