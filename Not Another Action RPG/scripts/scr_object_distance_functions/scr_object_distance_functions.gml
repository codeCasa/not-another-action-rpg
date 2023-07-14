// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// Performs a radial search to check if objB is within xPixels distance of objA's bounding box.

function scr_is_object_within_distance_of(objA, objB, c) {
	// Calculate the radius of the circle using the given circumference
	var radius = c / (2 * pi);

	// Calculate the position of the circle's center
	var centerX = objB.x;
	var centerY = objB.y;


	// Check if the circle intersects objA
	if (collision_circle(centerX, centerY, radius, objA, false, false))
	{
	    return true;
	}
	else
	{
	    return false;
	}
}

/// scr_is_coordinate_outside_circle(tx, ty, cx, cy, r)
/// Checks if the test coordinate (tx, ty) is outside the circle with center (cx, cy) and radius r.
/// Returns true if the coordinate is outside the circle, false otherwise.
function scr_is_coordinate_outside_circle(tx, ty, cx, cy, r)
{
    var dx = tx - cx;
    var dy = ty - cy;
    var distance = sqrt(dx * dx + dy * dy);
    
    return distance > r;
}
