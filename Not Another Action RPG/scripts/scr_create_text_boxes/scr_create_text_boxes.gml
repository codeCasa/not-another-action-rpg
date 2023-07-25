enum TextDisplayStyle {
    Normal,
    Typewriter
}


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

function scr_create_target_speech_bubble(x, y, width, height, cornerRadius, text, colorEnum, target){
	var tb = instance_create_layer(x, y, "Instances", obj_target_speech_bubble)
	tb.x = x
	tb.y = y
	tb.text = text
	tb.width = width
	tb.height = height
	tb.cornerRadius = cornerRadius
	tb.colorEnum = colorEnum
	tb.speechTargetObj = target
	return tb
}

function scr_create_text_box_with_choices(x, y, width, height, cornerRadius, hint, choices, colorEnum){
	var tb = instance_create_layer(x, y, "Instances", obj_generic_choice_box)
	tb.x = x
	tb.y = y
	tb.hint = hint
	tb.choices = choices
	tb.width = width
	tb.height = height
	tb.cornerRadius = cornerRadius
	tb.colorEnum = colorEnum
	tb.initColors()
	return tb
}