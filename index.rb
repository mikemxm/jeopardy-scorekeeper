#!/usr/bin/ruby


generate_table = lambda { |multiplier|

		html = ""
		jeopardy_round = (multiplier/200 == 1) ? "sj" : "dj"

		for row_num in (1..5)

			clue_value = row_num * multiplier
			html += "\t\t\t\t\t\t<tr>\n"
			
			for col_num in (1..6)
				html += <<-EOS
							<td>
								<div>$#{clue_value}</div>
								<div>
									<span>$#{clue_value}</span>
									<div class="custom-radio">
										<input type="radio" name="#{jeopardy_round}#{row_num}#{col_num}" id="#{jeopardy_round}#{row_num}#{col_num}correct" value="#{clue_value}">
										<label for="#{jeopardy_round}#{row_num}#{col_num}correct" class="correct"> </label>
									</div>
									<div class="custom-radio">
										<input type="radio" name="#{jeopardy_round}#{row_num}#{col_num}" id="#{jeopardy_round}#{row_num}#{col_num}da" class="didnt-answer" value="0" checked="checked">
										<label for="#{jeopardy_round}#{row_num}#{col_num}da" class="didnt-answer"> </label>
									</div>
									<div class="custom-radio">
										<input type="radio" name="#{jeopardy_round}#{row_num}#{col_num}" id="#{jeopardy_round}#{row_num}#{col_num}incorrect" class="incorrect" value="-#{clue_value}">
										<label for="#{jeopardy_round}#{row_num}#{col_num}incorrect" class="incorrect"> </label>
									</div>
								</div>
							</td>
							EOS
			end

			html += "\t\t\t\t\t\t</tr>\n"

		end

		html

	}


# the argument is the value multiplied by the iterator to yield clue value
sj_table = generate_table.call(200)
dj_table = generate_table.call(400)

dontcache_num = Time.now

document = "Content-Type: text/html\n\n"

document += <<EOD
<!DOCTYPE html>
<html>
	<head>
		<title>Jeopardy Scorekeeper</title>
		<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="css/jeopardy.css?dontcache=#{dontcache_num}" rel="stylesheet" media="screen">
	</head>
	<body>
		<div id="score-display">
			<div id="sj-score" class="score-zero">
				<span>Single Jeopardy Score</span>
				<span class="current-score">$ 0</span>
			</div> 
			<div id="dj-score" class="score-zero">
				<span>Double Jeopardy Score</span>
				<span class="current-score">$ 0</span>
			</div>
			<div id="total-score" class="score-zero">
				<span>Total Score</span>
				<span class="current-score">$ 0</span>
			</div>
		</div>
		<div class="container">
			<form id="sj">
				<table class="scoreboard sj">
					<thead>
						<tr>
							<th><textarea>\n\rSJ Category 1</textarea></th>
							<th><textarea>\n\rSJ Category 2</textarea></th>
							<th><textarea>\n\rSJ Category 3</textarea></th>
							<th><textarea>\n\rSJ Category 4</textarea></th>
							<th><textarea>\n\rSJ Category 5</textarea></th>
							<th><textarea>\n\rSJ Category 6</textarea></th>
						</tr>
					</thead>
					<tbody>
						#{sj_table}
					</tbody>
				</table>
			</form>
			<form id="dj">
				<table class="scoreboard dj">
					<thead>
						<tr>
							<th><textarea>\n\rDJ Category 1</textarea></th>
							<th><textarea>\n\rDJ Category 2</textarea></th>
							<th><textarea>\n\rDJ Category 3</textarea></th>
							<th><textarea>\n\rDJ Category 4</textarea></th>
							<th><textarea>\n\rDJ Category 5</textarea></th>
							<th><textarea>\n\rDJ Category 6</textarea></th>
						</tr>
					</thead>
					<tbody>
						#{dj_table}
					</tbody>
				</table>
			</form>
		</div>
		<script src="//code.jquery.com/jquery-latest.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jeopardy.js?dontcache=#{dontcache_num}"></script>
		<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-37667606-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
	</body>
</html>
EOD


puts document