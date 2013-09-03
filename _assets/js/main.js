$(document).ready(function() {
	if (typeof window.console === 'object' && typeof window.console.log === 'function') {
    window.console.log('Salutations! My website is completely open-source, so you might find it easier to view the source at http://github.com/liamzebedee/liamz.co');
  }

  // Quote of the day
	var qotd = $('#quote-of-the-day');
	var allQuotes = $('#all-quotes li blockquote', qotd);
	// Gets a random quote
	var quote = allQuotes.eq(Math.floor(Math.random()*allQuotes.length));
	if(quote !== null) $('#quote', qotd).html(quote.html());


	// Timeago
	$("time.timeago").timeago();
});
