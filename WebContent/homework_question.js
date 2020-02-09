var socket = io.connect("http://192.168.11.10:8081/question",{
	'reconnection': true,
	'reconnectionDelay': 1000,
	'reconnectionDelayMax' : 5000,
	'reconnectionAttempts': 5
});

socket.on("question_select", function(rows) {
	question_select(rows);
});

var query = location.search;
var value = query.split('=');

console.log(decodeURIComponent(value[2]));
var hw_id = decodeURIComponent(value[2]);
socket.emit("question_select",decodeURIComponent(value[1]));

var hairetu;

var list =[];

var options = {
		  shouldSort: true,
		  tokenize: true,
		  includeScore: true,
		  includeMatches: true,
		  threshold: 0.2,
		  location: 0,
		  distance: 100,
		  maxPatternLength: 32,
		  minMatchCharLength: 1,
		  keys: [
		    "name",

		  ]
		};

var fuse = new Fuse(list, options);

var result = fuse.search("しらね"); //検索クエリ
console.log(result); // 検索結果がコンソールに表示されます

function question_select(rows) {
	hairetu = rows;
	$("#qukekka").html("");
	var c;

	for (var i = 0; i < rows.length; i++) {
		var data =  {"name" : rows[i].question_answer};
		list.push(data);
		c = parseInt(i + 1);
		$("#qukekka").append('<div class="uk-card uk-card-default uk-card-body uk-width-1-2@m"><h3 class="uk-card-title">問.'+ c +'</h3>'
								+ rows[i].question_text
								+'<div class="uk-margin"><input class="uk-input" type="text" placeholder="解答"></div></div><br>');

	}
	$("#qukekka").append('<a class="uk-button uk-button-default" href="#" onclick="saiten()">採点</a>');
};



//function saiten() {
//	$("#syousai").html("");
//	var table = '<table class="uk-table uk-table-striped uk-table-large uk-width-large"><thead><tr><th>問</th><th>解答</th><th>答え</th><th></th></tr></thead><tbody>';
//	var inputText = $(".uk-input").map(function(index, el) {
//		return $(this).val();
//	});
//	var c;
//	for (i = 0; i < inputText.length; i++) {
//
//		c = parseInt(i + 1);
//		table += '<tr><td>'+ c +'</td>';
//		table += '<td>'+ inputText[i] +'</td>'
//		table += '<td> ' + hairetu[i].question_answer + ' </td>'
//		console.log(inputText[i]);
//		if(inputText[i] == hairetu[i].question_answer) {
//			console.log("seikai");
//			table += '<td><span class="uk-text-success">正解</span></td>'
//			//$("#syousai").append('<p>問.' + c + ' 正解         答え.' + hairetu[i].question_answer);
//		} else {
//			console.log("huseikai");
//			table += '<td><span class="uk-text-danger">不正解</span></td>'
//			//$("#syousai").append('<p>問.' + c + ' 不正解         答え.' + hairetu[i].question_answer);
//		}
//	}
//	$("#syousai").append(table);
//	UIkit.modal("#kekka").show();
//}
var user_id;
window.onload = function() {
	user_id = document.getElementById("user_id");
	console.log(user_id.value);

}

function saiten() {
	$("#syousai").html("");
	var table = '<table class="uk-table uk-table-striped uk-table-large uk-width-large"><thead><tr><th>問</th><th>解答</th><th>答え</th><th></th></tr></thead><tbody>';
	var inputText = $(".uk-input").map(function(index, el) {
		return $(this).val();
	});
	var c;
	var seikai = 0.0;
	for (i = 0; i < inputText.length; i++) {
		var kaitou = inputText[i];
		var kotae =  hairetu[i].question_answer;

		c = parseInt(i + 1);
		table += '<tr><td>'+ c +'</td>';
		table += '<td>'+ kaitou +'</td>'
		table += '<td> ' + kotae + ' </td>'
		console.log(inputText[i]);
		if(kaitou.length >= kotae.length/2 +1) {
			var result = fuse.search(kaitou);
			if(result[0] != null) {
				seikai += 1;
				table += '<td><span class="uk-text-success">正解</span></td>'
			} else {
				table += '<td><span class="uk-text-danger">不正解</span></td>'
			}
			console.log("seikai");

			//$("#syousai").append('<p>問.' + c + ' 正解         答え.' + hairetu[i].question_answer);
		} else {
			console.log("huseikai");
			table += '<td><span class="uk-text-danger">不正解</span></td>'
			//$("#syousai").append('<p>問.' + c + ' 不正解         答え.' + hairetu[i].question_answer);
		}
	}
	var ten = seikai / inputText.length * 100;
	console.log(seikai / inputText.length * 100);
	$("#syousai").append(table);
	console.log(hw_id,user_id,ten);
	socket.emit("answer",hw_id,user_id.value,ten);
	UIkit.modal("#kekka").show();
}

console.log(list);




