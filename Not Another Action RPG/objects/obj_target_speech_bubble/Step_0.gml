/// @description obj_target_speech_bubble Step Event
// You can write your code in this editor
if(!visible) {
	exit
}
// Check if there are multiple pages and if enough time has passed to move to the next page
if (maxPages > 1 && currentPage < maxPages - 1) {
    pageDelay -= delta_time / 1000000; // Subtract the elapsed time

    if (pageDelay <= 0) {
        // Move to the next page
        currentPage++;
        if (currentPage >= maxPages) {
			if(self.onFinished != undefined){
				self.onFinished();
			}
        }
        
        // Reset the page delay for the next page
        pageDelay = xSeconds;
    }
} else if(maxPages == 1 && currentPage == 0) {
    pageDelay -= delta_time / 1000000; // Subtract the elapsed time
	
	if (pageDelay <= 0) {
		if(self.onFinished != undefined){
			self.onFinished();
        }
        
        // Reset the page delay for the next page
        pageDelay = xSeconds;
    }
} else if(currentPage == maxPages - 1) {
    pageDelay -= delta_time / 1000000; // Subtract the elapsed time

    if (pageDelay <= 0) {
		if(self.onFinished != undefined){
			self.onFinished();
		}
        
        // Reset the page delay for the next page
        pageDelay = xSeconds;
    }
}
