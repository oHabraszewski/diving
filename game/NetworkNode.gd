extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if OS.get_name() == "HTML5":
		# kod do komunkacji z serverem tu
		
		pass
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
