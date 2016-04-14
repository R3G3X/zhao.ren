var socketServer = "ws://kaitohh.com:8000";
websocket = new WebSocket(socketServer);
var preTime = 0;
var temp;
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
		var json = JSON.parse(e.data);
		var clientFrom;
		var messageGet;
		var time;
		var innerhtml;
		var index = 0;
		console.log('message');
		console.log(e.data)
		if(json){
			messageGet = json.msg;
			var substr = messageGet;
			while(substr.indexOf("\n") != -1){
				index ++;
				substr = substr.substring(substr.indexOf("\n")+1,substr.length);
			}
			index ++;
			time = json.timestamp;
			if(time - preTime > 300000){
				innerhtml =	"<div id=\"receive-time\"><p>"+getTime(time)+"</p></div>";
				preTime = new Date().getTime();
			}
			$("#target-message-"+$(".item-activated>a").text()).append(innerhtml);


			if(json.toClientId){
				clientFrom = json.toClientId;
				innerhtml = "<div class=\"message-box\">"+
                    "<div class=\"toMessage\">";
				for(var i = 0; i < index; i++)
					innerhtml += "<p class=\""+i+"\"></p>";
				innerhtml += "</div>"+
                  	 "</div>";

			}else{
				clientFrom = json.fromClientId;
				innerhtml = "<div class=\"message-box\">"+
                    "<div class=\"fromMessage\">";
				for(var i = 0; i < index; i++)
					innerhtml += "<p class=\""+i+"\"></p>";
				innerhtml += "</div>"+
                  	 "</div>";
			}
		}
		div = $(".item-activated>a").text();
		$("#target-message-"+div).append(innerhtml);
		substr = messageGet;
		for(var i = 0; i < index - 1; i++){
			$("."+i+":last").text(substr.substring(0,substr.indexOf("\n")));
			substr = substr.substring(substr.indexOf("\n")+1,substr.length);
		}
		$("."+i+":last").text(substr);
		$(".message-box:last").height($(".message-box:last").children().outerHeight()+25);

		index = 0;
		setTimeout("changeHight("+div+")",5);
	};

	websocket.onclose = function(e){
		console.log('disconnect');
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
	console.log('send');
}

$(document).ready(function(){
	var username=$.cookie("zhao_ren_token");
	var target=$(".item-activated>a").text();
	$("#target-message-"+target).removeClass("hidden");
	$(".personal-center-right-title>p").text("正在与 "+target+" 进行对话");
	start(username);

	$("#btn-send").click(function(){
		msgSend();
	})

	$('#message').keydown(function(e){
    if(e.keyCode==13 && !e.ctrlKey){
    	var selectText = document.selection.createRange();
			if(selectText){
		  	if(selectText.text.length > 0)
  				selectText.text += "\r\n";
 				else
  				selectText.text = "\r\n";
 				selectText.select();
			}
    }else if(e.keyCode == 13 && e.ctrlKey){
			msgSend();
		}else{
			$("#message").attr("placeholder","")
		}
  });

	$(".personal-center-control-item").click(function(){
		$(".item-activated").removeClass("item-activated").addClass("item-deactivated");
		$(this).removeClass("item-deactivated").addClass("item-activated");
		$(".target-message").addClass("hidden");

		target=$(".item-activated>a").text();

		$("#target-message-"+target).removeClass("hidden");
		$(".personal-center-right-title>p").text("正在与 "+target+" 进行对话");
	})
	function msgSend(){
	if($("#message").val() != "" && $("#message").val() != null)
		send(username,target,$("#message").val());
	else
		$("#message").attr("placeholder","消息不能为空")
	$("#message").val("");
}
})

function changeHight(targetDiv){
	var beforeHeight = $("#target-message-"+targetDiv).scrollTop();
	$("#target-message-"+targetDiv).scrollTop(beforeHeight+20);
	var afterHeight = $("#target-message-"+targetDiv).scrollTop();
	if(beforeHeight == afterHeight){
	}else{
		setTimeout("changeHight("+targetDiv+")",5);
	}
}

function getTime(nS) {
   return new Date(parseInt(nS)).Format("yyyy-MM-dd hh:mm:ss").toLocaleString();
}

Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3)
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
