<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="learning.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="js/menu.css">
<jsp:useBean id="sab" class="learning.bean.StudentArrayBean" scope="session"/>
<jsp:useBean id="sb" class="learning.bean.StudentBean" scope="session"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>問題</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/css/uikit.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit-icons.min.js"></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.3/socket.io.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fuse.js/3.4.6/fuse.min.js"></script>
<script src="js/homework_question.js"></script>
</head>
<body>
	<div class="uk-container uk-container-center">
	</div>

	<div
		class="uk-container uk-width-xxlarge uk-container-center uk-margin-top uk-margin-large-bottom">

		<div class="uk-grid uk-center" data-uk-grid-margin>
			<div class="uk-width-1-1">
				<!--<div
					class="uk-background-contain uk-background-muted uk-height-medium uk-panel uk-flex uk-flex-center uk-flex-middle"
					style="background-image: url(pexels-photo-941693.jpeg);">
					<p class="uk-h4">問題選択</p>
				</div> -->
				<h1 class="uk-heading-large"></h1>
				<div id="qu_name">

				</div>
			</div>
		</div>

		<div class="uk-grid" data-uk-grid-margin>
			<div class="uk-width-1-1">
				<div id="qukekka"></div>

			</div>
		</div>

	</div>

	<div id="kekka" uk-modal>
		<div class="uk-modal-dialog uk-modal-body">
			<button class="uk-modal-close-default" type="button" uk-close></button>
			<h2 class="uk-modal-title">採点結果</h2>
			<div id = "syousai">
			</div>
		</div>
	</div>

	<div id="hw_err" uk-modal>
		<div class="uk-modal-dialog uk-modal-body">
			<button class="uk-modal-close-default" type="button" uk-close></button>
			<h2 class="uk-modal-title">エラー</h2>
			<p>すでに提出済みです。</p>
		</div>
	</div>

	<div id="err" uk-modal>
		<div class="uk-modal-dialog uk-modal-body">
			<button class="uk-modal-close-default" type="button" uk-close></button>
			<h2 class="uk-modal-title">エラー</h2>
			<p>すでに提出済みです。
		</div>
	</div>
<input type="hidden" id="user_id" value=<%= sb.getId() %>>
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