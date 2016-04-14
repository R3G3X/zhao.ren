/**
 * Created by zhao.ren on 2016/4/13.
 */
var WebSocketServer = require('ws').Server;
var wss = new WebSocketServer({port:8000});

var clientList = {};
var offlineMsg = {};

wss.on('connection', function(ws) {
	ws.on('message', function(m){
		console.log(m);
		var data = JSON.parse(m);

		if (!data.cmd) {
			ws.send(JSON.stringify({
				error: 'cmdError'
			}));
		} else if (data.cmd == 'login') {
			var clientId = data.clientId;
			clientList[clientId] = ws;
			if (offlineMsg[clientId]) {
				for (var i=0;i<offlineMsg[clientId].length;i++) {
					ws.send(JSON.stringify(offlineMsg[clientId][i]));
				}
				offlineMsg[clientId] = null;
			}
			console.log(Object.keys(clientList));
		} else if (data.cmd == 'msg') {
			var toClientId = data.toClientId;
			var clients = Object.keys(clientList);
			var fromClientId = null;
			for (var i=0;i<clients.length;i++) {
				if (clientList[clients[i]] == ws) {
					fromClientId = clients[i];
				}
//			var w = clientList[fromClientId];
			var w = ws;
			if (!w) {
				console.log("ws empty");
				return;
			}
			w.send(JSON.stringify({
				toClientId: toClientId,
				msg: data.msg,
				timestamp: Date.parse(new Date())
			}));
			}
			if (clientList[toClientId]) {
				console.log('send msg to client');	
				w = clientList[toClientId];		
				w.send(JSON.stringify({
				fromClientId: fromClientId,
				msg: data.msg,
				timestamp: Date.parse(new Date()) 
				}));

			} else {
				if (!offlineMsg[toClientId]) {
					offlineMsg[toClientId] = [];
				}
				offlineMsg[toClientId].push({
					fromClientId: fromClientId,
					msg: data.msg,
					timestamp: Date.parse(new Date())
				});
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

