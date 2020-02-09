var roomid = document.getElementById("roomid").value;
var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');
var test = 0;

// 192.168.11.10
// 192.168.2.131

var socket = io.connect("http://192.168.11.10:8081/oekaki");

socket.on("connected", function(name) {
});
socket.on("publish", function(data) {
	addMessage(data);
});
socket.on("size", function(data) {
	addSize(data);
});
socket.on("object", function(data) {
	addObject(data);
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
socket.on("sql", function(rows) {
	addSql(rows);
});
socket.on("disconnect", function() {
});

start(roomid);

console.log(roomid);
function start(room) {
	socket.emit("connected", room);
}

function sql(room) {
	socket.emit("sql", room);
}

function addMessage(json) {
	canvas.loadFromJSON(json).renderAll();
};

function addSize(json) {
	canvas.setHeight(json.wid);
	canvas.setWidth(json.hei);
	canvas.renderAll();
};

function addObject(json) {
	var path = new fabric.Path(json.path);
	path.set(json);
	canvas.add(path);
	console.log(canvas._objects);
	// canvas.renderAll();
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

function addSql(rows) {
	$("#sql").html("");
	for (var i = 0; i < rows.length; i++) {
		$("#sql").append('id: ' + rows[i].empid + '<br>');
		$("#sql").append('pass: ' + rows[i].emppasswd + '<br>');
		console.log("sql");
		console.log('id: ' + rows[i].empid);
		console.log('pass: ' + rows[i].emppasswd);
	}
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

var canvas = new fabric.Canvas('canvas', {
	isDrawingMode : true,
	backgroundColor : 'rgb(250,250,250)',// この色でぬりつぶす.

});

function addCount(json) {
	canvas.loadFromJSON(json).renderAll();
};

this.canvas.freeDrawingBrush = new fabric.PencilBrush(this.canvas);
this.canvas.freeDrawingBrush.color = 'black';
this.canvas.freeDrawingBrush.width = 3;
this.canvas.freeDrawingBrush.shadowBlur = 0;
this.canvas.hoverCursor = 'move';

document.getElementById('select').addEventListener("click", function() {
	canvas.isDrawingMode = !canvas.isDrawingMode
}, false);
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

document.getElementById('deleteAll').addEventListener("click", function() {
	canvas.clear().renderAll();
	kousin();
}, false);
document.getElementById("add").onclick = function() {
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
};

document.getElementById("set").onclick = function() {
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

};
// マウス判定
/*
 * window.onmouseup = function() { data = canvas; socket.emit("publish",data); };
 */
$("#save").click(function() {
	$("#canvas").get(0).toBlob(function(blob) {
		saveAs(blob, "aaa.jpeg", 0.95);
	});
});

$("#delete").click(function() {
	canvas.isDrawingMode = false;
	deleteObjects();

});

$("#save1").click(function() {
	apiRequest();

});

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
window.setTimeout("clicJoin()", "400");

function clicJoin() {
	document.getElementById('join').click();
}

function kousin() {
	var data = canvas;
	socket.emit("publish", data, roomid);
}

canvas.on('path:created', function(e) { // or 'object:added'
	var i = canvas.getObjects();
	var data = canvas;

	socket.emit("object", i[i.length - 1], data, roomid);

});

canvas.on('object:moved', function(e) { // or 'object:added'

	var data = canvas;

	kousin();

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

sql(roomid);


async function apiRequest() {
	var json = canvas;
	var data = JSON.stringify(json);
	var blob = new Blob([ data ], {
		type : "application/json"
	});

	var saveAs = window.saveAs;
	saveAs(blob, "my_outfile.json");
}

var form = document.forms.myform;

form.myfile.addEventListener('change', function(e) {

	var result = e.target.files[0];

	// FileReaderのインスタンスを作成する
	var reader = new FileReader();

	// 読み込んだファイルの中身を取得する
	reader.readAsText(result);

	// ファイルの中身を取得後に処理を行う
	reader.addEventListener('load', function() {

		canvas.loadFromJSON(reader.result).renderAll()

	})

})

$(function() {

	// セレクトボックスが切り替わったら発動
	$('select').change(function() {
		var val = $(this).val();
		console.log(val);
		socket.emit("sql", roomid, val);
	});
});
$("#mydialog2").dialog("open");
$(function(){
	  // ダイアログの初期設定
	  $("#mydialog2").dialog({
	    autoOpen: true,  // 自動的に開かないように設定
	    width: 500,       // 横幅のサイズを設定
	    modal: true,      // モーダルダイアログにする
	    buttons: [        // ボタン名 : 処理 を設定
	      {
	        text: '作成',
	        click: function(){
	        	var t = document.getElementById("roomname").value;
	        	socket.emit("roomsql",t);
	       		select();
	        	$("#mydialog2").dialog("close");

	        }
	      }
	    ]
	  });

	  $("#btn_action2").click(function(){
	    // ダイアログの呼び出し処理
	    $("#mydialog2").dialog("open");
	  });
})
