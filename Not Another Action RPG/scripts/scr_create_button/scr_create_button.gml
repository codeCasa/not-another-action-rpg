function scr_create_generic_button(x, y, text, width, height, cornerRadius, colorEnum) {
	var button = instance_create_layer(x, y, "Instances", obj_generic_button)
	button.x = x
	button.y = y
	button.text = text
	button.width = width
	button.height = height
	button.cornerRadius = cornerRadius
	button.colorEnum = colorEnum
	return button
}