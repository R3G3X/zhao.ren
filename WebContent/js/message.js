var socketServer = "ws://kaitohh.com:8000";
// var socketServer = "ws://localhost:8000";
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
			$("#target-message-"+$(".item-activated>input").val()).append(innerhtml);


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
		div = clientFrom;
		$(".target-message").removeClass("hidden");
		$(".target-message").css("visibility","hidden");
		$("#target-message-"+div).append(innerhtml);
		substr = messageGet;
		for(var i = 0; i < index - 1; i++){
			$("#target-message-"+div+" ."+i+":last").text(substr.substring(0,substr.indexOf("\n")));
			substr = substr.substring(substr.indexOf("\n")+1,substr.length);
		}
		$("#target-message-"+div+" ."+i+":last").text(substr);
		$("#target-message-"+div+" .message-box:last").height($("#target-message-"+div+" .message-box:last").children().outerHeight()+25);
		$(".target-message").addClass("hidden");
		$(".target-message").css("visibility","");
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
	var target=$(".item-activated>input").val();
	if(username !=null && username!="")
		$("#btn-chat").removeClass("hidden");
	$("#target-message-"+target).removeClass("hidden");
		$("#toName").text($(".item-activated>.id").text());
	start(username);

	$("#btn-send").click(function(){
		msgSend();
	})

	$('#message').keydown(function(e){
		var theEvent = event || e;
		if(e.keyCode==13 && !e.ctrlKey){
			// if(event.returnValue)
			// 	event.returnValue = false;
			// else
			theEvent.returnValue = false;
			theEvent.preventDefault();
			msgSend();
		}else if(e.keyCode == 13 && e.ctrlKey){
			// if(event.returnValue)
			// 	event.returnValue = false;
			// else
			theEvent.returnValue = false;
			theEvent.preventDefault();
			var obj = document.getElementById("message");
			if(document.selection){
				var range = document.selection.createRange();
				range.text = "\r";
			}
			if(document.getSelection)
			{
				var start = obj.selectionStart;
				var end = obj.selectionEnd;
				obj.value = obj.value.substr(0, start) +"\r" + obj.value.substring(end, obj.value.length);
			}
		}else{
			$("#message").attr("placeholder","")
		}
	  });
	$("#btn-chat").click(function(){
		$(this).addClass("hidden");
		$("#chatroom").css("visibility","visible");
		$(".target-message").slice(0,1).removeClass("hidden");
	})
	$("#btn-minimize").click(function(){
		$("#btn-chat").removeClass("hidden");
		$("#chatroom").css("visibility","hidden");
	})
	$("#user-Message>a").click(function(){
		var to = $("#userID").val();
		var flag = 0;
		var a = $(".userId[value='"+to+"']");
		if(a.length>0)
			flag = 1;
		if(flag == 0){
			var innerhtml = "";
			innerhtml += "<li class=\"chatroom-left-userlist-item item-activated\">"
								 + "<a class=\"id\"></a>"
								 + "<input class=\"userId\" type=\"hidden\" value=\""+to+"\"/>"
								 + "<a class=\"btn-delete\">×</a>"
								 + "</li>";
			$(".item-activated").removeClass("item-activated").addClass("item-deactivated");
			$("#chatroom-left-userlist").append(innerhtml);
			$(".item-activated>.id").text($("#user-username").text());
			$(".target-message").addClass("hidden");
			innerhtml = "<div id=\"target-message-"+to+"\" class=\"target-message\"></div>";
			$("#message-input").before(innerhtml);

			$.post("../../jsp/doAddChatPerson.jsp",
	                {"to":$("#userID").val()},
	                function(data, status, xhr){
	                    // location.reload();
	                })
	    .error(function(data,status,e){
	    });
		}else{
			$(".item-activated").removeClass("item-activated").addClass("item-deactivated");
			var a;
			$(".userId[value='"+to+"']").parent().addClass("item-activated");
			$(".target-message").addClass("hidden");
		}
			target=to;

		$("#target-message-"+target).removeClass("hidden");
		$("#toName").text($(".item-activated>.id").text());
		$("#btn-chat").addClass("hidden");
		$("#chatroom").css("visibility","visible");
	})

	$(document).on("click", ".id", function(){
		$(".item-activated").removeClass("item-activated").addClass("item-deactivated");
		$(this).parent().removeClass("item-deactivated").addClass("item-activated");
		$(".target-message").addClass("hidden");

		target=$(this).next().val();

		$("#target-message-"+target).removeClass("hidden");
		$("#toName").text($(this).text());
	})

	$(document).on("click",".btn-delete", function(){
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
                {"target":$(this).prev("input").val()},
                function(data, status, xhr){
                    // location.reload();
                })
    .error(function(data,status,e){
    });
		$(this).parent().remove();
	})

	function msgSend(){
		var username=$.cookie("zhao_ren_token");
		if(username !=null && username!=""){
			var str = $.trim($("#message").val());
			if(str != "" && str != null){
				send(username,target,$("#message").val());
				$("#message").val("");
			}else{
				$("#message").val("");
				$("#message").attr("placeholder","消息不能为空");
			}
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
