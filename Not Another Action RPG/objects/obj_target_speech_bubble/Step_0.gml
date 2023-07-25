/// @description obj_target_speech_bubble Step Event
// You can write your code in this editor
if(!visible) {
	exit
}
if(self.textDisplayStyle == TextDisplayStyle.Normal){
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
		    // Reset typewriter effect variables
		    textCharsToShow = 0;
		    typewriterTimer = 0;
	    }
	} else if(maxPages == 1 && currentPage == 0) {
	    pageDelay -= delta_time / 1000000; // Subtract the elapsed time
	
		if (pageDelay <= 0) {
			if(self.onFinished != undefined){
				self.onFinished();
	        }
        
	        // Reset the page delay for the next page
	        pageDelay = xSeconds;
		    // Reset typewriter effect variables
		    textCharsToShow = 0;
		    typewriterTimer = 0;
	    }
	} else if(currentPage == maxPages - 1) {
	    pageDelay -= delta_time / 1000000; // Subtract the elapsed time

	    if (pageDelay <= 0) {
			if(self.onFinished != undefined){
				self.onFinished();
			}
        
	        // Reset the page delay for the next page
	        pageDelay = xSeconds;
		    // Reset typewriter effect variables
		    textCharsToShow = 0;
		    typewriterTimer = 0;
	    }
	}
}

// Typewriter effect logic
if (self.textDisplayStyle == TextDisplayStyle.Typewriter) {
    if (!isTypewriterFinished) {
        typewriterTimer -= delta_time / 1000000;

        if (typewriterTimer <= 0) {
            // Increment the number of characters to show on each typewriter tick
            textCharsToShow += 1;
            typewriterTimer = 1.0 / typewriterSpeed; // Typewriter tick rate

            if (textCharsToShow >= string_length(pageTexts[currentPage])) {
                // Typewriter effect completed for this page
                textCharsToShow = string_length(pageTexts[currentPage]);
                isTypewriterFinished = true; // Set the flag to true
                typewriterTimer = pageDelay; // Wait for pageDelay before moving to the next page
            }
        }
    } else {
        // Waiting period after typing the last characters
        typewriterTimer -= delta_time / 1000000;

        if (typewriterTimer <= 0) {
            // Move to the next page and reset the typewriter effect
            currentPage++;
            if (currentPage >= maxPages) {
                if (self.onFinished != undefined) {
                    self.onFinished();
                }
            }
            // Reset typewriter effect variables for the next page
            textCharsToShow = 0;
            typewriterTimer = 0;
            isTypewriterFinished = false; // Reset the typewriter finished flag
        }
    }
}


