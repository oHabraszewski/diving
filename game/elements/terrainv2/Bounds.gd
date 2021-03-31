extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var colliders_height = 0
var colliders_distance = 0

signal colision_right()
signal colision_left()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func recalculate(height: int, distance: int ):#wyliczanie jak maja przebiegac granice
	var colision_shape = SegmentShape2D.new()
	colision_shape.a = Vector2(0, 0)
	colision_shape.b = Vector2(0, height)
	$Area2DLeft/CollisionShape2D.shape = colision_shape
	$Area2DRight/CollisionShape2D.shape = colision_shape
	$Area2DLeft/CollisionShape2D.position.x += distance + 100
	$Area2DRight/CollisionShape2D.position.x -= 100 
	
func move_right(movement: int):
	self.position.x += movement
	
func move_left(movement: int):
	self.position.x -= movement	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2DRight_body_entered(body):
	emit_signal("colision_left")
	pass # Replace with function body.


func _on_Area2DLeft_body_entered(body):
	emit_signal("colision_right")
	pass # Replace with function body.
