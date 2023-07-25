/// @description Insert description here
// You can write your code in this editor


event_inherited()
should_draw = false;
didRoomStart = false
delayToStartCutscene = 0.5
didStartCutscene = false
self.current_opening_text = 0
self.opening_texts = [
	"...",
	"...",
	"Where am I?",
	"...",
	"Why is it so dark?",
	"... let's find a light switch"
];
self.targetedSpeechBubble = scr_create_target_speech_bubble(x, y, string_width("...") * 1.3, string_height("M") * 2, 16, opening_texts[current_opening_text], ThemeColor.Surface, obj_player)
self.targetedSpeechBubble.xPixels = 0
self.targetedSpeechBubble.xSeconds = 1.5
self.targetedSpeechBubble.pageDelay = 1.5
self.targetedSpeechBubble.textDisplayStyle = TextDisplayStyle.Typewriter
self.targetedSpeechBubble.reinitContent()
self.targetedSpeechBubble.onFinished = function() {
	if(self.current_opening_text >= array_length(self.opening_texts) - 1){
		self.targetedSpeechBubble.visible = false
		global.is_cut_scene_active = false
		instance_destroy(self.targetedSpeechBubble)
		return
	}
	self.targetedSpeechBubble.visible = false
	self.current_opening_text += 1
	self.targetedSpeechBubble.width = string_width(self.opening_texts[current_opening_text]) * 1.25
	self.targetedSpeechBubble.text = self.opening_texts[current_opening_text]
	self.targetedSpeechBubble.reinitContent()
	self.targetedSpeechBubble.visible = true
}