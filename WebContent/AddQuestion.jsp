<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.header {
  position: fixed;
  left: 0;
  top: 0;
  width: 100%;
  height: 40px;
  background-color: #fff;
  box-shadow: 0 2px 6px rgba(0,0,0,.16);
}
.global-nav {
  position: fixed;
  right: -320px; /* これで隠れる */
  top: 0;
  width: 300px; /* スマホに収まるくらい */
  height: 100vh;
  padding-top: 40px;
  background-color: #fff;
  transition: all .6s;
  z-index: 200;
  overflow-y: auto; /* メニューが多くなったらスクロールできるように */
}
.hamburger {
  position: absolute;
  right: 0;
  top: 0;
  width: 40px; /* クリックしやすいようにちゃんと幅を指定する */
  height: 40px; /* クリックしやすいようにちゃんと高さを指定する */
  cursor: pointer;
  z-index: 300;
}
.global-nav__list {
  margin: 0;
  padding: 0;
  list-style: none;
}
.global-nav__item {
  text-align: center;
  padding: 0 14px;
}
.global-nav__item a {
  display: block;
  padding: 8px 0;
  border-bottom: 1px solid #eee;
  text-decoration: none;
  color: #111;
}
.global-nav__item a:hover {
  background-color: #eee;
}
.hamburger__line {
  position: absolute;
  left: 11px;
  width: 18px;
  height: 1px;
  background-color: #111;
  transition: all .6s;
}
.hamburger__line--1 {
  top: 14px;
}
.hamburger__line--2 {
  top: 20px;
}
.hamburger__line--3 {
  top: 26px;
}
.black-bg {
  position: fixed;
  left: 0;
  top: 0;
  width: 100vw;
  height: 100vh;
  z-index: 100;
  background-color: #000;
  opacity: 0;
  visibility: hidden;
  transition: all .6s;
  cursor: pointer;
}
/* 表示された時用のCSS */
.nav-open .global-nav {
  right: 0;
}
.nav-open .black-bg {
  opacity: .8;
  visibility: visible;
}
.nav-open .hamburger__line--1 {
  transform: rotate(45deg);
  top: 20px;
}
.nav-open .hamburger__line--2 {
  width: 0;
  left: 50%;
}
.nav-open .hamburger__line--3 {
  transform: rotate(-45deg);
  top: 20px;
}
.btn {
    float: right;
}
</style>

<script
		src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit-icons.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/css/uikit.min.css" />


<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科目</title>
<script type="text/javascript" src="./jquery-3.3.1.js"></script>
<script src="./jquery.validationEngine.js"></script>
<script src="./jquery.validationEngine-ja.js"></script>
<link rel="stylesheet" href="./validationEngine.jquery.css">
<script src="./jquery.focused.min.js"></script>
<script src="./iscroll.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.3/socket.io.js"></script>
<script src="./drawer.js"></script>
</head>
<body>
<header class="header"> <a href="AdminMain.jsp"
		uk-icon="icon: google; ratio: 2"></a> <nav class="global-nav">
	<ul class="global-nav__list">
		<li class="global-nav__item"><a href="AdminMain.jsp">トップ</a></li>
		<li class="global-nav__item"><a href="Subject.jsp">科目</a></li>
		<li class="global-nav__item"><a href="ClassIchiran.jsp">クラス</a></li>
		<li class="global-nav__item"><a href="QuestionIchiran.jsp">問題一覧</a></li>
		<li class="global-nav__item"><a href="homework_list.jsp">宿題一覧</a></li>
		<li class="global-nav__item"><a href="homework_select.jsp">宿題作成</a></li>
		<li class="global-nav__item"><a href="Oshirase2.jsp">ユーザ情報</a></li>
		<li class="global-nav__item"><a href="AdminRegister.jsp">管理者登録</a></li>
		<li class="global-nav__item"><a href="Login.jsp">ログアウト</a></li>


	</ul>
	</nav>
	<div class="hamburger" id="js-hamburger">
		<span class="hamburger__line hamburger__line--1"></span> <span
			class="hamburger__line hamburger__line--2"></span> <span
			class="hamburger__line hamburger__line--3"></span>
	</div>
	<div class="black-bg" id="js-black-bg"></div>
	</header>
<br>
<br>
<div id="1">
<div id="sql3"></div>
	<div id="mondai">
		<select id="kazu" name="kazu" class="validate[required] uk-select uk-form-width-large">
			<option value="">問題数を選んでください</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
		</select>
	</div>


	<input type="text" placeholder="問題名" name="question_name"
		id="question_name" class="mondaimei validate[required] uk-input uk-form-width-medium" /><br> <br>
	<br>
	<div id="bangou"></div>
	<div id="aaa"></div>
	<br> <br> <br> <br> <br> <br> <br> <input
		type="button" value="追加" onclick="addquestion()" class="uk-button uk-button-primary">
	<div id="addsubject"></div>
