function scr_create_pause_menu(x, y, width, height, cornerRadius, colorEnum, choices, meta1Data, meta2Data) {
    var tb = instance_create_layer(x, y, "Instances", obj_main_pause_menu)
	tb.x = x
	tb.y = y
	tb.choices = choices
	tb.width = width
	tb.height = height
	tb.cornerRadius = cornerRadius
	tb.bezelThickness =  min(width, height) * 0.008;
	tb.colorEnum = colorEnum
	tb.meta1Data = meta1Data
	tb.meta2Data = meta2Data
	tb.initDrawVariables()
	return tb
}
