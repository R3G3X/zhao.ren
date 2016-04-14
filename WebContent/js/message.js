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
		var innerhtml;
		if(json){
			if(json.toClientId){
				clientFrom = json.toClientId;
				messageGet = json.msg;
				time = json.timestamp;
				innerhtml = "<div class=\"message-box\">"+
                    "<div class=\"toMessage\">"+
                      messageGet+
                    "</div>"+
                  "</div>";
			}else{
				clientFrom = json.fromClientId;
				messageGet = json.msg;
				time = json.timestamp;
				innerhtml = "<div class=\"message-box\">"+
                    "<div class=\"fromMessage\">"+
                      messageGet+
                    "</div>"+
                  "</div>";
			}
		}
		$("#target-message").append(innerhtml);

	};

	websocket.onclose = function(e){
		console.log('disconnect');
	}
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
	console.log('send');
}

$(document).ready(function(){
	var username=$.cookie("zhao_ren_token");
	var target=$(".item-activated>a").text();
	start(username);
	$("#btn-send").click(function(){
		send(username,target,$("#message").val());
	})
	$(".personal-center-control-item>a").click(function(){
		$(".item-activated").removeClass("item-activated").addClass("item-deactivated");
		$(this).parent().removeClass("item-deactivated").addClass("item-activated");
		target=$(".item-activated>a").text();
		$(".personal-center-right-title>p").text("正在与 "+target+" 进行对话");
	})
})
