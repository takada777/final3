<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="learning.*"%>
<%@ page import="java.util.ArrayList"%>
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
<title>管理者メニュー</title>
<script type="text/javascript" src="./jquery-3.3.1.js"></script>
<script src="./iscroll.js"></script>
<script src="./jquery.focused.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.3/socket.io.js"></script>
<script src="./drawer.js"></script>
<link rel="stylesheet" href="./drawer.css">
<style type="text/css">
table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0;
}

table th:first-child {
	border-radius: 5px 0 0 0;
}

table th:last-child {
	border-radius: 0 5px 0 0;
	border-right: 1px solid #3c6690;
}

table th {
	text-align: center;
	color: white;
	background: linear-gradient(#829ebc, #225588);
	border-left: 1px solid #3c6690;
	border-top: 1px solid #3c6690;
	border-bottom: 1px solid #3c6690;
	box-shadow: 0px 1px 1px rgba(255, 255, 255, 0.3) inset;
	width: 25%;
	padding: 10px 0;
}

table td {
	text-align: center;
	border-left: 1px solid #a8b7c5;
	border-bottom: 1px solid #a8b7c5;
	border-top: none;
	box-shadow: 0px -3px 5px 1px #eee inset;
	width: 25%;
	padding: 10px 0;
}

table td:last-child {
	border-right: 1px solid #a8b7c5;
}

table tr:last-child td:first-child {
	border-radius: 0 0 0 5px;
}

table tr:last-child td:last-child {
	border-radius: 0 0 5px 0;
}

.saizu {
	width: 50%;
	/*最小幅あり*/
	min-width: 1000px;
}
</style>

</head>

<main role="main"> <!-- コンテンツ --> </main>
<body>






	<div id="classselect"></div>
	<div id="student"></div>
	<br>
	<br>
	<div
		class="uk-container uk-container-center uk-margin-top uk-margin-large-bottom">

		<div class="uk-child-width-1-3 uk-text-center" uk-grid>

			<div>
				<a href="AdminMain.jsp"
					class="uk-display-block uk-card uk-card-body uk-card-default uk-link-toggle uk-width-medium">
					<h3 class="uk-card-title">
						<span class="uk-link-heading">クラス追加</span>
					</h3>
					<p>クラスを新規に登録することができます。</p>
				</a>

			</div>
			<div>
				<a href="Subject.jsp"
					class="uk-display-block uk-card uk-card-body uk-card-default uk-link-toggle uk-width-medium">
					<h3 class="uk-card-title">
						<span class="uk-link-heading">科目追加</span>
					</h3>
					<p>科目を新規に登録することができます。</p>
				</a>

			</div>
			<div>
				<a href="QuestionIchiran.jsp"
					class="uk-display-block uk-card uk-card-body uk-card-default uk-link-toggle uk-width-medium">
					<h3 class="uk-card-title">
						<span class="uk-link-heading">問題一覧</span>
					</h3>
					<p>作成した問題を確認、編集することができます。</p>
				</a>
			</div>

		</div>
		<div class="uk-child-width-1-3 uk-text-center" uk-grid>
			<div>
				<a href="Subject.jsp"
					class="uk-display-block uk-card uk-card-body uk-card-default uk-link-toggle uk-width-medium">
					<h3 class="uk-card-title">
						<span class="uk-link-heading">宿題</span>
					</h3>
					<p>生徒に宿題を提出したり、提出状況を確認することができます。</p>
				</a>
			</div>


		</div>
	</div>


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
		socket.on("student", function(rows) {
			student(rows);
		});
		socket.on("classselect", function(rows) {
			classselect(rows);
		});
		$(document).ready(function() {
			$('.drawer').drawer();
		});

		socket.emit("classselect");

		function classselect(rows) {
			$("#classselect").html("");
			var test = '<select id="class" name="pulldown1" class="test9">'
					+ '<option value="0">クラスを選んでください</option>';
			for (var i = 0; i < rows.length; i++) {
				test += '<option id="1" value='+rows[i].class_id+'>'
						+ rows[i].class_name + '</option>';
			}
			$("#classselect").append(test);
		};

		function student(rows) {
			$("#student").html("");
			var table = '<span id="span2"></span><table border="1">'
					+ '<tr><th>生徒ID</th><th>生徒名</th></tr>';
			for (var i = 0; i < rows.length; i++) {
				table += '<tr><td>' + rows[i].student_id + '</td>' + '<td>'
						+ rows[i].student_name + '</td>';

			}
			table += '</table>';
			$("#student").append(table);
		};

		$(document).on('change', '.test9', function() {
			var val = $(this).val();
			console.log(val);
			socket.emit("student", val);
		});
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