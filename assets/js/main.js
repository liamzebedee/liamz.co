$(document).ready(function() {
	$('#thegrey-wrapper').height($("#thegrey-wrapper").height());
	$('#thegrey').affix({
		offset: $('#thegrey').position()
	});
});
