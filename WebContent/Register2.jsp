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




<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新規登録</title>
<script type="text/javascript" src="./jquery-3.3.1.js"></script>
<script src="./jquery.validationEngine.js"></script>
<script src="./jquery.validationEngine-ja.js"></script>
<link rel="stylesheet" href="./validationEngine.jquery.css">
<script  src="./jquery.focused.min.js"></script>
<script src="./iscroll.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.3/socket.io.js"></script>
<script src="./drawer.js"></script>
<link rel="stylesheet" href="./drawer.css">
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/js/uikit-icons.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/uikit/3.0.3/css/uikit.min.css" />
<style type="text/css">
ul li {
list-style: none;
text-align: left;
}

}
label {
   margin: 16px auto;
	text-align: center;
	display: block;
	border: 1px solid #000;
	float: left;
}
ul {
   /*float:left;
   position:relative;
   left:50%;
   */
}


.btn-register {
  display: inline-block;
  padding: 0.5em 1em;
  text-decoration: none;
  background: #668ad8;/*ボタン色*/
  color: #FFF;
  border-bottom: solid 4px #627295;
  border-radius: 3px;
}
.btn-register:active {
  /*ボタンを押したとき*/
  -webkit-transform: translateY(4px);
  transform: translateY(4px);/*下に動く*/
  border-bottom: none;/*線を消す*/
}
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





<div class="uk-section uk-section-muted uk-flex uk-animation-fade uk-flex-middle " uk-height-viewport uk-animation-fade>


	<main role="main">
		<!-- コンテンツ -->
	</main>
	<div class="uk-width-1-1">
		<div class="uk-container">
			<div class="uk-grid-margin uk-grid uk-grid-stack" uk-grid>
				<div class="uk-width-1-1@m">
					<div class="uk-margin uk-width-large uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-large">

						<div>

							<div class="uk-card-body">
								<h3 class="uk-card-title uk-text-bold uk-text-uppercase uk-text-primary">ユーザ登録</h3>

									<div class="uk-margin" id="classselect">




										<div class="uk-form-controls" id="classselect">

										</div>
										</div>
 <div id="form">

									<div class="uk-margin">
										<label class="uk-form-label" for="form-stacked-text">ユーザID</label>
										<div class="uk-form-controls">
										<input type="text" placeholder="ID" name="id" class="validate[required,custom[number]] uk-input" id="id""/>


										</div>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="form-stacked-text">氏名</label>
										<div class="uk-form-controls">
										<input type="text" placeholder="情報太郎" name="student_name" class="validate[required] uk-input" id="student_name""/>



										</div>
									</div>


									<div class="uk-margin">
										<label class="uk-form-label" for="form-stacked-text">パスワード</label>
										<div class="uk-form-controls">
										<input type="password" placeholder="PASSWORD" name="student_pass" class="validate[required] uk-input" id="student_pass"/>

										</div>
										<small class="uk-flex uk-flex-middle uk-margin-small-top"></small>
									</div>
									<div class="uk-margin">
										<label class="uk-form-label" for="form-stacked-text">パスワード確認</label>
										<div class="uk-form-controls">
										<input type="password" placeholder="PASSWORD" name="student_pass2" class="validate[required,equals[student_pass]] uk-input" id="student_pass2""/>

										</div>
										<small class="uk-flex uk-flex-middle uk-margin-small-top"></small>
									</div>

									<div class="uk-margin">
<form name="form1">
										<label class="uk-form-label" for="form-stacked-text">メールアドレス</label>
										<div class="uk-form-controls">
										<input type="text" placeholder="joho@gmail.com" name="adress" class="validate[required,custom[email]] uk-input" id="student_address""/>

										</div>
										</form>
									</div>

</div>
									</div>
									<div class="uk-margin">
										<div class="uk-form-controls">
											<button class="uk-button uk-button-primary" onclick="addsubject()">登録</button>



<div id="studentregister">

</div>

										</div>
									</div>

							</div>
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
			<h2 class="uk-modal-title">エラー</h2>
			<p>入力されていない箇所があります</p>
		</div>
	</div>
	<div id="id_err" uk-modal>
		<div class="uk-modal-dialog uk-modal-body">
			<button class="uk-modal-close-default" type="button" uk-close></button>
			<h2 class="uk-modal-title">エラー</h2>
			<p>IDは半角数字で入力してください</p>
		</div>
	</div>
	<div id="err" uk-modal>
		<div class="uk-modal-dialog uk-modal-body">
			<button class="uk-modal-close-default" type="button" uk-close></button>
			<h2 class="uk-modal-title">エラー</h2>
			<p>パスワードが一致しません</p>
		</div>
	</div>
	<div id="mail_err" uk-modal>
		<div class="uk-modal-dialog uk-modal-body">
			<button class="uk-modal-close-default" type="button" uk-close></button>
			<h2 class="uk-modal-title">エラー</h2>
			<p>メールアドレスが正しくありません</p>
		</div>
	</div>

