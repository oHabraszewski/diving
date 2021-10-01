extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal bbenter()
signal bbexit()
var bubbling = true
var emit_time
var silent_time
# Called when the node enters the scene tree for the first time.
func _ready():
	bubbling = randi() % 2
	silent_time = (randi() % 300) * 0.1
	emit_time = (randi() % 150) * 0.1
	print(emit_time, "  ,   ", silent_time)
	$Particles2D.emitting = bubbling
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Bubbles_area_entered(area):
#	print("player entered")
	if bubbling:
		emit_signal("bbenter")
	pass # Replace with function body.


func _on_Bubbles_area_exited(area):
	if bubbling:
		emit_signal("bbexit")
	pass # Replace with function body.


func _on_Timer_timeout():
	if bubbling:
		$CollisionShape2D.shape = null
		$Particles2D.emitting = false
		$Timer.wait_time = silent_time
		$Timer.start()
	else:
		var asd = RectangleShape2D.new()
		asd.extents = Vector2(35, 100)
		$CollisionShape2D.shape = asd
		$Particles2D.emitting = true
		$Timer.wait_time = emit_time
		$Timer.start()
	bubbling = !bubbling
	pass # Replace with function body.
