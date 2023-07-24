/// @description Insert description here
// You can write your code in this editor


if(didStartCutscene || !didRoomStart) {
	exit
}

delayToStartCutscene -= delta_time / 1000000

didStartCutscene = delayToStartCutscene <= 0
if(didStartCutscene) {
	self.targetedSpeechBubble.visible = true
}