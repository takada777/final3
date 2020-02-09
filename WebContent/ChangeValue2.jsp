<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="learning.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.3/socket.io.js"></script>
<script src="./jquery-3.3.1.js"></script>
<script src="./jquery.validationEngine.js"></script>
<script src="./jquery.validationEngine-ja.js"></script>
<link rel="stylesheet" href="./validationEngine.jquery.css">
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit-icons.min.js"></script>
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


<jsp:useBean id="sb" class="learning.bean.StudentBean" scope="session"/>
<%
HttpSession httpSession=request.getSession();
int val = Integer.parseInt(request.getParameter("val"));
%>
<script src="./jquery-3.3.1.js"></script>
<link rel="stylesheet" href="./drawer.css">
<style type="text/css">

a.cp_btn {
	position: relative;
	display: block;
	width: 160px;
	padding: 0.8em;
	text-align: center;
	border: 3px solid #9C27B0;
	text-decoration: none;
	outline: none;
	transition: all .4s;
}
a.cp_btn::before,
a.cp_btn::after {
	position: absolute;
	top: -3px;
	right: -3px;
	bottom: -3px;
	left: -3px;
	z-index: 2;
	content: '';
	transition: all .4s;
}
a.cp_btn::before {
	border-top: 3px solid #FF5722;
	border-bottom: 3px solid #FF5722;
	transform: scale(0, 1);
}
a.cp_btn::after {
	border-right: 3px solid #FF5722;
	border-left: 3px solid #FF5722;
	transform: scale(1, 0);
}
a.cp_btn:hover {
	color: #FF5722;
}
a.cp_btn:hover::after,
a.cp_btn:hover::before {
	transform: scale(1);
}
body, h1, p {
margin: 0;
padding: 0;
}

header {
background-color: #CEF6D8;
}
</style>
<script src="./iscroll.js"></script>

<script src="./drawer.js"></script>

</head>
<body>

</body>
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

	<main role="main">
		<!-- コンテンツ -->
	</main>
	<script>
$(document).ready(function() {
	 $('.drawer').drawer();
});
</script>

<br>
<br>


<% if(val==1){ %>
	<form id="form" method="get" action="ChangeValueServlet2">

<div class="uk-margin" id="classselect">




										<div class="uk-form-controls" id="classselect">

										</div>

									</div>
  	<input type="hidden" name="num" value="1">
  	<input type="hidden" name="id" value="<%= sb.getId() %>">
  	<br>
  	<br>
  	<br>
  	<input type="submit" class="uk-button uk-button-default " value="変更">
    </form>
<% }else if(val==2){ %>
	<form id="form" method="get" action="ChangeValueServlet2">
	<input type="text" placeholder="新しい名前を入力してください" size="40" name="val" class="validate[required] uk-input uk-form-width-large"/>
	<input type="hidden" name="num" value="2">
  	<input type="hidden" name="id" value="<%= sb.getId() %>">
  	<br>
  	<input type="submit" class="gradientButton uk-button-default" value="変更">
  	</form>
<% }else if(val==3){ %>
	<form id="form" method="get" action="ChangeValueServlet2">
	<input type="text" placeholder="新しいメールアドレスを入力してください"  size="40" name="val" class="validate[required] uk-input uk-form-width-large"/>
	<input type="hidden" name="num" value="3">
  	<input type="hidden" name="id" value="<%= sb.getId() %>">
  	<br>
  	<input type="submit" class="gradientButton uk-button-default" value="変更">
  	</form>
<% }else if(val==4){ %>
	<form id="form" method="get" action="ChangeValueServlet2">
	<input type="password" placeholder="新しいパスワードを入力してください"  size="40" name="val" class="validate[required] uk-input uk-form-width-large"/>
	<input type="hidden" name="num" value="4">
  	<input type="hidden" name="id" value="<%= sb.getId() %>">
  	<br>
  	<input type="submit" class="gradientButton uk-button-default" value="変更">
  	</form>
<% } %>

</body>
<body>
<script type="text/javascript">
var socket = io.connect("http://192.168.11.10:8081/subject");
socket.on("connected", function(name){});
socket.on("disconnect", function() {
	});
socket.on("classselect", function(rows) {
	classselect(rows);
});
socket.emit("classselect");
function classselect(rows) {
	$("#classselect").html("");
	var test = '<select id="class" name="val" class="test9 uk-select">'
			+ '<option value="0">クラスを選んでください</option>';
	for (var i = 0; i < rows.length; i++) {
		test += '<option id="1" value='+rows[i].class_id+'>'
				+ rows[i].class_name + '</option>';
	}
	$("#classselect").append(test);
};
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