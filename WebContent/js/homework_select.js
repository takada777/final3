var socket = io.connect("http://192.168.11.10:8081/homework_select", {
	'reconnection' : true,
	'reconnectionDelay' : 1000,
	'reconnectionDelayMax' : 5000,
	'reconnectionAttempts' : 5
});

socket.on("subjectselect", function(rows) {
	subjectselect(rows);
});

socket.on("homeworkselect", function(rows) {
	homeworkselect(rows);
});

socket.on("homework_add", function() {
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

socket.emit("classselect");

function kanryou() {
	UIkit.modal("#kanryou").show();
}

$("#date").append(
		'<input type="date" name="date" min="' + getNowDateWithString()
				+ '" value="' + getNowDateWithString() + '">');

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

function homeworkselect(rows) {
	$("#hwkeka").html("");
	for (var i = 0; i < rows.length; i++) {
		$("#hwkeka").append(
				"<input type='checkbox' name='check_hw' value="
						+ rows[i].question_id + " checked> "
						+ rows[i].question_name + "<br>");

	}
}

function classselect(rows) {
	$("#classselect").html("");
	var test = '<select class="uk-select uk-form-width-medium" id="select2">'
			+ '<option value="0">クラスを選んでください</option>';
	for (var i = 0; i < rows.length; i++) {
		test += '<option id="1" value=' + rows[i].class_id + '>'
				+ rows[i].class_name + '</option>';
	}
	$("#classselect").append(test);
};

function date_err() {
	UIkit.modal("#modal-close-default").show();
}

$(document).on('change', '#select2', function() {
	var val = $(this).val();
	console.log(val);
	socket.emit("student", val);
});

$(document).on('change', '#subject', function() {
	var val = $(this).val();
	console.log(val);
	socket.emit("homeworkselect", val);
});

function student(rows) {
	$("#studentall").html("");
	for (var i = 0; i < rows.length; i++) {
		$("#studentall").append(
				"<input type='checkbox' name='check_st' value="
						+ rows[i].student_id + " checked> "
						+ rows[i].student_name + "<br>");

	}
};

function getNowDateWithString() {
	var dt = new Date();
	var y = dt.getFullYear();
	var m = ("00" + (dt.getMonth() + 1)).slice(-2);
	var d = ("00" + dt.getDate()).slice(-2);
	var result = y + "-" + m + "-" + d;
	return result;
}

function clickBtn2() {
	const arr2 = [];
	const student = document.getElementsByName("check_st");
	const hw = document.getElementsByName("check_hw");
	var date = document.getElementsByName("date");
	var check = 0;
	var test = new Date(date[0].valuse);
	var now = new Date();
	var kyou = getNowDateWithString();
	var test2 = new Date(kyou);
	console.log(kyou);
	if (date[0].value == '') {
		UIkit.modal("#modal-close-default").show();
		return;
	} else if (test2 > test) {
		console.log("tiisai");
	}

	for (var i = 0; i < student.length; i++) {
		if (student[i].checked) {
			break;
		} else {
			check += 1;
		}
	}

	if (student.length == check) {
		UIkit.modal("#st_err").show();
		return;
	}

	check = 0;

	for (var i = 0; i < hw.length; i++) {
		if (hw[i].checked) {
			break;
		} else {
			check += 1;
		}
	}

	if (hw.length == check) {
		UIkit.modal("#hw_err").show();
		return;
	}

	console.log(hw);
	for (let i = 0; i < hw.length; i++) {
		var json = [ {
			qe_id : hw[i].value,
			date : date[0].value,
			list : [],
		} ];
		if (hw[i].checked) {

			for (let j = 0; j < student.length; j++) {
				if (student[j].checked) { // (color2[i].checked === true)と同じ
					arr2.push(student[j].value);
					// socket.emit("homework_add", student[j].value,
					// hw[i].value,
					// date[0].value);
					console.log(student[j].value);
					console.log(hw[i].value);
					var add = {
						st_id : student[j].value
					}
					json[0].list.push(add);
				}
			}
		}
		socket.emit("homework_add", json);

	}

}
