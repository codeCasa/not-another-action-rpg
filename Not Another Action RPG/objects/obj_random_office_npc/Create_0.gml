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
	"Yea I know its a strange one, but we can't choose our names right.",
	"This place? I'm not too sure. I only know that I'm supposed to keep walking in this loop.",
	"See ya '???'"
];
self.player_text_index = 0
self.playerTextOptions = [
	string_concat(objName, ", that's a *uhh* interesting. ", "But nice to meet you ", objName, " I'm '???'"),
	"Can I ask you a question?",
	"Where are we?",
	"*blink* *blink*",
	"That was weird..."
];

myTargettedSpeechBox =  scr_create_target_speech_bubble(x, y, string_width(myTextOptions[my_current_text_index]) * 1.15, 
	string_height("M") * 2, 16, myTextOptions[my_current_text_index], ThemeColor.Surface, self, "TextBoxInstances");
playerTargettedSpeechBox =  scr_create_target_speech_bubble(x, y, min(string_width(playerTextOptions[player_text_index]), 400), 
	string_height("M") * 2, 16, playerTextOptions[player_text_index], ThemeColor.Surface, obj_player, "TextBoxInstances")

self.myTargettedSpeechBox.xPixels = 30
self.myTargettedSpeechBox.xSeconds = 1.2
self.myTargettedSpeechBox.pageDelay = 1.2
self.myTargettedSpeechBox.textDisplayStyle = TextDisplayStyle.Typewriter
self.myTargettedSpeechBox.typewriterSpeed *= 2
self.myTargettedSpeechBox.reinitContent()

self.playerTargettedSpeechBox.xPixels = 30
self.playerTargettedSpeechBox.xSeconds = 1.2
self.playerTargettedSpeechBox.pageDelay = 1.2
self.playerTargettedSpeechBox.textDisplayStyle = TextDisplayStyle.Typewriter
self.playerTargettedSpeechBox.typewriterSpeed *= 2
self.playerTargettedSpeechBox.reinitContent()

// Speeking order 
// N, N, P, N, P, P, N, P, N, P
// 0, 1, 0, 2, 1, 2, 3, 3, 4, 4
self.myTargettedSpeechBox.onFinished = function() {
	var switchOverToPlayerSpeech = [2, 3, 4]
	self.myTargettedSpeechBox.visible = false
	self.my_current_text_index += 1
	if(self.my_current_text_index >= array_length(self.myTextOptions)){
		self.playerTargettedSpeechBox.visible = true
		return
	}
	self.myTargettedSpeechBox.width = min(string_width(self.myTextOptions[my_current_text_index]), 400)
	self.myTargettedSpeechBox.text = self.myTextOptions[my_current_text_index]
	self.myTargettedSpeechBox.reinitContent()
	if(array_contains(switchOverToPlayerSpeech, my_current_text_index)){
		self.playerTargettedSpeechBox.visible = true
		return
	}
	self.myTargettedSpeechBox.visible = true
}

self.playerTargettedSpeechBox.onFinished = function() {
	var switchOverToMe = [1,3,4]
	self.playerTargettedSpeechBox.visible = false
	self.player_text_index += 1
	if(self.player_text_index >= array_length(self.playerTextOptions)){
		my_current_text_index = 0
		player_text_index = 0
		isShowingMessageAlready = false
		
		
		self.myTargettedSpeechBox.width = string_width(self.myTextOptions[my_current_text_index])
		self.myTargettedSpeechBox.text = self.myTextOptions[my_current_text_index]
		self.myTargettedSpeechBox.reinitContent()
		
		self.playerTargettedSpeechBox.width = min(string_width(self.playerTextOptions[player_text_index]), 400)
		self.playerTargettedSpeechBox.text = self.playerTextOptions[player_text_index]
		self.playerTargettedSpeechBox.reinitContent()
		return
	}
	self.playerTargettedSpeechBox.width = min(string_width(self.playerTextOptions[player_text_index]), 400)
	self.playerTargettedSpeechBox.text = self.playerTextOptions[player_text_index]
	self.playerTargettedSpeechBox.reinitContent()
	if(array_contains(switchOverToMe, player_text_index)){
		self.myTargettedSpeechBox.visible = true	
		return
	}
	self.playerTargettedSpeechBox.visible = true
}