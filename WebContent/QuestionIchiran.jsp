<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="learning.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.uk-position-center {
	max-height: 100px;
}

.select-area {
	text-align: center;
}

.sakusei {
	position: absolute;
	right: 10%;
	top: 20%;
}

.header {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 40px;
	background-color: #fff;
	box-shadow: 0 2px 6px rgba(0, 0, 0, .16);
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

.mannaka {
	text-align: center;
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
<title>問題一覧</title>
<script type="text/javascript" src="./jquery-3.3.1.js"></script>
<script src="./iscroll.js"></script>
<script src="./jquery.focused.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.3/socket.io.js"></script>
<script src="./drawer.js"></script>
<link rel="stylesheet" href="./drawer.css">
<style type="text/css">
</style>
</head>
<body>


	<main role="main"> <!-- コンテンツ --> </main>
	<br>
	<br>
	<div class="select-area">
		<div id="subjectselect"></div>
	</div>
	<div class="uk-position-center">
		<div id="subject"></div>
	</div>
	<input type="button" onclick="location.href='AddQuestion.jsp'"
		value="問題作成" class="uk-button uk-button-primary sakusei">

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
	<script>
		var socket = io.connect("http://192.168.11.10:8081/subject");
		socket.on("connected", function(name) {
		});
		socket.on("disconnect", function() {
		});
		socket.on("subject", function(rows) {
			subject(rows);
		});
		socket.on("subject2", function(rows) {
			subject(rows);
		});
		socket.on("subjectselect", function(rows) {
			subjectselect(rows);
		});
		$(document).ready(function() {
			$('.drawer').drawer();
		});
		//$('select').change(function() {
		//	  if ($(this).val() != '') {
		//	    window.location.href = $(this).val();
		//	  }
		//});function addSql3(rows){
		function subjectselect(rows) {
			$("#subjectselect").html("");
			//console.log(rows.length);
			//var table = '<span id="span3"></span><table border="1">'+'<tr><th>科目ID</th><th>科目名</th><th></th></tr>';
			var test = '<br><br><br><br><br><br><select id="form-horizontal-select" name="pulldown1" class="validate[required] uk-select uk-form-width-large basho">'
					+ '<option value="0">問題を選んでください</option>';
			for (var i = 0; i < rows.length; i++) {

				test += '<option id="1" value='+rows[i].subject_id+'>'
						+ rows[i].subject_name + '</option>';
				console.log(rows[i].subject_id);
			}
			$("#subjectselect").append(test);
			//table += '</table>';
			//	$("#classselect").append(table);
			//canvas.renderAll();

		};
		socket.emit("subjectselect");
		function subject(rows) {
			$("#subject").html("");
			var table = '<span id="span2"></span><table  class= "uk-table uk-table-striped uk-table-large uk-width-xxlarge ">'
					+ '<tr><th>問題名</th><th></th></tr>';
			//console.log(table);
			question_name = null;
			for (var i = 0; i < rows.length; i++) {
				// test2=rows[i].subject_id;

				if (question_name != rows[i].question_name) {

					table += '<tr><td>'
							+ rows[i].question_name
							+ '</td>'
							+ '<td><div><input type="button" class="uk-button uk-button-default" id="button" value="編集" onclick="change()"</td>';
					question_name = rows[i].question_name;
					subject_id = rows[i].subject_id;

					// 	$("#sql3").append('科目ID ' + rows[i].subject_id );
					//var test=document.rows[i].subject_id;
					//	$("#sql3").append('科目名 ' + rows[i].subject_name + '<br>');
					//console.log(rows.length);
				}
			}
			table += '</table>';
			$("#subject").append(table);

			$('select').change(function() {
				var val = $(this).val();
				//console.log(val);

				socket.emit("subject", val);
				//	socket.emit("subject2", val);

			});
			//	canvas.renderAll();
		};

		socket.emit("subject");
		function change() {
			localStorage.setItem('question_name', question_name);
			localStorage.setItem('subject_id', subject_id);

			document.location.href = "QuestionEdit.jsp";

		}
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