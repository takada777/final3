<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="js/menu.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ルーム作成</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/css/uikit.min.css" />
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
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
	</style>
</head>

<body>
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
				<div id="qu_name"></div>
			</div>
		</div>

		<div class="uk-grid" data-uk-grid-margin>
			<div class="uk-width-1-1">
				<button class="uk-button uk-button-default" id="btn_action2">ルーム作成</button>
				<button class="uk-button uk-button-default uk-margin-left"
					id="delete" value="27">削除</button>
				<div id="sql"></div>


			</div>
		</div>

	</div>


	<br>
	<br>



	<!--ダイアログの内容-->
	<div id="mydialog2" title="ルーム作成">
		<br />
		<!--ラジオボタンを配置-->
		<label>ルーム名：<input type="text" id="roomname">
		</label><br />

	</div>

	<form action="OekakiServlet" id="formtest"></form>


	<script
		src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.3/socket.io.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit-icons.min.js"></script>
	<!-- jQuery UI -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>


	<script type="text/javascript">
		var socket = io.connect("http://192.168.11.10:8081/selectroom", {
			'reconnection' : true,
			'reconnectionDelay' : 1000,
			'reconnectionDelayMax' : 5000,
			'reconnectionAttempts' : 5
		});

		console.log(socket);

		socket.on("connected", function(name) {
		});
		socket.on("selectsql", function(rows) {
			addSql(rows);
		});
		socket.on("disconnect", function() {
		});
		socket.on("delete", function() {
			select()
		});

		select();
		function addSql(rows) {
			$("#sql").html("");

			var table = '<table class="uk-table uk-table-striped uk-table-large uk-width-xxlarge"><thead><tr><th>ルーム名</th><th></th><th>参加人数</th></tr></thead><tbody>';
			for (var i = 0; i < rows.length; i++) {
				table += '<tr>'
						+ '<td>'
						+ rows[i].room_name
						+ '</td>'
						+ '<td><button class="uk-button uk-button-default" type="submit" form="formtest" name="roomid" value='+ rows[i].roomid +'>参加</button></td>'
						+ '<td>'
						+ rows[i].number_of_people
						+ '人'
						+ '<input type="checkbox" name="roomid" value=' + rows[i].roomid +'></td>'
						+ '</tr>';

			}
			table += "</tbody></table>"
			$("#sql").append(table);
			//canvas.renderAll();
		};

		$(function() {
			// ダイアログの初期設定
			$("#mydialog2").dialog({
				autoOpen : false, // 自動的に開かないように設定
				width : 500, // 横幅のサイズを設定
				modal : true, // モーダルダイアログにする
				buttons : [ // ボタン名 : 処理 を設定
				{
					text : '作成',
					click : function() {
						var t = document.getElementById("roomname").value;
						socket.emit("roomsql", t);
						select();
						$("#mydialog2").dialog("close");

					}
				} ]
			});

			$("#btn_action2").click(function() {
				// ダイアログの呼び出し処理
				$("#mydialog2").dialog("open");
			});
		})

		function select() {
			socket.emit("selectsql")
		}

		$("#delete").click(function() {
			$('input:checked').each(function() {
				var r = $(this).val();
				console.log(r);
				socket.emit("delete", r);
			})

		});
	</script>
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