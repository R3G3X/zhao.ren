console.log('start test');
var url = 'ws://localhost:8000';
websocket = new WebSocket(url);
websocket.onopen = function(e){
	websocket.send('hello');
}