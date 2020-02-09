<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="learning.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="./jquery-3.3.1.js"></script>
<script src="./jquery.validationEngine.js"></script>
<script src="./jquery.validationEngine-ja.js"></script>
<link rel="stylesheet" href="./validationEngine.jquery.css">
<script  src="./jquery.focused.min.js"></script>
<script src="./iscroll.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.3/socket.io.js"></script>
<script src="./drawer.js"></script>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit-icons.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/css/uikit.min.css" />
<link rel="stylesheet" href="./drawer.css">

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

<jsp:useBean id="sab" class="learning.bean.StudentArrayBean" scope="session"/>
<jsp:useBean id="sb" class="learning.bean.StudentBean" scope="session"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="./jquery-3.3.1.js"></script>
<link rel="stylesheet" href="./drawer.css">
<style type="text/css">
<!--

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
-->
</style>
<script src="./iscroll.js"></script>

<script src="./drawer.js"></script>

</head>
<body>


	<main role="main">
		<!-- コンテンツ -->
	</main>
	<script>
$(document).ready(function() {
	 $('.drawer').drawer();
});
</script>

</body>
<body>

<div class="uk-position-center">
<br>
<table class="uk-table uk-table-striped uk-table-large uk-width-xxlarge">
<tr>
<th>クラス</th>

<%for(StudentBean sb2 : sab.getStudentArray()){%>
<th>
<INPUT type="hidden" value=<%=  sb2.getStudent_class() %> id="cls">

<!--  %=  sb2.getStudent_class() %>-->
<div id=classdisp>

</div>
</th>

<% } %>

<th><form id="form" method="get" action="ChangeValue.jsp">
	<input type="submit" class="uk-button uk-button-default" value="変更">
	<input type="hidden" name="val" value="1">
	</form></th>
</tr>

<tr>
<th>氏名</th>

<%for(StudentBean sb2 : sab.getStudentArray()){%>
<th>
<%= sb2.getStudent_name() %>
</th>
<% } %>

<th><form id="form" method="get" action="ChangeValue.jsp">
	<input type="submit" class="uk-button uk-button-default" value="変更">
	<input type="hidden" name="val" value="2">
	</form></th>
</tr>

<tr>
<th>メールアドレス</th>

<%for(StudentBean sb2 : sab.getStudentArray()){%>
<th>
<%= sb2.getStudent_address() %>
</th>
<% } %>

<th><form id="form" method="get" action="ChangeValue.jsp">
	<input type="submit" class="uk-button uk-button-default" value="変更">
	<input type="hidden" name="val" value="3">
	</form></th>
</tr>

<tr>
<th>パスワード</th>
<th>*</th>
<th><form id="form" method="get" action="ChangeValue.jsp">
	<input type="submit" class="uk-button uk-button-default" value="変更">
	<input type="hidden" name="val" value="4">
	</form></th>
</tr>
</table>
</div>
<header class="header"> <a href="Student_main.jsp"
		uk-icon="icon: google; ratio: 2"></a> <nav class="global-nav">
	<ul class="global-nav__list">
		<li class="global-nav__item"><a href="Student_main.jsp">トップ</a></li>
		<li class="global-nav__item"><a href="question_select.jsp">問題一覧</a></li>
		<li class="global-nav__item"><a href="homework_student.jsp">宿題一覧</a></li>
		<li class="global-nav__item"><a href="room_select.jsp">グループワーク</a></li>
		<li class="global-nav__item"><a href="Oshirase.jsp">ユーザ情報</a></li>

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
<script type="text/javascript">
var socket = io.connect("http://192.168.11.10:8081/subject");
socket.on("connected", function(name){});

socket.on("classdisp", function(rows){classdisp(rows);});


socket.on("disconnect", function(){});
function classdisp(rows){
	$("#classdisp").html("");
	var test =rows[0].class_name;
	$("#classdisp").append(test);
//	console.log(rows.length);



};
window.onload = function() {
	var  class_id= document.getElementById('cls').value;
	socket.emit("classdisp",class_id);
	//console.log(x);
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