</div>
<script>

	var socket = io.connect("http://192.168.11.10:8081/subject");
	socket.on("connected", function(name) {
	});
	socket.on("sql3", function(rows) {
		addSql3(rows);
	});
	socket.on("disconnect", function() {
	});
	socket.on("addquestion", function(subject_id, question_name, question_text,
			question_answer) {
		addquestion(subject_id, question_name, question_text, question_answer);
	});
	//start(roomid);
	//c/onsole.log(roomid);
	$(document).ready(function() {
		$("#1").validationEngine();
	});
	socket.emit("sql3");
	var kazu = 0;
	y = 0;
	z = 0;
	$('#kazu')
			.change(
					function() {
						var test2;
						//$("#aaa").html("");
						val = $(this).val();
						//console.log(val);
						console.log(val);
						val = Number(val);
						if (val > kazu) {
							y = kazu + 1;

							//	var test2='<input type="text" placeholder="問題名" name="question_name" id="question_name" class="validate[required,custom[number]]"/><br><br>';
							for (var x = 0; x < val - kazu; x++) {
								//if(y!=0){
								//	y=0;
								//}

								test2 = '<p>'
										+ y
										+ '</p>'
										+ '<input type="text" placeholder="問題文" name="sublectid"  id="question_text"class="textBox kosu validate[required] uk-input uk-form-large"/><br><br>'
										+ '<input type="text" placeholder="解答" name="sublectid" id="question_answer" class="textBox kosu2 validate[required] uk-input uk-form-large"/><br><br>'
								$("#aaa").append(test2);
								console.log(x);
								y++;
								//	console.log(kazu + "kazu");
								//
							}
						} else if (val <= kazu) {
							//console.log("tink");
							if (z != 0) {
								z = 0;
							}
							$("#aaa").html("");
							for (var x = 0; x < val; x++) {
								z += 1;

								test2 = '<p>'
										+ z
										+ '</p>'
										+ '<input type="text" placeholder="問題文" name="sublectid" id="question_text" class="textBox kosu validate[required] uk-input uk-form-large" /><br><br>'
										+ '<input type="text" placeholder="解答" name="sublectid" id="question_answer" class="textBox kosu2 validate[required] uk-input uk-form-large"/><br><br>'

								$("#aaa").append(test2);

								//console.log("tink");
								//	console.log(val + "val2");
								//console.log(kazu + "kazu2");
							}
						}
						//y=0;
						//	z=0;
						kazu = Number(val);
					});
	function addSql3(rows) {
		console.log("kita");
		$("#sql3").html("");
		//console.log(rows.length);
		//var table = '<span id="span3"></span><table border="1">'+'<tr><th>科目ID</th><th>科目名</th><th></th></tr>';
		var test = '<select id="select2" name="select2" class="kamoku validate[required] uk-select uk-form-width-large">'
				+ '<option value="">科目を選んでください</option>';
		for (var i = 0; i < rows.length; i++) {
			test += '<option  value='+rows[i].subject_id+'>'
					+ rows[i].subject_name + '</option>';
		}
		$("#sql3").append(test);
		//table += '</table>';
		//	$("#classselect").append(table);
		//canvas.renderAll();
		//console.log(rows.length);
	};
	console.log("sq");
	socket.emit("sql3");
	function addquestion() {
		//var subject_id = document.getElementById('select2').value;
		//var question_name = document.getElementById('question_name').value;
		// value値を取得する
		array = [ subject_id, question_name ];
		var inputText = $(".kosu").map(function(index, el) {
			return $(this).val();
		});
		var inputText2 = $(".textBox").map(function(index, el) {
			return $(this).val();
		});
		inputText3 = $(".kosu2").map(function(index, el) {
			return $(this).val();
		});
		console.log(inputText2.length);
		showtext = "";
		var subject_id = document.getElementById('select2').value;
		var question_name = document.getElementById('question_name').value;
		var json = [{
					id:subject_id,
					name: question_name,
					list:[],
					}];
		console.log(json);
		for (i = 0; i < inputText.length; i++) {
			//for (j = 0; j < inputText2.length; j++) {
			//array.push(inputText2[j]);
			// array.push(inputText[i]);
			//array = [ subject_id, question_name, inputText[i], inputText3[i] ];
			//console.log(array);
			//  }var subject_id = document.getElementById('select2').value;

			var question_text = inputText[i];
			var question_answer = inputText3[i];
			var question = {text: question_text,answer: question_answer}
			json[0].list.push(question)

		}
		socket.emit("addquestion", json);
		console.log(json);
		location.reload();
		//    showtext += inputText[i] + "<br/>";
		/ / / console.log(inputText[i]);
		//	array.push(inputText[i]);
		//  $("#output").html(showtext);
		//		 array=[];
		//	 var subject_id = document.getElementById('select2').value;
		//		var question_name = document.getElementById('question_name').value;
		//		var question_text = document.getElementById('question_text').value;
		//		var question_answer = document.getElementById('question_answer').value;
		//	 for (var i = 0; i <question_name.length; i++){
		//			array.push(question_name[i],question_text[i]);
		//			console.log(array);
		//			for(var j=0;j<array.length;j++){
		//			 console.log(array[i]);
		//			socket.emit("addquestion",subject_id, question_name, question_text,question_answer);
		//	//	location.reload();
		//
		//		console.log(subject_id);
		//	console.log(question_name);
		//	console.log(question_text);
		//	console.log(question_answer);
		// alert("value値は「" + subject_id + "」です");
		///	socket.emit("addquestion",subject_id, question_name, question_text,
		//		question_answer);
		//location.reload();
	};
</script>
<script type="text/javascript">
function toggleNav() {
	  var body = document.body;
	  var hamburger = document.getElementById('js-hamburger');
	  var blackBg = document.getElementById('js-black-bg');

	  hamburger.addEventListener('click', function() {
	    body.classList.toggle('nav-open');
	  });
	  blackBg.addEventListener('click', function() {
	    body.classList.remove('nav-open');
	  });
	}
	toggleNav();
</script>
</body>
</html>