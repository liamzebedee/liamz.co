// Quote of the day
$(document).ready(function() {
	var quotes = [
		'Money is simply a unit of exchange.',
		'Psalm 137:9 - Happy is the one who seizes your infants and dashes them against the rocks.',
		'I met a man with a dollar. We exchanged dollars. We each still had one dollar. Then I met a man with an idea. We exchanged ideas. Now we each have two ideas.',
		'We judge ourselves by our intentions and judge others by their actions.',
		"You are who you are when nobody's watching.",
		"If I am, death is not. If death is, I am not. Why fear that which cannot exist when I do?",
		"Showing your own mediocrity is a sin",
		"When I was 5 years old, my mother always told me that happiness was the key to life. When I went to school, they asked me what I wanted to be when I grew up. I wrote down 'happy'. They told me I didn’t understand the assignment, and I told them they didn’t understand life.",
		"The State (humanitarianism) forbade in those days the murder of one person, but it did not forbid the killing of millions slowly and by inches."
	];
	var quoteOTD = quotes[Math.floor(Math.random()*quotes.length)];
	$('#quote-of-the-day').text(quoteOTD);
});
