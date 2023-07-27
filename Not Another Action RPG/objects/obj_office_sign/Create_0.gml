/// @description Insert description here
// You can write your code in this editor

isActive = true
timeToDismissTb = 1.2
var tbText = "Test Room"
textbox = scr_create_generic_text_box(x + 50, y, string_width(tbText), string_height("M") * 3.5, 16, tbText, ThemeColor.Surface, "TextBoxInstances")
textbox.visible = false
didTriggerSignCallback = false