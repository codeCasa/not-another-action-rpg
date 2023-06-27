function scr_exit_to_desktop(){

	// Close the game based on the operating system
	switch (os_type) {
	    case os_windows:
	        game_end();
	        break;
	    case os_macosx:
	        game_end();
	        break;
	    case os_linux:
	        game_end();
	        break;
	    case os_gxgames:
	        game_end();
	        break;
	    default:
	        show_message("Closing the game...");
	        break;
	}
}