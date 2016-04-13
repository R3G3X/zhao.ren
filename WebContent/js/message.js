var socketServer = "ws://localhost:8000";
websocket = new WebSocket(socketServer);
var client = "asdf"

function start (client){
	websocket.onopen = function(e){
		var msg = JSON.stringify({
			cmd:"login",
			clientId:client
		})
	}
}

function send(fromClient, toClient, message){
	websocket.send(
		JSON.stringify({
			cmd:msg,
			fromClientId:fromClient,
			toClientId:toClient
		})
	);
}

$(document).ready(function(){
	start(client);

	$("#btn-sent").click(function(){
		send(client,client,$("#message").val());
	})
})