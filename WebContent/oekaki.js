var roomid = document.getElementById("roomid").value;
var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');
var test = 0;

// 192.168.11.10
// 192.168.2.131

var socket = io.connect("http://192.168.11.10:8081/oekaki",{
	'reconnection': true,
	'reconnectionDelay': 1000,
	'reconnectionDelayMax' : 5000,
	'reconnectionAttempts': 5
	});

//console.log(socket);
//
//if(socket.connected == 'true') {
//
//} else {
//	console.log("fa");
//	socket = io.connect("http://192.168.2.131:8081/oekaki",{
//		'reconnection': true,
//		'reconnectionDelay': 1000,
//		'reconnectionDelayMax' : 5000,
//		'reconnectionAttempts': 5
//		});
//	console.log(socket);
//}

var canvas = new fabric.Canvas('canvas', {
	isDrawingMode : true,
	backgroundColor : 'rgb(250,250,250)',// この色でぬりつぶす.

});

socket.on("connected", function(name) {
});
socket.on("publish", function(data) {
	addMessage(data);
});
socket.on("size", function(data) {
	addSize(data);
});
socket.on("object", function(data,username) {
	addObject(data,username);
});
socket.on("text", function(data) {
	addText(data);
});
socket.on("event", function(e) {
	Event(e);
});
socket.on("img", function(img) {
	addImg(img);
});

socket.on("unko", function(msg,username) {
	console.log("line");
	addMsg(msg,username);
});

socket.on("disconnect", function() {
});

start(roomid);

console.log(roomid);
function start(room) {
	socket.emit("connected", room);
}

function addMsg(msg,username) {
	console.log("kitemasu");
	var DD = new Date();
	var Hours = DD.getHours();
	var Minutes = DD.getMinutes();
	var time = Hours +":"+Minutes;
	$("#msg").append('<div class="line__left"><div class="line__left-text"><div class="name">'+ username +'</div><div class="text">'+ msg +'<span class="date">'+ time +'</span></div></div></div>');
	$(".line__contents.scroll").scrollTop( $(".line__contents.scroll")[0].scrollHeight );
}


function addMessage(json) {
	canvas.loadFromJSON(json).renderAll();
	canvas.backgroundColor='rgb(250,250,250)';
	canvas.renderAll();

};

function addSize(json) {
	canvas.backgroundColor='rgb(250,250,250)';
	canvas.setHeight(json.wid);
	canvas.setWidth(json.hei);
	canvas.renderAll();
};
var timer = false;
var namehairetu = [];
function addObject(json,name) {
	var path = new fabric.Path(json.path);
	path.set(json);
	canvas.add(path);
	//console.log(canvas._objects);
	//ctx.clearRect(0, 0, canvas.width, canvas.height);
//	if(namehairetu.indexOf(name) == -1) {
//		namehairetu.push(name);
//		$("#timeout").append('<p>' + name + 'が線を引いた</p>');
//	}
//	//$("#timeout").append('<p>' + name + 'が線を引いた</p>');
//	$("#timeout").fadeIn();
//
//	if (timer != false)  clearTimeout(timer);
//		timer = setTimeout(function() {
//			//ここに遅延実行する処理の内容
//			$("#timeout").fadeOut();
//			timer = false;
//			$("#timeout").html("");
//			namehairetu = [];
//		}, 3000);

	UIkit.notification({
	    message: name + 'が線を引いた',
	    status: 'primary',
	    pos: 'top-right',
	    timeout: 500
	});

};

function addText(text) {
	console.log(text);
	var txt = new fabric.Text(text, {
		left : 20,
		top : 20,
		fill : 'red',
		stroke : 'red',
		strokeWidth : 0.5,
		fontSize : 20
	});
	console.log(text);
	canvas.add(txt);
	// canvas.renderAll();
};

function Event(e) {
	e.target.opacity = 1;
	console.log(e);
	canvas.loadFromJSON(e).renderAll();
	// canvas.renderAll();
};


function addImg(img) {
	canvas.add(img).renderAll();
	var a = canvas.setActiveObject(img);
	var dataURL = canvas.toDataURL({
		format : 'png',
		quality : 0.8
	});
};


function addCount(json) {
	canvas.loadFromJSON(json).renderAll();
};

this.canvas.freeDrawingBrush = new fabric.PencilBrush(this.canvas);
this.canvas.freeDrawingBrush.color = 'black';
this.canvas.freeDrawingBrush.width = 3;
this.canvas.freeDrawingBrush.shadowBlur = 0;
this.canvas.hoverCursor = 'move';

