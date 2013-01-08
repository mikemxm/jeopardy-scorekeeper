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
								<span>$#{clue_value}</span>
								<div>
									<input type="radio" name="#{jeopardy_round}#{row_num}#{col_num}" class="correct" value="#{clue_value}">
									<input type="radio" name="#{jeopardy_round}#{row_num}#{col_num}" class="didnt-answer" value="0" checked="checked">
									<input type="radio" name="#{jeopardy_round}#{row_num}#{col_num}" class="incorrect" value="-#{clue_value}">
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
		<h1>Jeopardy Scorekeeper</h1>
		<div class="container">
			<form>
				<h2>Single Jeopardy</h2>
				<table class="scoreboard sj">
					<thead>
						<tr>
							<th><textarea>SJ Category 1</textarea></th>
							<th><textarea>SJ Category 2</textarea></th>
							<th><textarea>SJ Category 3</textarea></th>
							<th><textarea>SJ Category 4</textarea></th>
							<th><textarea>SJ Category 5</textarea></th>
							<th><textarea>SJ Category 6</textarea></th>
						</tr>
					</thead>
					<tbody>
						#{sj_table}
					</tbody>
				</table>


				<h2>Double Jeopardy</h2>
				<table class="scoreboard dj">
					<thead>
						<tr>
							<th><textarea>DJ Category 1</textarea></th>
							<th><textarea>DJ Category 2</textarea></th>
							<th><textarea>DJ Category 3</textarea></th>
							<th><textarea>DJ Category 4</textarea></th>
							<th><textarea>DJ Category 5</textarea></th>
							<th><textarea>DJ Category 6</textarea></th>
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
	</body>
</html>
EOD


puts document