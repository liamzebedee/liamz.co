$(document).ready(function() {
	// Quote of the day
	var qotd = $('#quote-of-the-day');
	var allQuotes = $('#all-quotes li blockquote', qotd);
	// Gets a random quote
	var quote = allQuotes.eq(Math.floor(Math.random()*allQuotes.length));
	if(quote !== null) $('#quote', qotd).html(quote.html());
	
	
	// Timeago
	$("time.timeago").timeago();
});
