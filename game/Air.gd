extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var shape = SegmentShape2D.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _player_moved(player):
	shape.a = Vector2(player.position.x - 250, 10)
	shape.b = Vector2(player.position.x + 250, 10)
	$Area2D/CollisionShape2D.shape = shape
	pass
