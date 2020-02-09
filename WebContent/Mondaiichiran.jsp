<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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



<script src="./jquery-3.3.1.js"></script>
<link rel="stylesheet" href="./drawer.css">
<style type="text/css">
<!--
body {
  background-image: url("haikei.jpg");
  background-size: cover;
}
ul.jquery-menu {
    background-color: silver;
    list-style-position: inside;
    width: 500px;
    border: 1px darkgray solid;
    border-bottom: none;
}
ul.jquery-menu li {
    padding-bottom: 5px;
    border-bottom: 1px darkgray solid;
    list-style-type: none;
}
ul.jquery-menu li div.jquery-menu-title-box {
    padding: 5px 10px 0 10px;
    cursor: pointer;
}
ul.jquery-menu li div.menu-title {
    float: left;
    font-weight: bold;
}
ul.jquery-menu li div.menu-triangle {
    float: right;
    text-align: right;
    color: darkgray;
    border-left: 1px darkgray solid;
}
ul.jquery-menu-sub {
    display: none;
    background-color: lightgrey;
    list-style-position: inside;
    margin: 5px;
}
ul.jquery-menu-sub li {
    padding: 5px 10px 5px 10px;
    border: none;
    list-style-type: square;
}
-->
</style>
<meta charset="UTF-8">
<title>Insert title here-</title>
<script type="text/javascript" src="./jquery-3.3.1.js"></script>

</head>
<body>
<header class="header">
<a href="AdminMain.jsp" uk-icon="icon: home; ratio: 2"  ></a>
  <nav class="global-nav">
    <ul class="global-nav__list">
      <li class="global-nav__item"><a href="AdminMain.jsp">クラス</a></li>
      <li class="global-nav__item"><a href="Subject.jsp">科目</a></li>
      <li class="global-nav__item"><a href="QuestionIchiran.jsp">問題一覧</a></li>
      <li class="global-nav__item"><a href="QuestionEdit.jsp">問題編集</a></li>
      <li class="global-nav__item"><a href="#">宿題</a></li>
        <li class="global-nav__item"><a href="#">ユーザ情報</a></li>
      <li class="global-nav__item"><a href="AdminRegister.jsp">管理者登録</a></li>
      <li class="global-nav__item"><a href="Login.jsp">ログアウト</a></li>


    </ul>
  </nav>
  <div class="hamburger"  id="js-hamburger">
    <span class="hamburger__line hamburger__line--1"></span>
    <span class="hamburger__line hamburger__line--2"></span>
    <span class="hamburger__line hamburger__line--3"></span>
  </div>
  <div class="black-bg" id="js-black-bg"></div>
</header>





<script type="text/javascript">

<!--
$( function() {
    $( '#jquery-menu-1-title' ) . click( function() {
        $( "#jquery-menu-1-sub" ) . slideToggle( 'fast' );
    } );
    $( '#jquery-menu-2-title' ) . click( function() {
        $( "#jquery-menu-2-sub" ) . slideToggle( 'fast' );
    } );
    $( '#jquery-menu-3-title' ) . click( function() {
        $( "#jquery-menu-3-sub" ) . slideToggle( 'fast' );
    } );
} );
// -->
</script>

<script src="./iscroll.js"></script>

<script src="./drawer.js"></script>

</head>
<body>
<header>
<h1>学習支援システム</h1>
<h1>dddd</h1>

</header>
</body>

	<main role="main">
		<!-- コンテンツ -->
	</main>
	<script>
$(document).ready(function() {
	 $('.drawer').drawer();
});
</script>

<ul class="jquery-menu">
    <li id="jquery-menu-1">
        <div id="jquery-menu-1-title" class="jquery-menu-title-box">
            <div class="menu-title">オブジェクト指向プログラミング</div>
            <div class="menu-triangle">　▼</div>
            <div style="clear: both;"></div>
        </div>
        <ul class="jquery-menu-sub" id="jquery-menu-1-sub">
            <li><a href="#">基本問題</a></li>
            <li><a href="#">基本問題2</a></li>
            <li><a href="#">応用問題</a></li>

        </ul>
    </li>
    <li id="jquery-menu-2">
        <div id="jquery-menu-2-title" class="jquery-menu-title-box">
            <div class="menu-title">androidⅠ</div>
            <div class="menu-triangle">　▼</div>
            <div style="clear: both;"></div>
        </div>
        <ul class="jquery-menu-sub" id="jquery-menu-2-sub">
            <li><a href="#">基本問題</a></li>
            <li><a href="#">基本問題2</a></li>
            <li><a href="#">基本問題3</a></li>
            <li><a href="#">応用問題</a></li>


        </ul>
    </li>
    <li id="jquery-menu-3">
        <div id="jquery-menu-3-title" class="jquery-menu-title-box">
            <div class="menu-title">SEA/J</div>
            <div class="menu-triangle">　▼</div>
            <div style="clear: both;"></div>
        </div>
        <ul class="jquery-menu-sub" id="jquery-menu-3-sub">
            <li><a href="#">基本問題</a></li>
            <li><a href="#">基本問題2</a></li>


        </ul>
    </li>
</ul>
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
</body>
</html>