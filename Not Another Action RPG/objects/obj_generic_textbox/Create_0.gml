/// @description Insert description here
// You can write your code in this editor

self.text = undefined;
self.width = undefined;
self.height = undefined;
self.cornerRadius = undefined;
self.colorEnum = undefined;
self.bgColor = undefined;
self.contrastingColor =undefined;
self.bezelColor = undefined;
self.textColor = undefined;
self.bezelThickness = undefined;
self.text_x = undefined;
self.text_y = undefined;
self.pageTexts = [];
self.currentPage = 0;
self.maxPages = 0;
// Set the maximum number of characters per page
self.charactersPerPage = 100;

self.x = x;
self.y = y;
self.text = text;
self.width = width;
self.height = height;
self.cornerRadius = cornerRadius;
self.colorEnum = colorEnum;
self.bgColor = scr_get_theme_color(colorEnum);
self.textColor = scr_get_contrasting_color(bgColor);
self.bezelColor = make_color_rgb(
    min(color_get_red(bgColor) + 50, 255),
    min(color_get_green(bgColor) + 50, 255),
    min(color_get_blue(bgColor) + 50, 255)
);
self.move_direction = 0;
self.debounce_timer = 0;


/// scr_split_text_into_pages(text, charactersPerPage)
///
/// Splits the given text into an array of pages with the specified number of characters per page.
///
/// Arguments:
///   - text: The full text to split into pages.
///   - charactersPerPage: The maximum number of characters per page.
///
/// Returns:
///   An array containing the text split into pages.
self.split_text_into_pages = function (text, charactersPerPage) {
    var pages = [];
    var words = string_split(text, " ");  // Split the text into an array of words
    var currentPageText = "";
    var currentCharCount = 0;
    
    // Iterate through each word in the array
    for (var i = 0; i < array_length_1d(words); i++) {
        var word = words[i];
        
        // Check if adding the word would exceed the maximum characters per page
        if (currentCharCount + string_length(word) > charactersPerPage) {
            // Add the current page text to the pages array
            pages[array_length_1d(pages)] = currentPageText;
            currentPageText = "";
            currentCharCount = 0;
        }
        
        // Add the word to the current page text
        currentPageText += word + " ";
        currentCharCount += string_length(word) + 1;  // Account for the space after the word
        
        // If the word alone exceeds the maximum characters per page, move it to the next page
        if (currentCharCount > charactersPerPage) {
            // Add the current page text to the pages array
            pages[array_length_1d(pages)] = currentPageText;
            currentPageText = "";
            currentCharCount = 0;
        }
    }
    
    // Add any remaining text to the pages array
    if (currentCharCount > 0) {
        pages[array_length_1d(pages)] = currentPageText;
    }
    
    return pages;
}


/// scr_next_page()
///
/// Displays the next page of text.
///
/// This function should be called when the user wants to go to the next page.
self.next_page = function() {
    currentPage++;
    
    // Wrap around to the first page if the last page is reached
    if (currentPage >= maxPages) {
        currentPage = 0;
    }
}

/// scr_previous_page()
///
/// Displays the previous page of text.
///
/// This function should be called when the user wants to go to the previous page.
self.previous_page = function() {
    currentPage--;
    
    // Wrap around to the last page if the first page is reached
    if (currentPage <= 0) {
        currentPage = maxPages - 1;
    }
}

/// scr_calculate_max_characters(text, width, height, fontSize)
///
/// Calculates the maximum number of characters that can fit within the given width, height, and font size.
///
/// Arguments:
///   - text: The sample text used to determine the width of a single character.
///   - width: The maximum width in pixels.
///   - height: The maximum height in pixels.
///   - fontSize: The font size in points.
///
/// Returns:
///   The maximum number of characters that can fit within the given dimensions.

self.calculate_max_characters = function (text, width, height, fontSize) {
    var maxCharacters = 0;
    
    while (maxCharacters < string_length(text)) {
        var measuredText = string_copy(text, 1, maxCharacters + 1);
        var measuredWidth = string_width_ext(measuredText, fontSize, width);
        var measuredHeight = string_height_ext(measuredText, fontSize, width);
        
        if (measuredWidth <= width && measuredHeight <= height) {
            maxCharacters++;
        } else {
            break;
        }
    }
    
    return maxCharacters;
}