//document.getElementById('select').addEventListener("click", function() {
//	canvas.isDrawingMode = !canvas.isDrawingMode
//}, false);
/*
 * var data;
 *
 * document.getElementById('toJSON').addEventListener("click", function(){ data =
 * canvas; socket.emit("publish",data);}, false);
 *
 * document.getElementById('loadJSON').addEventListener("click", function(){
 * canvas.loadFromJSON(data).renderAll() }, false);
 *
 *
 * document.getElementById('toSVG').addEventListener("click", function(){ data =
 * canvas.toSVG(); }, false);
 *
 * document.getElementById('loadSVG').addEventListener("click", loadSVG, false);
 *
 * function loadSVG(){ var c = canvas; fabric.loadSVGFromString(data,
 * function(objects, options) { var obj = fabric.util.groupSVGElements(objects,
 * options); c.add(obj).renderAll(); }); }
 */

//document.getElementById('deleteAll').addEventListener("click", function() {
//	canvas.clear().renderAll();
//	canvas.backgroundColor='rgb(250,250,250)';
//	canvas.renderAll();
//	kousin();
//}, false);
//document.getElementById("add").onclick = function() {
//	var t = document.getElementById("text").value;
//	var txt = new fabric.Text(t, {
//		left : 20,
//		top : 20,
//		fill : 'red',
//		stroke : 'red',
//		strokeWidth : 0.5,
//		fontSize : 20
//	});
//	socket.emit("text", t, roomid);
//	canvas.add(txt);
//};

//document.getElementById("set").onclick = function() {
//	var wid = document.getElementById("wid").value;
//	var hei = document.getElementById("hei").value;
//	var size = {
//		wid : wid,
//		hei : hei
//	};
//
//	socket.emit("size", size, roomid);
//
//	canvas.setHeight(wid);
//	canvas.setWidth(hei);
//	canvas.renderAll();
//
//};
// マウス判定
/*
 * window.onmouseup = function() { data = canvas; socket.emit("publish",data); };
 */

//画像保存
//$("#save").click(function() {
//	$("#canvas").get(0).toBlob(function(blob) {
//		saveAs(blob, "aaa.jpeg", 0.95);
//	});
//});

$("#delete").click(function() {
	canvas.isDrawingMode = false;
	deleteObjects();

});


//json保存
$("#save1").click(function() {
	apiRequest();

});

//チャット送信
document.getElementById("send").onclick = function() {
	var msg = document.getElementById("linemsg").value;
	var DD = new Date();
	var Hours = DD.getHours();
	var Minutes = DD.getMinutes();
	var time = Hours +":"+Minutes;
	$("#msg").append('<div class="line__right"><div class="text">' + msg + ' <span class="date">既読<br>'+ time +'</span></div></div></div>');
	$(".line__contents.scroll").scrollTop( $(".line__contents.scroll")[0].scrollHeight );
	socket.emit("line", msg,roomid,"ore");



};

//$("#send").click(function() {
//	socket.emit("line","aa",roomid,"ore");
//	$("#msg").append('<div class="line__left"><div class="line__left-text"><div class="name">うさきち</div><div class="text">ねぇねぇ、帰ってくるのおそいんだけど！！今どこいまどこいまどこーー</div></div></div>');
//	console.log("kita");
//
//});

function funcBlack() {
	canvas.freeDrawingBrush = new fabric.PencilBrush(canvas);
	canvas.freeDrawingBrush.color = 'black';
	canvas.freeDrawingBrush.width = 3;
	canvas.freeDrawingBrush.shadowBlur = 0;
}

function funcRed() {
	canvas.freeDrawingBrush = new fabric.PencilBrush(canvas);
	canvas.freeDrawingBrush.color = 'red';
	canvas.freeDrawingBrush.width = 3;
	canvas.freeDrawingBrush.shadowBlur = 0;
}

function deleteObjects() {
	var activeObject = canvas.getActiveObjects();
	console.log(activeObject);
	for (var i = 0; i < activeObject.length; i++) {
		canvas.remove(activeObject[i]);
	}
	$("#selectdel").html("");
	$("#selectdel").append('<a href="#" onclick="deleteObjects()"><span class="uk-margin-small-right" uk-icon="icon: trash"></span> 選択中のアイテムを削除</a>');
	kousin();
}

document.getElementById('file').addEventListener("change", function(e) {
	var file = e.target.files[0];
	var reader = new FileReader();
	reader.onload = function(f) {
		var data = f.target.result;
		fabric.Image.fromURL(data, function(img) {
			var oImg = img;
			canvas.add(oImg).renderAll();

			// socket.emit("img",oImg);
			var a = canvas.setActiveObject(oImg);
			var dataURL = canvas.toDataURL({
				format : 'png',
				quality : 0.8
			});
		});
	};
	reader.readAsDataURL(file);
	window.setTimeout("kousin()", "100")
});
//window.setTimeout("clicJoin()", "400");

//function clicJoin() {
//	document.getElementById('join').click();
//}

