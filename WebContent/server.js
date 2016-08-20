/**
 * Created by zhao.ren on 2016/4/13.
 */
var WebSocketServer = require('ws').Server;
var wss = new WebSocketServer({port:8000});
var mysql = require('mysql');
var conn = mysql.createConnection({
	host: 'kaitohh.com',
	user: 'root',
	password: 'zhao.ren.admin',
	database: 'zhao_ren'
});

conn.connect();

var clientList = {};

wss.on('connection', function(ws) {
	ws.on('message', function(m){
		console.log(m);
		var data = JSON.parse(m);

		if (!data.cmd) {
			ws.send(JSON.stringify({
				error: 'cmdError'
			}));
		} else if (data.cmd == 'login') {
			if (!data.clientId) {
				return;
			}
			var clientId = data.clientId;
			clientList[clientId] = ws;
			ws.clientId = clientId;
			
			conn.query(
				'select * from user_chat where user_id = "' + clientId 
+ '" or from_id = "' + clientId + '" limit 10;', function(err, result) {
				if (err) {
					console.log(err);
				}
				for(var num in result) {
					var history = result[num];
				  var jsonData = {
						msg: history.content,
						timestamp: history.time
					}
					if (clientId == history.user_id){
						jsonData.fromClientId = history.from_id;
					} else {
						jsonData.toClientId = history.user_id;
					}
					ws.send(JSON.stringify(jsonData));
					console.log(jsonData);
				}
			});

			console.log(Object.keys(clientList));
		} else if (data.cmd == 'msg') {
			var toClientId = data.toClientId;
			var clients = Object.keys(clientList);
			var fromClientId = ws.clientId;

			var w = ws;
			if (!w) {
				console.log("ws empty");
				return;
			}
			var time = new Date().getTime();
			w.send(JSON.stringify({
				toClientId: toClientId,
				msg: data.msg,
				timestamp: time
			}));
			conn.query(
				'insert into user_chat(user_id, from_id, content, time) values('+toClientId+','+fromClientId+',"'+data.msg +'",from_unixtime('+time+'/1000));'
				
			, function (err) {
					if (err) {
						console.log(err);
						throw err;
					}
				});
			if (clientList[toClientId]) {
				console.log('send msg to client');	
				w = clientList[toClientId];		
				w.send(JSON.stringify({
					fromClientId: fromClientId,
					msg: data.msg,
					timestamp: Date.parse(new Date()) 
				}));

			}  
		}
	});

	ws.on("close", function(e) {
		var clients = Object.keys(clientList);
		for (var i=0;i<clients.length;i++) {
			if (clientList[clients[i]] == ws) {
				clientList[clients[i]] = null;
				console.log(clients[i] + ' disconnect');
			}
		}
	});

});