<div id="tyohuku_err" uk-modal>
		<div class="uk-modal-dialog uk-modal-body">
			<button class="uk-modal-close-default" type="button" uk-close></button>
			<h2 class="uk-modal-title">エラー</h2>
			<p>そのIDは使用されています</p>
		</div>
	</div>

<!--



<div id="form">
<table>
qa
<tr>jnjj
<th>ユーザID
</th>
<th>
    <input type="text" placeholder="ID" id="student_id" name="id" class="validate[required]"/>
</th>
</tr>
<tr>
<th>氏名
</th>
<th>
	<input type="text" placehowlder="情報太郎" id="student_name" name="name" class="validate[required]"/>
</th>
</tr>
<tr>
<th>パスワード
</th>s
<th>
    <input type="password" placeholder="PASSWORD" id="student_pass" name="pass" class="validate[required]"/>
</th>
</tr>
<tr>
<th>パスワード確認
</th>
<th>
    <input type="password" placeholder="PASSWORD" id="student_pass2" name="pass2" class="validate[required]"/>
</th>
</tr>

</table>
<div><input type="submit" class="gradientButton" value="登録" onclick="addsubject()"></div>
</div>
<div id="studentregister">
d
</div>

-->
<script type="text/javascript">


$(document).ready(function() {
	 $('.drawer').drawer();
});
 $(document).ready(function(){
        $("#form").validationEngine();
      });
 var socket = io.connect("http://192.168.11.10:8081/subject");

 socket.on("connected", function(name){});
 socket.on("miss", function(x) {
	 console.log(x);

		UIkit.modal("#tyohuku_err").show();
	});
 socket.on("ok", function() {
	// console.log(x);
	 window.alert('登録されました');
	 window.location.href = 'Login.jsp';

	});
 socket.on("classselect", function(rows) {
		classselect(rows);
});

 socket.on("studentregister", function(student_id, student_name, student_pass,student_address,student_class){studentregister(student_id, student_name, student_pass,student_address,student_class);});

 socket.emit("classselect");
	function classselect(rows) {
		$("#classselect").html("");
		var test = '<select id="class" name="pulldown1" class="test9 uk-select">'
				+ '<option value="0">クラスを選んでください</option>';
		for (var i = 0; i < rows.length; i++) {
			test += '<option id="1" value='+rows[i].class_id+'>'
					+ rows[i].class_name + '</option>';
				//	console.log(rows[i].class_id);

		}

		$("#classselect").append(test);
	};



 function start(room){
		socket.emit("connected", room);
	}
 function addsubject(){
	  // value値を取得する
	  var student_id = document.getElementById("id").value;
	  var student_name = document.getElementById("student_name").value;
	  var student_pass = document.getElementById("student_pass").value;
	  var student_pass2 = document.getElementById("student_pass2").value;
	  var student_address = document.getElementById("student_address").value;
	  var student_class = document.getElementById("class").value;
	//  var atai= document.getElementById("atai");


	  var city = $('#class option:selected').text();



	//  socket.emit("tyohuku",student_id);



	if(student_id==""||student_name==""||student_pass==""||student_pass2==""||student_address==""||student_class==0){
		UIkit.modal("#err").show();
		return;
	}else if(!document.form1.adress.value.match(/.+@.+\..+/)){
		UIkit.modal("#mail_err").show();
		return;
	}else if(student_pass!=student_pass2){
		UIkit.modal("#pass_err").show();
		return;
	}else if(isNaN(student_id)){
		UIkit.modal("#id_err").show();
		return;
	}else if(window.confirm('この内容で登録しますか？\nクラス:'+city+'\nユーザID:'+student_id+'\n氏名:'+student_name+'\nメールアドレス:'+student_address)){


	//		 window.alert('IDを入力してください');
	//	}else if(student_name==""){
	//		 window.alert('氏名を入力してください');


	//	}else if(student_pass==""){
	//		window.alert('パスワードを入力してください');

	//	}else if(student_pass!=student_pass2){
		//	window.alert('パスワードが一致しません');
//		}else{




	//  var student_id = document.getElementById('student_id').value;
	 // var student_name=document.getElementById('student_name').value;
	 // var student_pass=document.getElementById('student_pass').value;

	  socket.emit("studentregister",student_id, student_name, student_pass,student_address,student_class);


	 // console.log(rows.length);
//	location.reload();


	// }else{
	}
			//window.alert('キャwンセルされました'); // 警告ダイアログを表示

	//	}a
	//	}
		// locatiawon.reload();
	// console.log(subject_id);

 };


 </script>

<script type="text/javascript">

</script>
  </body>
</html>