function kousin() {
	var data = canvas;
	socket.emit("publish", data, roomid);
}

canvas.on('path:created', function(e) { // or 'object:added'
	var i = canvas.getObjects();
	var data = canvas;

	socket.emit("object", i[i.length - 1], data, roomid, "ore");

});

canvas.on('object:moved', function(e) { // or 'object:added'

	var data = canvas;

	kousin();

});

canvas.on({
	'selection:created' : function(e) { // or 'object:added'
		$("#selectdel").html("");
		$("#selectdel").append('<a href="#" onclick="deleteObjects()" class="uk-text-danger"><span class="uk-margin-small-right" uk-icon="icon: trash"></span> 選択中のアイテムを削除</a>');
		console.log("select");

	},
	'selection:cleared' : function(e) {
		$("#selectdel").html("");
		$("#selectdel").append('<a href="#" onclick="deleteObjects()"><span class="uk-margin-small-right" uk-icon="icon: trash"></span> 選択中のアイテムを削除</a>');
		console.log("aa");
	}

});

canvas.on('mouse:up', function(e) { // or 'object:added'

	// var i = canvas.getObjects();
	// socket.emit("object", i[i.length - 1]);
});

canvas.on({
	'object:moving' : function(e) {

	},
	'object:modified' : function(e) {

	}
});

//sql(roomid);


async function apiRequest() {
	var json = canvas;
	var data = JSON.stringify(json);
	var blob = new Blob([ data ], {
		type : "application/json"
	});

	var saveAs = window.saveAs;
	saveAs(blob, "my_outfile.json");
}

document.getElementById('filejson').addEventListener("change", function(e) {
	var result = e.target.files[0];

	// FileReaderのインスタンスを作成する
	var reader = new FileReader();

	// 読み込んだファイルの中身を取得する
	reader.readAsText(result);

	// ファイルの中身を取得後に処理を行う
	reader.addEventListener('load', function() {

		canvas.loadFromJSON(reader.result).renderAll()

	})
});

//var form = document.forms.myform;
//
//form.myfile.addEventListener('change', function(e) {
//
//	var result = e.target.files[0];
//
//	// FileReaderのインスタンスを作成する
//	var reader = new FileReader();
//
//	// 読み込んだファイルの中身を取得する
//	reader.readAsText(result);
//
//	// ファイルの中身を取得後に処理を行う
//	reader.addEventListener('load', function() {
//
//		canvas.loadFromJSON(reader.result).renderAll()
//
//	})
//
//})

$(function() {

	// セレクトボックスが切り替わったら発動
	$('select').change(function() {
		var val = $(this).val();
		console.log(val);
		socket.emit("sql", roomid, val);
	});
});


//href用
var selflag = true;
function select() {
	canvas.isDrawingMode = !canvas.isDrawingMode;
	if(selflag) {
		$("#modeselect").html("");
		$("#modeselect").append('<a href="#" onclick="select()" class="uk-text-primary"><span class="uk-margin-small-right" uk-icon="icon: move"></span> 選択モード</a>');
		selflag = false;
	} else {
		$("#modeselect").html("");
		$("#modeselect").append('<a href="#" onclick="select()"><span class="uk-margin-small-right" uk-icon="icon: move"></span> 選択モード</a>');
		selflag = true;
	}
}

function deleteAll() {
	canvas.clear().renderAll();
	canvas.backgroundColor='rgb(250,250,250)';
	canvas.renderAll();
	kousin();
}

function textadd() {
	var t = document.getElementById("text").value;
	var txt = new fabric.Text(t, {
		left : 20,
		top : 20,
		fill : 'red',
		stroke : 'red',
		strokeWidth : 0.5,
		fontSize : 20
	});
	socket.emit("text", t, roomid);
	canvas.add(txt);
}

function setsize() {
	var wid = document.getElementById("wid").value;
	var hei = document.getElementById("hei").value;
	var size = {
		wid : wid,
		hei : hei
	};

	socket.emit("size", size, roomid);

	canvas.setHeight(wid);
	canvas.setWidth(hei);
	canvas.renderAll();
}

function saveimage() {
	$("#canvas").get(0).toBlob(function(blob) {
		saveAs(blob, "aaa.jpeg", 0.95);
	});
}

function addimage() {
	var file = e.target.files[0];
	var reader = new FileReader();
	reader.onload = function(f) {
		var data = f.target.result;
		fabric.Image.fromURL(data, function(img) {
			var oImg = img;
			canvas.add(oImg).renderAll();

			// socket.emit("img",oImg);
			var a = canvas.setActiveObject(oImg);
			var dataURL = canvas.toDataURL({
				format : 'png',
				quality : 0.1
			});
		});
	};
	reader.readAsDataURL(file);
	window.setTimeout("kousin()", "100")
}

