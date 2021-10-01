extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal pressed()
signal released()
signal moved(direction) #Returns normalized vector with direction of movemnt
signal moved_raw(direction) # Return raw position of "stick" 


export(Color) var stick_color = Color(0.0, 0.25, 0.6)
export(Color) var background_color = Color(0.3, 0.3, 0.3, 0.4)
export(Color) var stick_color_pressed = Color(0.0, 0.15, 0.4)
export(Color) var background_color_pressed = Color(0.2, 0.2, 0.2, 0.4)
var offset_pos
# Called when the node enters the scene tree for the first time.
func _ready():
	$Galka.color = stick_color
	$Tlo.color = background_color
	offset_pos = $Galka.global_position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			$Tlo.color = background_color_pressed
			$Galka.color = stick_color_pressed
			emit_signal("pressed")
		else:
			emit_signal("released")
			$Tlo.color = background_color
			$Galka.color = stick_color
			$Galka.position = Vector2(0,0)
	if event is InputEventScreenDrag:
		emit_signal("moved", $Galka.position.normalized())
		emit_signal("moved_raw", $Galka.position)
		var new_pos = event.position - offset_pos
		if new_pos.x > 100:
			new_pos.x = 100
		if new_pos.x < -100:
			new_pos.x = -100
		if new_pos.y > 100:
			new_pos.y = 100
		if new_pos.y < -100:
			new_pos.y = -100
		$Galka.position = new_pos
		
	pass
