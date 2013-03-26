$(document).ready(function() {
	// Auto-affix
	$('#thegrey-wrapper').height($("#thegrey-wrapper").height());
	$('#thegrey').affix({
		offset: $('#thegrey').position()
	});
	
	// Responsive masthead
	$('#masthead h1').fitText({
		maximumFontSize: 80,
	});
	$('#masthead h2').fitText({
		maximumFontSize: 24,
	});
});
