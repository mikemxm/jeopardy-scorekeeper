var sj_score = 0, dj_score = 0, total_score = 0

$('label').mousedown(function() {
	$(this).addClass("pressed")
});

$('label').mouseup(function() {
	$(this).removeClass("pressed")
});
