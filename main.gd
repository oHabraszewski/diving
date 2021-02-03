extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_Button_pressed():
	$CanvasLayer2/terrain2.position.x = $CanvasLayer2/terrain.position.x + $CanvasLayer2/terrain.length
	$CanvasLayer2/terrain2.position.y = $CanvasLayer2/terrain.position.y
	print("terrain.pos: ", $CanvasLayer2/terrain.position)
	print("terrain2.pos: ", $CanvasLayer2/terrain2.position)
	pass # Replace with function body.
