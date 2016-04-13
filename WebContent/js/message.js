var socketServer = "ws://kaitohh.com:8000";
websocket = new WebSocket(socketServer);
var client = "asdf"

function start (client){
	websocket.onopen = function(e){
		console.log('login');
		var msg = JSON.stringify({
			cmd:"login",
			clientId:client
		})
		websocket.send(msg);
	}
}

function send(fromClient, toClient, message){
	console.log('send');
	websocket.send(
		JSON.stringify({
			cmd:message,
			fromClientId:fromClient,
			toClientId:toClient
		})
	);
}

$(document).ready(function(){
	start(client);

	$("#btn-send").click(function(){
		send(client,client,$("#message").val());
	})
})