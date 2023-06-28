function scr_create_generic_text_box(x, y, width, height, cornerRadius, text, colorEnum){
	var tb = instance_create_layer(x, y, "Instances", obj_generic_textbox)
	tb.x = x
	tb.y = y
	tb.text = text
	tb.width = width
	tb.height = height
	tb.cornerRadius = cornerRadius
	tb.colorEnum = colorEnum
	return tb
}