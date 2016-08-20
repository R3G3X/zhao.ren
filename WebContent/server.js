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
			try {
				ws.send(JSON.stringify({
					error: 'cmdError'
				}));
			} catch(error) {
				console.log(error);
			}
		} else if (data.cmd == 'login') {
			if (!data.clientId) {
				return;
			}
			var clientId = data.clientId;
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
									try {
										ws.send(JSON.stringify(jsonData));
									} catch (error) {
										console.log(error);
									}
									console.log(jsonData);
								}
							});
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
			try{
				w.send(JSON.stringify({
					toClientId: toClientId,
					msg: data.msg,
					timestamp: time
				}));
			} catch(error) {
				console.log(error);
			}
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
				try{
					w.send(JSON.stringify({
						fromClientId: fromClientId,
						msg: data.msg,
						timestamp: Date.parse(new Date()) 
					}));
				} catch (error) {
					console.log(error);
				}
			}  
		}
	});

	ws.on("close", function(e) {
		console.log(ws.clientId + ' disconnect');
		delete clientList[ws.clientId];
	});
});

