<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html  style="background-image: url(chalkboard-black-pattern-01.jpg);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="oekaki.css">
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
</head>
<body>

	<jsp:useBean id="bean" class="sample.OekakiServlet" scope="request" />

	<div class="grid-container">
		<div class="uk-position-center">
			<canvas id="canvas" width="700" height="500"
				style="position: absolute; left: 0; top: 0; z-index: 2;"></canvas>
		</div>
		<div id="timeout"></div>


		   <div class="uk-position-center-left">
			<div class="uk-card uk-card-default uk-card-body uk-width-1-1">
				<ul class="uk-nav-default uk-nav-parent-icon" uk-nav>
					<li class="uk-nav-header">Pen</li>
					<li class="uk-parent"><a href="#">色</a>
						<ul class="uk-nav-sub">
							<li><a href="#" onclick="funcBlack()">Black</a></li>
							<li><a href="#" onclick="funcRed()">Red</a></li>
						</ul></li>

					<li class="uk-nav-header">Header</li>
					<li><a href="#modal-text" uk-toggle><span
							class="uk-margin-small-right" uk-icon="icon: file-edit"></span>
							テキストを追加</a></li>
					<li id="modeselect"><a href="#" onclick="select()"><span
							class="uk-margin-small-right" uk-icon="icon: move"></span> 選択モード</a></li>

					<li><a href="#" onclick="saveimage()"><span
							class="uk-margin-small-right" uk-icon="icon:  download"></span>
							画像を保存</a></li>



					<li><a href="#" onclick="apiRequest()"><span
							class="uk-margin-small-right" uk-icon="icon: download"></span>
							途中経過を保存</a></li>


					<li><a href="#modal-size" uk-toggle><span
							class="uk-margin-small-right" uk-icon="icon:  expand"></span>サイズ変更
							</a></li>


					<li class="uk-nav-divider "></li>

					<li id="selectdel"><a href="#" onclick="deleteObjects()"><span
							class="uk-margin-small-right "
							uk-icon="icon: trash"></span> 選択中のアイテムを削除</a></li>


					<li><a href="#" onclick="deleteAll()"><span
							class="uk-margin-small-right" uk-icon="icon: trash"></span> すべて削除</a></li>
					<li><div class="js-upload uk-placeholder uk-text-center">
							<span uk-icon="icon: cloud-upload"></span>
							<div uk-form-custom>
								<input type="file" name="file" id="file" multiple> <span
									class="uk-link">画像を追加</span>
							</div>
						</div></li>
					<li><div class="js-upload uk-placeholder uk-text-center">
							<span uk-icon="icon: cloud-upload"></span>
							<div uk-form-custom>
								<input type="file" name="file" id="filejson" multiple> <span
									class="uk-link">再開</span>
							</div>
						</div></li>
				</ul>
			</div>

			<!--
			<button id="select" type="button" class="uk-button uk-button-default">選択</button>
			<br>
			<button id="toJSON" type="button">toJSON</button>
			<button id="loadJSON" type="button">loadJSON</button>
			<button id="toSVG" type="button">toSVG</button>
			<button id="loadSVG" type="button">loadSVG</button>
			<button id="deleteAll" class="uk-button uk-button-default">全て削除</button>
			<br> <br>

			<input id="save" type="button" value="画像を保存"><br>

			<br>
			<button id="delete">消す</button>
			<br>
			<button id="save1">一時保存</button>
			<br>




			  <form name="myform">

				<input name="myfile" type="file" class="uk-button uk-button-default"/><br />

			</form>

			<div class="sample">
				<input type="radio" name="s3" id="select1" value="1"
					onclick="funcBlack()" checked=""> <label for="select1">
				</label> <input type="radio" name="s3" id="select2" value="2"
					onclick="funcRed()"> <label for="select2"> </label>
			</div> -->

		</div>



		<div class="uk-position-right uk-flex uk-flex-middle">
			<!-- ▼LINE風ここから -->
			<div class="line__container">
				<!-- タイトル -->
				<div class="line__title"><%=request.getAttribute("roomname")%></div>

				<!-- ▼会話エリア scrollを外すと高さ固定解除 -->
				<div class="line__contents scroll" id="msg"></div>
				<!--　▲会話エリア ここまで -->
				<input type="text" id="linemsg" size=47>
				<button id="send">test</button>
			</div>
			<!--　▲LINE風ここまで -->

			<!--<div id="test">
			room: <input type="hidden" id="roomName"
				value=<%=request.getAttribute("roomid")%>>
			<button id="join" onclick="disabled = true;">入室</button>

			<hr>
			<input type="text" id="msg" placeholder="チャットを入力">
			<button id="send">send</button>
			<hr>
			<div id="chatLog"></div>
		</div> -->
		</div>

	</div>



	<input type="hidden" id="roomid"
		value=<%=request.getAttribute("roomid")%>>
	<span id="export-link"></span>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.3/socket.io.js"></script>
	<script src="FileSaver.js"></script>
	<script type="text/javascript" src="fabric.js"></script>
	<script type="text/javascript"
		src="https://cdn.webrtc.ecl.ntt.com/skyway-latest.js"></script>
	<script type="text/javascript" src="oekaki.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit-icons.min.js"></script>


<div id="modal-text" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default" type="button" uk-close></button>
        <div class="uk-modal-header">
            <h2 class="uk-modal-title">Add Text</h2>
        </div>
        <div class="uk-modal-body">
			<input type="text" class="uk-input uk-form-width-large" id="text">        </div>
        <div class="uk-modal-footer uk-text-right">
            <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
            <button class="uk-button uk-button-primary uk-modal-close" type="button" onclick="textadd()">Add</button>
        </div>
    </div>
</div>

<div id="modal-size" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default" type="button" uk-close></button>
        <div class="uk-modal-header">
            <h2 class="uk-modal-title">Set Size</h2>
        </div>
        <div class="uk-modal-body">
			<input type="text" class="uk-input uk-form-width-large" id="wid">
			<input type="text" class="uk-input uk-form-width-large" id="hei">
		</div>
        <div class="uk-modal-footer uk-text-right">
            <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
            <button class="uk-button uk-button-primary uk-modal-close" type="button" onclick="setsize()">Set</button>
        </div>
    </div>
</div>


<header class="header">
<a href="" uk-icon="icon: home; ratio: 2"  ></a>
  <nav class="global-nav">
    <ul class="global-nav__list">
      <li class="global-nav__item"><a href="AdminMain.jsp">クラス</a></li>
      <li class="global-nav__item"><a href="">メニュー2</a></li>
      <li class="global-nav__item"><a href="">メニュー3</a></li>
      <li class="global-nav__item"><a href="">メニュー4</a></li>
      <li class="global-nav__item"><a href="">メニュー5</a></li>
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
