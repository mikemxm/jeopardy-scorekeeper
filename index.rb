#!/usr/bin/ruby

generate_table = lambda { |multiplier|

		html = ""

		for row_num in (1..5)

			html += "\t\t\t\t\t\t<tr>\n"

			for col_num in (1..6)
				clue_value = col_num * multiplier
				html += <<-EOS
							<td>
								<span>$#{clue_value}</span>
								<div>
									<button value="#{clue_value}">Correct</button>
									<button value="0">Didn't Answer</button>
									<button value="-#{clue_value}">Incorrect</button>
								</div>
							</td>" 
							EOS
			end

			html += "\t\t\t\t\t\t</tr>\n"

		end

		html

	}

# the argument is the value multiplied by the iterator to yield clue value
sj_table = generate_table.call(200)
dj_table = generate_table.call(400)

document = "Content-Type: text/html\n\nhoy"


=begin
document += <<EOD
<!DOCTYPE html>
<html>
	<head>
		<title>Jeopardy Scorekeeper</title>
		<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
	</head>
	<body>
		<h1>Jeopardy Scorekeeper</h1>
		<div id="container">
			<form>
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
					<thead>
					<tbody>
						#{sj_table}
					</tbody>
				</table>
			</form>
		</div>
		<script src="//code.jquery.com/jquery-latest.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>
EOD
=end

puts document