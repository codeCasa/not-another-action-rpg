/// @description Insert description here
// You can write your code in this editor

event_inherited()

idle_sprite = spr_random_office_mate_idle
walking_sprite = spr_random_office_mate_walking
npc_path = pth_random_office_mate
visible = false
isShowingMessageAlready = false
objName = "NPC 1"

self.my_current_text_index = 0
self.myTextOptions = [
	"Oh hey!",
	string_concat("My name is ", objName),
	"Yea I know, but we can't our names right.",
	"This place? I'm not sure. I only know that I'm supposed to keep walking in this loop.",
	"See ya '???'"
];
self.player_text_index = 0
self.playerTextOptions = [
	string_concat(objName, ", that's a uhh interesting.", "But nice to meet you ", objName, "I'm '???'"),
	"Can I ask you a question?",
	"Where are we?",
	"*blink* *blink*",
	"That was weird..."
];

myTargettedSpeechBox =  scr_create_target_speech_bubble(x, y, string_width(myTextOptions[my_current_text_index]) * 1.3, 
	string_height("M") * 2, 16, myTextOptions[my_current_text_index], ThemeColor.Surface, self, "TextBoxInstances");
playerTargettedSpeechBox =  scr_create_target_speech_bubble(x, y, string_width(playerTextOptions[player_text_index]) * 1.3, 
	string_height("M") * 2, 16, opening_texts[current_opening_text], ThemeColor.Surface, obj_player, "TextBoxInstances")

self.myTargettedSpeechBox.xPixels = 50
self.myTargettedSpeechBox.xSeconds = 2
self.myTargettedSpeechBox.pageDelay = 2
self.myTargettedSpeechBox.textDisplayStyle = TextDisplayStyle.Typewriter
self.myTargettedSpeechBox.reinitContent()

// Speeking order 
// N, N, P, N, P, P, N, P, N, P
// 0, 1, 0, 2, 1, 2, 3, 3, 4, 4
self.myTargettedSpeechBox.onFinished = function() {
	self.myTargettedSpeechBox.visible = false
	self.my_current_text_index += 1
	if(self.my_current_text_index >= array_length(self.myTextOptions)){
		return
	}
	self.myTargettedSpeechBox.width = string_width(self.myTextOptions[my_current_text_index]) * 1.25
	self.myTargettedSpeechBox.text = self.myTextOptions[my_current_text_index]
	self.myTargettedSpeechBox.reinitContent()
	self.myTargettedSpeechBox.visible = true
}

self.playerTargettedSpeechBox.onFinished = function() {

}