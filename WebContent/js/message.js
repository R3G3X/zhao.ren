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
			if(time - preTime > 30000){
				innerhtml =	"<div id=\"receive-time\"><p>"+getTime(time)+"</p></div>";
				preTime = new Date().getTime();
			}
			$("#target-message-"+$(".item-activated>.id").text()).append(innerhtml);


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
		div = $(".item-activated>.id").text();
		$("#target-message-"+div).append(innerhtml);
		substr = messageGet;
		for(var i = 0; i < index - 1; i++){
			$("#target-message-"+div+" ."+i+":last").text(substr.substring(0,substr.indexOf("\n")));
			substr = substr.substring(substr.indexOf("\n")+1,substr.length);
		}
		$("#target-message-"+div+" ."+i+":last").text(substr);
		$("#target-message-"+div+" .message-box:last").height($("#target-message-"+div+" .message-box:last").children().outerHeight()+20);

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
	var target=$(".item-activated>.id").text();
	if(username !=null && username!="")
		$("#btn-chat").removeClass("hidden");
	$("#target-message-"+target).removeClass("hidden");
		$("#toName").text(target);
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

	$(".id").click(function(){
		$(".item-activated").removeClass("item-activated").addClass("item-deactivated");
		$(this).parent().removeClass("item-deactivated").addClass("item-activated");
		$(".target-message").addClass("hidden");

		target=$(this).text();

		$("#target-message-"+target).removeClass("hidden");
		$("#toName").text(target);
	})
	$(".btn-delete").click(function(){
		$(".item-activated").removeClass("item-activated").addClass("item-deactivated");
		$(".target-message").addClass("hidden");
		if($(this).parent().siblings().length != 0){
			if($(this).parent().next().length != 0){
				$(this).parent().next().removeClass("item-deactivated").addClass("item-activated");
				target=$(this).parent().next().children(".id").text();
			}else{
				$(this).parent().prev().removeClass("item-deactivated").addClass("item-activated");
				target=$(this).parent().prev().children(".id").text();
			}
			$("#target-message-"+target).removeClass("hidden");
			$("#toName").text(target);
		}else{
			$("#chatroom-right-title-content>p").text("");
			$("#chatroom-right-title-content>p").slice(1).text("您还没有发起聊天哦QAQ");
			$("#toName").text("");
			$("#target-message").removeClass("hidden");
		}
		$.post("../../jsp/doDeleteChatPerson.jsp",
                {"target":$(this).prev("input")val()},
                function(data, status, xhr){
                	alert("a");
                    // location.reload();
                })
    .error(function(data,status,e){
    });
		$(this).parent().remove();
	})
	$("#btn-chat").click(function(){
		$(this).addClass("hidden");
		$("#chatroom").removeClass("hidden");
	})
	$("#btn-minimize").click(function(){
		$("#btn-chat").removeClass("hidden");
		$("#chatroom").addClass("hidden");
	})
	$("#user-message>a").click(function(){
		var innerhtml = "";
		innerhtml += "<li class=\"chatroom-left-userlist-item item-activated\">"
							 + "<a class=\"id\"></a>"
							 + "<input class=\"userId\" type=\"hidden\" value=\""+$("#userId").val()+"\"/>"
							 + "<a class=\"btn-delete\">×</a>"
							 + "</li>";
		$(".item-activated").removeClass("item-activated").addClass("item-deactivated");
		$("#chatroom-left-userlist").append(innerhtml);
		$(".item-activated>.id").text($("#user-username").text());

		innerhtml = "<div id=\"target-message-"+$("#userId").val()+"\" class=\"target-message\"></div>";
		$("#chatroom-right").append(innerhtml);

		$.post("../../jsp/doAddChatPerson.jsp",
                {"to":$("#userId").val()},
                function(data, status, xhr){
                	alert("a");
                    // location.reload();
                })
    .error(function(data,status,e){
    });

	})

	function msgSend(){
		var username=$.cookie("zhao_ren_token");
		if(username !=null && username!=""){
			if($("#message").val() != "" && $("#message").val() != null)
				send(username,target,$("#message").val());
			else
				$("#message").attr("placeholder","消息不能为空");
			$("#message").val("");
		}else{
			alert("请登录");
		}
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
