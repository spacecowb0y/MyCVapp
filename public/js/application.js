$(document).ready(function(){
	$('#screenshots a').hover(
		function () {
			$(this).stop().fadeTo(300, 0.6);
		}, 
		function () {
			$(this).stop().fadeTo(300, 1);
	});
	$('.join form').validate();
});