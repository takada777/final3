<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="learning.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit-icons.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.3/socket.io.js"></script>
<script src="js/Login.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/css/uikit.min.css" />

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


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ログイン</title>
<script src="./jquery-3.3.1.js"></script>
<script src="./jquery.validationEngine.js"></script>
<script src="./jquery.validationEngine-ja.js"></script>
<link rel="stylesheet" href="./validationEngine.jquery.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.3/socket.io.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit-icons.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/css/uikit.min.css" />
<style type="text/css">
.box {
	/*親要素*/
	position: relative;
	background: orange;
	height: 200px;
}

.btn-square {
	display: inline-block;
	padding: 0.5em 1em;
	text-decoration: none;
	background: #668ad8; /*ボタン色*/
	color: #FFF;
	border-bottom: solid 4px #627295;
	border-radius: 3px;
}

.btn-square:active {
	/*ボタンを押したとき*/
	-webkit-transform: translateY(4px);
	transform: translateY(2px); /*下に動く*/
	border-bottom: none; /*線を消す*/
}

input {
	margin: 6px 0;
}

h4 {
	text-align: center;
}

div {
	text-align: center;
}
</style>
</head>
<body>


	<div id="sql2"></div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#form").validationEngine();
		});

		//	var socket = io.connect("http://192.168.11.10:8081/subject");
		//	socket.on("connected", function(name) {
		//	});
		//	socket.on("login", function(student_id, student_pass, rows) {
		//		login(student_id, student_pass);
		//	});
		//	function login(student_id, student_pass) {
		//$("#sql2").html("");
		//	var student_id = document.getElementById('id').value;
		//	var student_pass = document.getElementById('pass').value;
		//	console.log(student_id);
		//	console.log(student_pass);
		//	socket.emit("login",student_id,student_pass);

		//for( i = 0;i < rows.length;i++) {
		// test=rows[i].subject_id;
		//

		//$("#sql3").append(table);
		//canvas.renderAll();
		//	};
		//socket.emit("sql2");
	</script>

	<div>


		<!--<div></div>
<h4 >学習支援システム</h4>

	<form id="form" method="get" action="LoginServlet">
    <input type="text" placeholder="ID" name="id" class="validate[required]"/>
    <br>
    <input type="password" placeholder="PASSWORD" name="pass" class="validate[required]"/>
    <br>
  <%//<div><a href="LoginServlet"  class="btn-square">ログイン</a></div>%>
  <div><input type="submit" class="gradientButton" value="ログイン"></div>
    </form>s
a
  <br>ai
  <br>
  <a href= "Register.jsp" >アカウントをお持ちでない場合</a>
</div> -->

		<div
			class="uk-section uk-section-muted uk-flex uk-flex-middle uk-animation-fade"
			uk-height-viewport>
			<div class="uk-width-1-1">
				<div class="uk-container">
					<div class="uk-grid-margin uk-grid uk-grid-stack" uk-grid>
						<div class="uk-width-1-1@m">
							<div
								class="uk-margin uk-width-large uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-large">
								<h3 class="uk-card-title uk-text-center">ログイン</h3>
								<form name="form1" action="LoginServlet" method="get">
									<div class="uk-margin">
										<div class="uk-inline uk-width-1-1">
											<span class="uk-form-icon" uk-icon="icon: user"></span> <input
												type="text" placeholder="ユーザID" name="id"
												class="validate[required] uk-input uk-form-large" id="id" />

										</div>
									</div>
									<div class="uk-margin">
										<div class="uk-inline uk-width-1-1">
											<span class="uk-form-icon" uk-icon="icon: lock"></span> <input
												type="password" placeholder="PASSWORD" name="pass"
												class="validate[required] uk-input uk-form-large" id="pass" />

										</div>
									</div>
								</form>
								<div class="uk-margin">
									<button
										class="uk-button uk-button-primary uk-button-large uk-width-1-1"
										id="btn" onclick="clic()">ログイン</button>
								</div>

								<div class="uk-text-small uk-text-center">
									<a href="Register2.jsp">新規登録</a>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="err" uk-modal>
			<div class="uk-modal-dialog uk-modal-body">
				<button class="uk-modal-close-default" type="button" uk-close></button>
				<h2 class="uk-modal-title">ログインエラー</h2>
				<p>ログインに失敗しました</p>
			</div>
		</div>
</body>
</html>