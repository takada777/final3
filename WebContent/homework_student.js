var socket = io.connect("http://192.168.11.10:8081/homework_student", {
	'reconnection' : true,
	'reconnectionDelay' : 1000,
	'reconnectionDelayMax' : 5000,
	'reconnectionAttempts' : 5
});

socket.on("homework_student", function(rows) {
	homework_student(rows);
});

function homework_student(rows) {
	$("#sql").html("");

	var table = '<table class="uk-table uk-table-striped uk-table-large uk-width-xxlarge"><thead><tr><th>宿題名</th><th>配布日</th><th>提出期限</th><th></th></tr></thead><tbody>';
	for (var i = 0; i < rows.length; i++) {
		console.log("a");
		table += '<tr>'
				+ '<td>'
				+ rows[i].question_name
				+ '</td>'
				+ '<td>'+ rows[i].distribution_date.slice(0,10) + '</td><td>'
				+ rows[i].deadline_date.slice(0,10) + '</td>'
				+ '<td><button class="uk-button uk-button-default" onclick="clickBtn('+ rows[i].question_id+',' + rows[i].homework_id +')" type="submit" name="homework_id" value='
				+ rows[i].homework_id + '>解く</button></td>'
				+ '</tr>';

	}
	table += "</tbody></table>"
	$("#sql").append(table);
}

window.onload = function() {
	var user_id = document.getElementById("user_id");
	console.log(user_id.value);

	socket.emit("homework_student",user_id.value);
}

function clickBtn(id,hw_id) {
	location.href = 'http://192.168.11.10:8080/g-learning/homework_question.jsp?name=' +  encodeURIComponent(id) + '?id=' +  encodeURIComponent(hw_id);
};

