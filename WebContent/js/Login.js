var socket = io.connect("http://192.168.11.10:8081/login", {
	'reconnection' : true,
	'reconnectionDelay' : 1000,
	'reconnectionDelayMax' : 5000,
	'reconnectionAttempts' : 5
});

socket.on("login", function() {
	UIkit.modal("#err").show();
});

socket.on("seikou", function() {
	seikou();
});

function seikou() {
	var f = document.forms["form1"];
    f.method = "get";
    f.submit();
    return true;
};


function clic() {
	var id = $('#id').val();
	var pass = $('#pass').val();
	socket.emit("login",id,pass);
}

