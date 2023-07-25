if(self.spotlightTarget == undefined || self.spotlightTarget == noone){
	exit;
}

// Simulate lights off
draw_set_color(c_black)
draw_set_alpha(0.85)
draw_rectangle(0, 0, room_width, room_height, false)
//draw_clear_alpha(c_black, 0);

// Set the spotlight parameters
var radius = 100; // Adjust the radius of the spotlight
var softness = 0.5; // Adjust the softness of the spotlight
var color = #e9e0c9; // Adjust the color as desired

// Calculate the spotlight position based on obj_player
var spotlightX = self.spotlightTarget.x;
var spotlightY = self.spotlightTarget.y;

// Draw the spotlight using a circular gradient
var segments = 64; // Adjust the number of segments for smoother edges
var angleStep = 360 / segments;
var innerRadius = radius * (1 - softness);

/*
// Store the tilemap layers in an array and sort them by depth
var layers = layer_get_all();
var instanceLayer = layer_get_id("Instances");
var tileLayers = [];

for (var i = 0; i < array_length(layers); i++) {
    var layerId = layers[i];
    if (layerId != instanceLayer) {
        tileLayers[array_length(tileLayers)] = layerId;
    }
}

array_sort(tileLayers, function(a, b) {
	var layerADepth = layer_get_depth(a);
	var layerBDepth = layer_get_depth(b);
	return layerADepth < layerBDepth
});

// Render tiles partially inside the spotlight in the original layer order
for (var i = 0; i < array_length(tileLayers); i++) {
    var tilesetLayer = tileLayers[i];
    var mapId = layer_tilemap_get_id(tilesetLayer);
    var tsId = tilemap_get_tileset(mapId);
    var tileWidth = tilemap_get_tile_width(mapId);
    var tileHeight = tilemap_get_tile_height(mapId);
    
    for (var tileY = 0; tileY < tilemap_get_height(mapId); tileY++) {
        for (var tileX = 0; tileX < tilemap_get_width(mapId); tileX++) {
            var tileData = tilemap_get(mapId, tileX, tileY);
            
            if (tileData != -1) {
                var tilePosX = tileX * tileWidth;
                var tilePosY = tileY * tileHeight;
                
                if (collision_circle(tilePosX + (tileWidth / 2), tilePosY + (tileHeight / 2), radius, self.spotlightTarget, false, true)) {
                    
                    draw_tile(tsId, tileData, 0, tilePosX, tilePosY);
                }
            }
        }
    }
}
*/
// Set the draw settings for the spotlight
gpu_set_blendmode(bm_add);
draw_set_color(color);
draw_set_alpha(softness);


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

/*
// Render partially inside the spotlight
with (obj_generic) {
	if(!should_draw || !visible){
		return
	}
    if (collision_circle(bbox_left, bbox_top, radius, self.spotlightTarget, false, true)) {
        var collisionX = clamp(x, spotlightX - radius, spotlightX + radius);
        var collisionY = clamp(y, spotlightY - radius, spotlightY + radius);
        var distance = point_distance(spotlightX, spotlightY, collisionX, collisionY);
        var alpha = 1 - (distance - innerRadius) / (radius - innerRadius);
        
		draw_sprite_general(sprite_index, image_index, 0, 0, sprite_width, sprite_height, x, y, 
			image_xscale, image_yscale, image_angle, image_blend, image_blend, image_blend, image_blend, alpha)

    }
}


/*
// Store the tilemap layers in an array and sort them by depth
var layers = layer_get_all();
var instanceLayer = layer_get_id("Instances");
var tileLayers = [];

for (var i = 0; i < array_length(layers); i++) {
    var layerId = layers[i];
    if (layerId != instanceLayer) {
        tileLayers[array_length(tileLayers)] = layerId;
    }
}

array_sort(tileLayers, function(a, b) {
	var layerADepth = layer_get_depth(a);
	var layerBDepth = layer_get_depth(b);
	return layerADepth < layerBDepth
});

// Render tiles partially inside the spotlight in the original layer order
for (var i = 0; i < array_length(tileLayers); i++) {
    var tilesetLayer = tileLayers[i];
    var mapId = layer_tilemap_get_id(tilesetLayer);
    var tsId = tilemap_get_tileset(mapId);
    var tileWidth = tilemap_get_tile_width(mapId);
    var tileHeight = tilemap_get_tile_height(mapId);
    
    for (var tileY = 0; tileY < tilemap_get_height(mapId); tileY++) {
        for (var tileX = 0; tileX < tilemap_get_width(mapId); tileX++) {
            var tileData = tilemap_get(mapId, tileX, tileY);
            
            if (tileData != -1) {
                var tilePosX = tileX * tileWidth;
                var tilePosY = tileY * tileHeight;
                
                if (collision_circle(tilePosX + (tileWidth / 2), tilePosY + (tileHeight / 2), radius, self.spotlightTarget, false, true)) {
                    
                    draw_tile(tsId, tileData, 0, tilePosX, tilePosY);
                }
            }
        }
    }
}
*/