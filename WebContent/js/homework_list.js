var socket = io.connect("http://192.168.11.10:8081/homework_list",{
	'reconnection': true,
	'reconnectionDelay': 1000,
	'reconnectionDelayMax' : 5000,
	'reconnectionAttempts': 5
});

socket.on("list", function(rows) {
	list(rows);
});

socket.on("select", function(rows) {
	select(rows);
});

socket.on("homework_details", function(rows) {
	homework_details(rows);
});

socket.emit("list");

//function list(rows) {
//	var list ="";
//
//	for(var i = 0;i < rows.length; i++) {
//		console.log(rows[i].subject_name);
//
//		list += '<li class="uk-parent"><a href="#">'+rows[i].subject_name+ '</a><ul class="uk-nav-sub"><li><a href="#">Sub item</a></li></ul></li>'
//	}
//	console.log(list);
//	$("#list_all").append(list);
//}

function list(rows) {
	var select = '<select class="uk-select uk-form-width-medium" name="homework" id="subject">'
			+ '<option value="0">教科を選択してください</option>';
	for (var i = 0; i < rows.length; i++) {
		select += '<option id="1" value=' + rows[i].subject_id + '>'
				+ rows[i].subject_name + '</option>';
	}
	select += "</select>";
	$("#list_all").append(select);
}

function select(rows) {
	$("#list_select").html("");

	var table = '<table class="uk-table uk-table-striped uk-table-large uk-width-xxlarge"><thead><tr><th>宿題名</th><th>配布日</th><th>締め切り</th><th>詳細</th></tr></thead><tbody>';
	for (var i = 0; i < rows.length; i++) {
		console.log(rows[i].distribution_date);
		console.log(rows[i].deadline_date);
		table += '<tr>'
				+ '<td>'+ rows[i].question_name +'</td>'
				+ '<td>'+ rows[i].distribution_date.slice(0,10) +'</td>'
				+ '<td>' + rows[i].deadline_date.slice(0,10) + '</td>'
				+ '<td><input type="button" class="uk-button uk-button-default" value="詳細" onclick="syousai('+ rows[i].homework_id +')" /></td>'
				+ '</tr>';

	}
	table += "</tbody></table>"
	$("#list_select").append(table);
}

$(document).on('change', '#subject', function() {
	var val = $(this).val();
	console.log(val);
	socket.emit("select", val);
});

function syousai(id) {
	socket.emit("homework_details",id)
};

function homework_details(rows) {
	$("#syousai").html("");
	var table = '<table class="uk-table uk-table-striped uk-table-large uk-width-large"><thead><tr><th>クラス</th><th>名前</th><th>提出日</th><th>得点</th></tr></thead><tbody>';
	for (i = 0; i < rows.length; i++) {
		table += '<tr><td>'+ rows[i].class_name +'</td>';
		table += '<td>'+ rows[i].student_name +'</td>'
		if(rows[i].answer_date != null){
			table += '<td> ' + rows[i].answer_date.slice(0,10) + ' </td>'
		} else {
			table += '<td><span class="uk-text-danger">未提出</span> </td>'
		}
		if(rows[i].answer_date != null){
			table += '<td><span class="uk-text-success"> ' + rows[i].homework_score + ' </span></td>'
		} else {
			table += '<td>-</td>'
		}


//
//		if(kaitou.length >= kotae.length/2 +1) {
//			var result = fuse.search(kaitou);
//			if(result[0] != null) {
//				table += '<td><span class="uk-text-success">正解</span></td>'
//			} else {
//				table += '<td><span class="uk-text-danger">不正解</span></td>'
//			}
//			console.log("seikai");
//
//			//$("#syousai").append('<p>問.' + c + ' 正解         答え.' + hairetu[i].question_answer);
//		} else {
//			console.log("huseikai");
//			table += '<td><span class="uk-text-danger">不正解</span></td>'
//			//$("#syousai").append('<p>問.' + c + ' 不正解         答え.' + hairetu[i].question_answer);
//		}
	}
	$("#syousai").append(table);
	UIkit.modal("#kekka").show();
}

