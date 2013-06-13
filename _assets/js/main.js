$(document).ready(function() {
	// Quote of the day
	var qotd = $('#quote-of-the-day');
	var allQuotes = $('#all-quotes li', qotd);
	// Gets a random quote
	var quote = allQuotes.eq(Math.floor(Math.random()*allQuotes.length)).text();
	if(quote !== null) qotd.text(quote);
	
	
	// Timeago
	$("abbr.timeago").timeago();
});
