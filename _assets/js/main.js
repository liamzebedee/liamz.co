$(document).ready(function() {
	if (typeof window.console === 'object' && typeof window.console.log === 'function') {
    window.console.log('Salutations! My website is completely open-source, so you might find it easier to view the source at http://github.com/liamzebedee/liamz.co');
  }
  $(".owl-carousel").owlCarousel({
      autoPlay: 3000, //Set AutoPlay to 3 seconds
      items : 1,
  });
});
