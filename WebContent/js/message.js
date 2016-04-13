var socketServer = "ws://kaitohh.com:8000";
websocket = new WebSocket(socketServer);

function start (client){
	websocket.onopen = function(e){
		console.log('login');
		var msg = JSON.stringify({
			cmd:"login",
			clientId:client
		})
		websocket.send(msg);
	};
	websocket.onmessage = function(e){
		console.log('message');
		console.log(e.data);
		var clientFrom;
		var messageGet;
		var time;
		var json = JSON.parse(e.data);
		if(json.data){
			if(json.data.toClientId){
				clientFrom = json.data.toClientId;
				messageGet = json.data.msg;
				time = json.data.timestamp;
			}else{
				clientFrom = json.data.toClientId;
				messageGet = json.data.msg;
				time = json.data.timestamp;
			}
		}
		var innerhtml = "<p>"+clientFrom+"</p>"+"<p>"+messageGet+"</p>";
		$("#target-message").append(innerhtml);

	};
}

function send(fromClient, toClient, message){
	websocket.send(
		JSON.stringify({
			cmd:'msg',
			fromClientId:fromClient,
			toClientId:toClient,
			msg:message
		})
	);
}

$(document).ready(function(){
	start(client);
	$("#btn-send").click(function(){
		send($("#username-to").val(),$("#username-from"),$("#message").val());
	})
})