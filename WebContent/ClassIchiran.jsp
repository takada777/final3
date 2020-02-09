<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生徒一覧</title>
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


* {
  margin:0; padding:0;
}








a {
  color: #000;
}

/* header */
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
.uk-position-center {
	max-height: 10px;
}

.select-area{
	text-align:center;
}
</style>
</head>

<form id="form">
<div class="uk-margin">
<br>
<br>
<br>

										<div class="uk-form-controls">



<div class="select-area">

 <br> <br> <br> <br> <br>

									<label class="uk-form-label" for="form-stacked-text" >クラス登録</label>
  <br> <br>

   <input type="text" placeholder="クラス名" name="classname" id="class_name" class=" uk-input uk-form-width-medium" id="form-stacked-text""/>
    <br>

    <br>
 <input type="button" class="uk-button uk-button-primary" value="登録" onclick="addclass()">
</div>
</div>
</div>
<div class="uk-position-center">

<input type="button" class="btn uk-button uk-button-default uk-button-small " onclick="Click_Sub1(false)" value="全解除"><input type="button" class="uk-button uk-button-default uk-button-small btn" onclick="Click_Sub1(true)" value="全選択">

	<div id="sql4">

</div>
</div>
</form>

<div id="addclass">

</div>

<div id="deleteclass">

</div>
<div id="ero" uk-modal>
		<div class="uk-modal-dialog uk-modal-body">
			<button class="uk-modal-close-default" type="button" uk-close></button>
			<h2 class="uk-modal-title">エラー</h2>
			<p>クラス名を入力してください</p>
		</div>
	</div>
<body>
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
	$(document).ready(function(){
        $("#form").validationEngine();
      });
$(document).ready(function() {
	 $('.drawer').drawer();
});


var socket = io.connect("http://192.168.11.10:8081/subject");
socket.on("connected", function(name){});
socket.on("classdisp2", function(rows){classdisp2(rows);});
socket.on("addclass", function(class_id,class_name){addclass(class_id,class_name);});



socket.on("disconnect", function(){});
socket.on("deleteclass", function(class_id2){deleteclass(class_id2);});
function start(room){
	socket.emit("connected", room);
}

function sql(room){
	socket.emit("sql",room);
}
function deleteclass(class_id){
	socket.emit("deleteclass",class_id);

}
function classdisp2(rows){
	$("#sql4").html("");

	var table = '<span id="span2"></span><table class="uk-table uk-table-striped uk-table-large uk-width-xxlarge" >'
	+'<tr><th>クラス名</th><th><div><input type="button" class="uk-button uk-button-default uk-button-small" id="button" value="削除" onclick="deleteclass()" ></div></th></tr>';
	//console.log(table);
	for( i = 0;i < rows.length;i++) {
		 test=rows[i].class_id;
		table += '<tr>'+'<td>'+rows[i].class_name+'</td><td>'+
				'<input type="checkbox" id=class_id2 name="riyu" class="uk-checkbox" value='+test+'></td>';
		// 	$("#sql3").append('科目ID ' + rows[i].subject_id );
		//var test=document.rows[i].subject_id;
		 //	$("#sql3").append('科目名 ' + rows[i].subject_name + '<br>');
//console.log(test);

	}
	table += '</table>';
	$("#sql4").append(table);
	//canvas.renderAll();
};
socket.emit("classdisp2");
function addclass(){
	  // value値を取得する

//	  var subject_id = document.getElementById('subject_id').value;
	  var class_name=document.getElementById('class_name').value;
	//console.log(subject_name);

	 // alert("value値は「" + subject_id + "」です");
//	 if(subject_id==""&&subject_name==""){
//		 alert('科目IDと科目名を入力してください');
//	 }else if(subject_id==""&&subject_name!=""){
//		 alert('科目IDを半角数字で入力してください');


	// }else if(subject_id!=""&&subject_name==""){
	//	 alert('科目名を入力してください');
//	 }else	if(Number.isInteger (parseInt(subject_id))){
if(class_name!=""){
		 socket.emit("addclass",class_name);
		 location.reload();
}else{

	UIkit.modal("#ero").show();
	return;
	// <h2 class="uk-modal-title">エラー</h2>
		//<p>提出期限が入力されていません</p>
}
//	}else {
	//	 alert('科目IDは半角数字で入力してください'ｓ);
	//}

	};
function deleteclass(){

	// subject_id2 = document.getElementById('subject_id2').value;
	 array=[];
	 const class_id3 = document.getElementsByName("riyu");
	 for (var i = 0; i < class_id3.length; i++){
		 if(class_id3[i].checked){
			array.push(class_id3[i].value);



			for(var j=0;j<array.length;j++){






		 class_id2=parseInt(array[j]);
			 console.log(class_id2);
			 socket.emit("deleteclass",class_id2);
			}
		 }
		location.reload();
	 }
	// document.getElementById("span2").textContent = idarray;
	//socket.emit("deletesubjあect",あsubｑject_id2);
	//console.log(subject_id2);
//console.log(subject_id2);

}
function Click_Sub1(check) {
    for(x = 0; x < document.all.riyu.length; x++){
        document.all.riyu[x].checked = check;
    }
}
</script>

</body>
</html>