/// @description Insert description here
// You can write your code in this editor
if(self.text != undefined 
	&& array_length(self.pageTexts) == 0 
	&& string_length(self.text) > 0){
	self.charactersPerPage = self.calculate_max_characters(self.text, width, height - (cornerRadius*2), string_height("M"))
	self.pageTexts = self.split_text_into_pages(self.text, self.charactersPerPage)
	self.maxPages = array_length(self.pageTexts)
}