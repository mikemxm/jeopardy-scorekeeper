#!/usr/bin/ruby

require 'rubygems'



puts "Content-Type: text/html\n\n"

sj_table = (lambda {
	return "hello world"
	}).call 

document = <<EOD
<!DOCTYPE html>
<html>
	<head>
		<title>Jeopardy Scorekeeper</title>
		<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
	</head>
	<body>
		<h1>Jeopardy Scorekeeper</h1>
		<div id="container">
			<table class="scoreboard sj">
				<thead>
					<tr>
						<th><textarea>SJ Category 1</textarea></th>
						<th><textarea>SJ Category 2</textarea></th>
						<th><textarea>SJ Category 3</textarea></th>
						<th><textarea>SJ Category 4</textarea></th>
						<th><textarea>SJ Category 5</textarea></th>
					</tr>
				<thead>
				<tbody>
					#{sj_table}
				</tbody>
			</table>
		</div>
		<script src="//code.jquery.com/jquery-latest.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>
EOD

puts document