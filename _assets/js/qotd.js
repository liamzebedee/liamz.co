// Quote of the day
$(document).ready(function() {
	var qotd = $('#quote-of-the-day');
	var allQuotes = $('#all-quotes li', qotd);
	// Gets a random quote
	var quote = allQuotes.eq(Math.floor(Math.random()*allQuotes.length)).text();
	if(quote !== null) qotd.text(quote);
});
