var sj_score = 0, dj_score = 0, total_score = 0;

function update_totals() {

	sj_score = 0, dj_score = 0, total_score = 0;

	sj_score = sum_of_form("sj")
	dj_score = sum_of_form("dj")
	total_score = sj_score + dj_score;
	display_score("sj-score",sj_score)
	display_score("dj-score",dj_score)
	display_score("total-score",total_score)
}

function display_score(id, score) {
	if (score == 0) {
		active_class = "score-zero"
		inactive_classes = "score-positive score-negative"
	} else if (score < 0) {
		active_class = "score-negative"
		inactive_classes = "score-positive score-zero"
	} else {
		active_class = "score-positive"
		inactive_classes = "score-zero score-negative"		
	}

	$( "#"+id+" .current-score" ).addClass(active_class).removeClass(inactive_classes).html("$ "+score)

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

$('input').change(function() {
	update_totals()
});


/* Clue Hover Behavior:                                    */
/* * Note: didn't use .toggle() because .toggle() doesn't  
		know to set the answer button div to block         */
$('td').mouseenter(function() {
/* * Show answer buttons when mouseover a clue value...    */
	$(">div:first-child",this).css('display','none')
	$(">div:last-child",this).css('display','block')
});
$('td').mouseleave(function() {
/* * ...and hide them onmouseout                           */
	$(">div:last-child",this).css('display','none')
	$(">div:first-child",this).css('display','block')

});
