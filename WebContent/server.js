/**
 * Created by zhao.ren on 2016/4/13.
 */
var WebSocketServer = require('ws').Server;
var wss = new WebSocketServer({port:8000});

var clientList = {};
var offlineMsg = {};

wss.on('connection', function(ws) {
	ws.on('message', function(m){
		var data = JSON.stringify(m);
		if (!data.cmd) {
			ws.send(JSON.stringify({
				error: 'cmdError'
			}));
		} else if (data.cmd == 'login') {
			var clientId = data.clientId;
			//TODO: token
			clientList[clientId] = ws;
			if (offlineMsg[clientId]) {
				for (var i=0;i<offlineMsg[clientId].length;i++) {
					ws.send(JSON.stringify(offlineMsg[clientId][i]));
				}
				offlineMsg[clientId] = null;
			}
		} else if (data.cmd == 'msg') {
			var fromClientId = data.fromClientId;
			var toClientId = data.toClientId;
			var w = clientList[toClientId];
			if (!clientList[toClientId]) {			
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

	ws.on('close', function(ws) {
		var clients = Object.keys(clientList);
		for (var i=0;i<clients.length;i++) {
			if (clientList[clients[i]] == ws) {
				clientList[clients] = null;
			}
		}
	});
});

