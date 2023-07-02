

function scr_max_array_value(dataValues = []){
	// Calculate the maximum data value
	var maxValue = dataValues[0];
	for (var i = 1; i < array_length(dataValues); i++) {
	    if (dataValues[i] > maxValue) {
	        maxValue = dataValues[i];
	    }
	}
	return maxValue
}