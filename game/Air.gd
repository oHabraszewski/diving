extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var shape = SegmentShape2D.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func player_moved(player):
	self.position.x = player.position.x
	pass
