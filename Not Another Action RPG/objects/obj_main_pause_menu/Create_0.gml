/// @description Insert description here
// You can write your code in this editor

self.colorEnum = undefined
self.selectedTextColor = scr_get_theme_color(ThemeColor.Selected);
self.selectedIndex = 0
self.debounce_timer = 0
self.menu_move_direction = 0
self.onSelected = undefined


self.initDrawVariables = function (){
	self.mainPanelWidth = width * 0.67;
    self.mainPanelHeight = height;
    self.mainPanelX = x;
    self.mainPanelY = y;
    self.choicesPanelWidth = width * 0.33;
    self.choicesPanelHeight = height * 0.75;
    self.choicesPanelX = x + width - choicesPanelWidth + 16;
    self.choicesPanelY = y;
    self.meta1PanelWidth = width * 0.33;
    self.meta1PanelHeight = height * 0.15;
    self.meta1PanelX = x + width - meta1PanelWidth + 16;
    self.meta1PanelY = choicesPanelY + choicesPanelHeight + 10;
    self.meta2PanelWidth = width * 0.33;
    self.meta2PanelHeight = height * 0.1;
    self.meta2PanelX = x + width - meta2PanelWidth + 16;
    self.meta2PanelY = meta1PanelY + meta1PanelHeight + (meta2PanelHeight - cornerRadius);
    self.backgroundColor = scr_get_theme_color(colorEnum);
    self.lighterColor = scr_get_lighter_color(backgroundColor, 0.5);
    self.textColor = scr_get_contrasting_color(backgroundColor);
	
	mainPanelHeight = meta2PanelY - meta2PanelHeight * 2.05
}