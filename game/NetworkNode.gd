extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _host = "ws://localhost:8080/api/websocket/broker"
var _connected = false
var web_socket = WebSocketClient.new()
var queue = []
signal data_received(data)
# Called when the node enters the scene tree for the first time.
func _ready():
	if not OS.get_name() == "HTML5":
		# kod do komunkacji z serverem tu
		web_socket.connect("connection_established", self, "_connect_esth_web_socket")
		web_socket.connect("connection_error", self, "_error_web_socket")
		web_socket.connect("data_received", self, "_data_received_web_socket")
		web_socket.connect("connection_closed", self, "_conn_cls")
		print("WebSocket: Connect-status=", web_socket.connect_to_url(_host, [], false))
#		print(web_socket.put_packet('{"event": "read_board"}'.to_utf8()))
#		print(String(web_socket.get_packet()))
#		print(web_socket.get_packet_error())
#		print(web_socket.get_peer(0))
		
		pass
	pass
	
#var message = {"event":"read_board", "payload":{}}
func _data_received_web_socket():
#	print(web_socket.get_peer(1).get_packet())
#	print_debug(JSON.parse(web_socket.get_peer(1).get_packet().get_string_from_utf8()).result["payload"])
	var res = JSON.parse(web_socket.get_peer(1).get_packet().get_string_from_utf8())
	emit_signal("data_received", res.result)
#	print("datda received")
	pass
func send_message(message : Dictionary):
#	print(to_json(message))
	if web_socket.get_peer(1).is_connected_to_host():
		print(web_socket.get_peer(1).put_packet(PoolByteArray(to_json(message).to_utf8())))
	else:
		$Timer.start()
		$Timer.connect("timeout", self, "_queue_send")
		queue.push_back(message)
	pass
func _queue_send():
	print("sending:", web_socket.get_peer(1).put_packet(PoolByteArray(to_json(queue.pop_front()).to_utf8())))
#	print("awitaing")
	if queue.size() == 0:
		$Timer.stop()
	pass
func _connect_esth_web_socket(protocol):
	_connected = true
	print("ASd")
	print("WebSocket: Conn-ETH", protocol)
	web_socket.get_peer(1).set_write_mode(WebSocketPeer.WRITE_MODE_TEXT)
#	print(web_socket.get_peer(1).get_packet().get_string_from_utf8())
	pass
func _error_web_socket():
	_connected = false
	print("WebSocket: Error")
	pass
func _conn_cls():
	_connected = false
	print("WebSocket: Closed")
	pass
func _process(delta):
	web_socket.poll()
	pass
#	OS.has_feature()
#	print(JavaScript.eval("console.log(document.cookie)"))
#	var http_request = HTTPRequest.new()
#	add_child(http_request)
#	http_request.connect("request_completed", self, "_http_request_completed")
#	var error = http_request.request("https://httpbin.org/get")
#	if error != OK:
#		push_error("An error occurred in the HTTP request.")
#	var body = {"name": "Godette"}
#	error = http_request.request("https://httpbin.org/post", [], true, HTTPClient.METHOD_POST, String(body))
#	if error != OK:
#		push_error("An error occurred in the HTTP request.")
#	pass # Replace with function body.
## Called when the HTTP request is completed.
#func _http_request_completed(result, response_code, headers, body):
#	var response = parse_json(body.get_string_from_utf8())
#	# Will print the user agent string used by the HTTPRequest node (as recognized by httpbin.org).
#	print(response)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
