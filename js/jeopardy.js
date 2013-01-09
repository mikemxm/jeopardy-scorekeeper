var sj_score = 0, dj_score = 0, total_score = 0;

function update_totals() {

	sj_score = 0, dj_score = 0, total_score = 0;

	sj_score = sum_of_form("sj")
	dj_score = sum_of_form("dj")
	total_score = sj_score + dj_score;
	console.log(sj_score)
	console.log(dj_score)
	console.log(total_score)
}

function sum_of_form(form_id) {
	var running_total = 0
	$("form#" + form_id + " input:checked").each(function() {
		running_total += parseInt(this.value)
	});
	return running_total
}

$('label').mousedown(function() {
	$(this).addClass("pressed")
});

$('label').mouseup(function() {
	$(this).removeClass("pressed")
});

$('label').change(function() {
	update_totals()
});