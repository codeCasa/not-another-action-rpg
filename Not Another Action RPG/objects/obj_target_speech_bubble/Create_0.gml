/// @description Insert description here
// You can write your code in this editor

event_inherited()
self.textDisplayStyle = TextDisplayStyle.Normal
self.speechTargetObj = undefined
self.xPixels = 25
self.onFinished = undefined
// Time in seconds to wait before moving to the next page
self.xSeconds = 4;
self.pageDelay = 4;
self.textCharsToShow = 0;
self.typewriterSpeed = 10; // Adjust the speed of the typewriter effect here (higher value means faster typing)
self.typewriterTimer = 0;
self.isTypewriterFinished = false; // Flag to track if the typewriter effect is finished

