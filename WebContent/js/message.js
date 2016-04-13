var socketServer = "ws://kaitohh.com:8000";
websocket = new WebSocket(socketServer);

function start (client){
	websocket.onopen = function(e){
		console.log('login2');
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
		if(json){
			if(json.toClientId){
				clientFrom = json.toClientId;
				messageGet = json.msg;
				time = json.timestamp;
			}else{
				clientFrom = json.fromClientId;
				messageGet = json.msg;
				time = json.timestamp;
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
	var username=$.cookie("zhao_ren_token");
	console.log($("#username-to").val());
	start(username);
	$("#btn-send").click(function(){
		send(username,$("#username-to").val(),$("#message").val());
	})
})
