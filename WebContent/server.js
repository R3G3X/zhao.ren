var WebSocketServer = require('ws').Server;
var wss = new WebSocketServer({port:8000});
var mysql = require('mysql');

var clientList = {};
var sendJson = function(ws, msg) {
	try {
		ws.send(JSON.stringify(msg));
	} catch (error) {
		console.log(error);
	}
}

wss.on('connection', function(ws) {
	ws.on('message', function(m){
		console.log(m);
		var data = JSON.parse(m);

		if (!data.cmd) {
			sendJson(ws, {error: 'cmdError'});
		} else if (data.cmd == 'login') {
			ws.conn = mysql.createConnection({
				host: 'kaitohh.com',
				user: 'root',
				password: 'zhao.ren.admin',
				database: 'zhao_ren'
			});
			ws.conn.connect(function(err) {
				if (err) {
					console.log(err);
				}
				if (!data.clientId) {
					return;
				}
				var clientId = data.clientId;
				if (clientList[clientId]) {
					clientList[clientId].close();
					delete clientList[clientId];
				}
				clientList[clientId] = ws;
				ws.clientId = clientId;
				var peerList = [];
				conn.query('select user_id from user_chat_list where to_id = "'+clientId+'"',
					function(err, result) {
						console.log(result);
						if (err) {
							console.log(err);
						}
						for(var num in result) {
							peerList.push(result[num].user_id);
						};
						for (var i=0;i<peerList.length;i++) {
							conn.query(
								'select * from user_chat where user_id = "' + clientId
								+ '" and from_id = "' + peerList[i] + '" or user_id = "' + peerList[i]
								+ '" and from_id = "' + clientId
								+ '" order by time DESC limit 10;', function(err, result) {
									if (err) {
										console.log(err);
									}
									for(var num in result) {
										var history = result[result.length-1-num];
										var jsonData = {
											msg: history.content,
											timestamp: history.time
										};
										if (clientId == history.user_id){
											jsonData.fromClientId = history.from_id;
										} else {
											jsonData.toClientId = history.user_id;
										}
										sendJson(ws, jsonData);

										if (clientId == history.user_id
											&& clientId == history.from_id) {
											delete jsonData.fromClientId;
											jsonData.toClientId = history.user_id;
											sendJson(ws, jsonData);
										}
									}
								});
						}
					});
				console.log(Object.keys(clientList));
			});
		} else if (data.cmd == 'msg') {
			var toClientId = data.toClientId;
			var clients = Object.keys(clientList);
			var fromClientId = ws.clientId;

			var w = ws;
			var time = new Date().getTime();
			sendJson(w, {
				toClientId: toClientId,
				msg: data.msg,
				timestamp: time
			});
			conn.query(
				'insert into user_chat(user_id, from_id, content, time) values('+
				toClientId+','+fromClientId+',"'+data.msg +'",from_unixtime('+time+'/1000));'
			, function (err) {
					if (err) {
						console.log(err);
						throw err;
					}
				});
			console.log('send msg to client');
			w = clientList[toClientId];
			sendJson(w, {
				fromClientId: fromClientId,
				msg: data.msg,
				timestamp: Date.parse(new Date())
			});
		}
	});

	ws.on("close", function(e) {
		console.log(ws.clientId + ' disconnect');
		ws.conn.end(function(err) {
			if (err) {
				console.log(err);
			}
			delete clientList[ws.clientId];
		});
	});
});
