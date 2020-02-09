var socket = io.connect("http://192.168.11.10:8081/question_select",{
	'reconnection': true,
	'reconnectionDelay': 1000,
	'reconnectionDelayMax' : 5000,
	'reconnectionAttempts': 5
});

socket.on("subjectselect", function(rows) {
	subjectselect(rows);
});

socket.on("qu_select", function(rows) {
	qu_select(rows);
});

socket.on("homework_add", function(rows) {
	kanryou();
});

socket.on("classselect", function(rows) {
	classselect(rows);
});

socket.on("student", function(rows) {
	student(rows);
});

socket.on("date_err", function(rows) {
	date_err();
});

socket.emit("subjectselect");

function subjectselect(rows) {
	var select = '<select class="uk-select uk-form-width-medium" name="homework" id="subject">'
			+ '<option value="0">教科を選択してください</option>';
	for (var i = 0; i < rows.length; i++) {
		select += '<option id="1" value=' + rows[i].subject_id + '>'
				+ rows[i].subject_name + '</option>';
	}
	select += "</select>";
	$("#homeworkselect").append(select);
}

function qu_select(rows) {
	$("#qukekka").html("");
	var table = '<table class="uk-table uk-table-striped uk-table-large uk-width-xxlarge"><thead><tr><th>問題名</th><th class="uk-width-small"></tr></thead><tbody>';

	for (var i = 0; i < rows.length; i++) {
		table += '<tr>'
			+'<td>'+ rows[i].question_name +'</td>'
			+'<td><button type="submit" class="uk-button uk-button-default" onclick="clickBtn(' + rows[i].question_id + ')" value= '+ rows[i].question_id+'>解く</button></td>'
			+'</tr>';


	}
	table += "</tbody></table>"
	$("#qukekka").append(table);

}

$(document).on('change', '#subject', function() {
	var val = $(this).val();
	console.log(val);
	socket.emit("qu_select", val);
});

function clickBtn(id) {
	location.href = 'http://192.168.11.10:8080/g-learning/question.jsp?name=' +  encodeURIComponent(id);
};

